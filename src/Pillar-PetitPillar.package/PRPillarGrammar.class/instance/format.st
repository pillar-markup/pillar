grammar - Format
format
	self flag: 'Now a format can be empty (use of star instead of plus in these parsers). Do we really want this ? Some unit tests specify that a format can be empty but we can remove them'.
	^ monospaceFormat / boldFormat / italicFormat / underlineFormat / strikethroughFormat / subscriptFormat / superscriptFormat