tests
testScriptWithCaptionAndNotLabel
	| script |
	script := (PRCodeblock content: 'foo')
					caption: 'a caption';
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{listing}[float]{html}{a caption}' 'foo')