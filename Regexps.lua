Preprocess = {
	{"(.*)|r$", "%1"},
	{"^|c[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9](.*)", "%1"},
}

ProcessedLines = {
	"%+(%d+) (%a[%a ]+)"
}
