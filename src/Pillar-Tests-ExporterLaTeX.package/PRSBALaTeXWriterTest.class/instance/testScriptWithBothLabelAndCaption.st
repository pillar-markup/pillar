tests
testScriptWithBothLabelAndCaption
	| script |
	script := (PRCodeblock content: 'foo')
					label: 'myScript';
					caption: 'a caption';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float, label=myScript]{html}{a caption}' 'foo')