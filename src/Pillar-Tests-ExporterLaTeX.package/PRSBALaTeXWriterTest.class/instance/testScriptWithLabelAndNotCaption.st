tests
testScriptWithLabelAndNotCaption
	| script |
	script := (PRCodeblock content: 'foo')
					label: 'myScript';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float, label=myScript]{html}{}' 'foo')