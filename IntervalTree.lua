-- Red-black trees:
-- Every node is red or black
-- Root is black
-- All leaves (nils) are black
-- If a node is red, both its children are black
-- For each node, all paths to descendant leaves containthe same number of black nodes

IntervalTree = {}

function IntervalTree.create()
	local RED = true
	local BLACK = false
	local sentinel = {}
	sentinel.parent = sentinel
	sentinel.left = sentinel
	sentinel.right = sentinel
	sentinel.color = BLACK
	local tree = { root = sentinel }

	local function successor(node)
		if node.right ~= sentinel then
			node = node.right
			while node.left ~= sentinel do
				node = node.left
			end
			return node
		end
		local y = node.parent
		while y ~= sentinel and node == y.right do
			node = y
			y = y.parent
		end
		return y
	end

	local function findNode(start, stop)
		local node = tree.root
		while node ~= sentinel do
			if start < node.start then
				node = node.left
			elseif start > node.start then
				node = node.right
			elseif stop < node.stop then
				node = node.left
			elseif stop > node.stop then
				node = node.right
			else
				return node
			end
		end
		return sentinel
	end

	local function find(node, num)
		if node == sentinel or num > node.max then
			return {}
		end

		local results = {}

		for _, result in ipairs(find(node.left, num)) do
			table.insert(results, result)
		end

		if num >= node.start then
			if num <= node.stop then
				table.insert(results, node.value)
			end
			for _, result in ipairs(find(node.right, num)) do
				table.insert(results, result)
			end
		end

		return results
	end

	function tree.find(num)
		return find(tree.root, num)
	end

	function tree.findInterval(start, stop)
		return findNode(start, stop).value
	end

	local function rotateLeft(node)
		local x = node
		local y = x.right

		x.right = y.left
		if y.left ~= sentinel then
			y.left.parent = x
		end
		y.parent = x.parent
		if x.parent == sentinel then
			tree.root = y
		elseif x == x.parent.left then
			x.parent.left = y
		else
			x.parent.right = y
		end
		y.left = x
		x.parent = y
		x.max = math.max(x.stop, x.left.max or 0, x.right.max or 0)
		y.max = math.max(y.stop, y.left.max or 0, x.right.max or 0)
	end

	local function rotateRight(node)
		local x = node
		local y = x.left

		x.left = y.right
		if y.right ~= sentinel then
			y.right.parent = x
		end
		y.parent = x.parent
		if x.parent == sentinel then
			tree.root = y
		elseif x == x.parent.right then
			x.parent.right = y
		else
			x.parent.left = y
		end
		y.right = x
		x.parent = y
		x.max = math.max(x.stop, x.left.max or 0, x.right.max or 0)
		y.max = math.max(y.stop, y.left.max or 0, x.right.max or 0)
	end

	local function insertFixup(node)
		local y
		while node.parent.color == RED do
			if node.parent == node.parent.parent.left then
				y = node.parent.parent.right
				if y.color == RED then
					node.parent.color = BLACK
					y.color = BLACK
					node.parent.parent.color = RED
					node = node.parent.parent
				elseif node == node.parent.right then
					node = node.parent
					rotateLeft(node)
				else
					node.parent.color = BLACK
					node.parent.parent.color = RED
					rotateRight(node.parent.parent)
				end
			else
				y = node.parent.parent.left
				if y.color == RED then
					node.parent.color = BLACK
					y.color = BLACK
					node.parent.parent.color = RED
					node = node.parent.parent
				elseif node == node.parent.left then
					node = node.parent
					rotateRight(node)
				else
					node.parent.color = BLACK
					node.parent.parent.color = RED
					rotateLeft(node.parent.parent)
				end
			end
		end
		tree.root.color = BLACK
	end

	function tree.insert(start, stop, value)
		local y = sentinel
		local x = tree.root
		while x ~= sentinel do
			y = x
			if start < x.start then
				x = x.left
			elseif start > x.start then
				x = x.right
			elseif stop < x.stop then
				x = x.left
			elseif stop > x.stop then
				x = x.right
			else
				for key, value in pairs(value) do
					if not x.value[key] then
						x.value[key] = {}
					end
					for k, v in pairs(value) do
						x.value[key][k] = v
					end
				end
				return
			end
		end
		local node = {
			start = start,
			stop = stop,
			max = stop,
			value = value,
			parent = y,
			left = sentinel,
			right = sentinel,
			color = RED,
		}
		if y == sentinel then
			tree.root = node
		elseif start < y.start then
			y.left = node
		else
			y.right = node
		end
		insertFixup(node)
		while node.parent ~= sentinel do
			if node.max > node.parent.max then
				node.parent.max = node.max
			end
			node = node.parent
		end
	end

	local function printNode(node)
		if node == sentinel or node == nil then
			io.write("nil")
			return
		end
		io.write("( ")
		printNode(node.left)
		io.write(", ")
		if node.color == RED then
			io.write("RED")
		else
			io.write("BLACK")
		end
		io.write(": " .. node.start .. "-" .. node.stop .. " = " .. tostring(node.value))
		io.write(", max = " .. node.max)
		io.write(", ")
		printNode(node.right)
		io.write(" )")
	end

	function tree.print()
		printNode(tree.root)
		print()
	end

	local function quotedString(str)
		return string.gsub(string.format("%q", str), "\n", "n")
	end

	local function varName(name)
		if type(name) == "number" then
			return string.format("[%d]", name)
		elseif type(name) == "string" then
			if string.find(name, "^[a-zA-Z][a-zA-Z0-9_]+$") then
				return name
			else
				return string.format("[%s]", quotedString(name))
			end
		elseif type(name) == "boolean" then
			return string.format("[%s]", tostring(name))
		else
			print("Unhandled name type: %q", type(name))
		end
	end

	local function fullPrintNode(node, name, indent)
		local indentStr
		if indent then
			indentStr = string.rep("\t", indent)
		else
			indent = 0
			indentStr = ""
		end

		print(string.format("%s%s = {", indentStr, varName(name)))

		local indexTable = {}
		for index, value in pairs(node) do
			if index ~= "parent" and value ~= sentinel and type(value) ~= "function" then
				table.insert(indexTable, index)
			end
		end
		table.sort(indexTable)

		for _, index in ipairs(indexTable) do
			local value = node[index]
			if type(value) == "string" then
				print(string.format("%s\t%s = %s,", indentStr, varName(index), quotedString(value)))
			elseif type(value) == "number" then
				value = string.gsub(string.format("%f", value), "%.?0+$", "")
				print(string.format("%s\t%s = %s,", indentStr, varName(index), value))
			elseif type(value) == "table" then
				if type(value.fullPrint) == "function" then
					value.fullPrint(index, indent + 1)
				elseif type(value.parent) == "table" then
					fullPrintNode(value, index, indent + 1)
				else
					sort(value, index, indent + 1)
				end
			elseif type(value) == "boolean" then
				print(string.format("%s\t%s = %s,", indentStr, varName(index), quotedString(value and "RED" or "BLACK")))
			else
				print(string.format("%s\tUnhandled value type: %q", indentStr, type(value)))
			end
		end
		if indent > 0 then
			print(string.format("%s},", indentStr))
		else
			print("}")
		end
	end

	function tree.fullPrint(name, indent)
		fullPrintNode(tree.root, name, indent)
	end

	function tree.check()
		if sentinel.color ~= BLACK then
			print("Sentinel's color is not black!")
			return false
		end
		if tree.root.color ~= BLACK then
			print("Root's color is not black!")
			return false
		end
		return true
	end

	return tree
end
