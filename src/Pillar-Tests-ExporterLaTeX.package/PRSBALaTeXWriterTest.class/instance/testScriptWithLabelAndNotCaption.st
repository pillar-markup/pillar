tests
testScriptWithLabelAndNotCaption
	| script |
	script := (PRScript content: 'foo')
					label: 'myScript';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float, label=myScript]{html}{}' 'foo')