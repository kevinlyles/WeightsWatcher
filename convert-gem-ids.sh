#!/bin/bash

sed -e '/^\t\t\[3\] = {/{
	N
	s/{\n\t\t\t/{/
	: addline
	N
	s/,\n\t\t\t/, /
	t addline
	s/,\n\t\t}/}/}' gem-ids.lua > gem-ids-converted.lua

sed -i -e '/\[3\]/s/\({\|, \)\([a-z]\+\) = /\1["\2"] = /g' gem-ids-converted.lua

sed -i -e '/\[3\]/s/\["\([^"]\+\)"\]/[L["\1"]]/g' gem-ids-converted.lua

sed -i -e 's/^\t\t\[[1-3]\] = /\t\t/' gem-ids-converted.lua

sed -i -e 's/^/\t\t\t/' gem-ids-converted.lua
