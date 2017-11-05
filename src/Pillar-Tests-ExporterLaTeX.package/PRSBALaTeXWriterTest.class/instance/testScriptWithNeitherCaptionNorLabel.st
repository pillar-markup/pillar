tests
testScriptWithNeitherCaptionNorLabel
	| script |
	script := (PRScript content: 'foo')
					language: PRHTMLScriptLanguage default;
					yourself.
	self assertWriting: script includesTexts: #('\begin{displaycode}{html}' 'foo')