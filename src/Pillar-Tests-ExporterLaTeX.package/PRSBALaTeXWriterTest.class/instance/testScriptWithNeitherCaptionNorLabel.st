tests
testScriptWithNeitherCaptionNorLabel
	| script |
	script := (PRCodeblock content: 'foo')
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{displaycode}{html}' 'foo')