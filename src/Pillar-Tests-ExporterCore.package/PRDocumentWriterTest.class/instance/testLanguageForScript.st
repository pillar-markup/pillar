tests
testLanguageForScript
	| item smalltalk writer http |
	writer := self instance.
	item := PRCodeblock content: 'foo'.
	smalltalk := PRSmalltalkScriptLanguage new.
	http := PRHTTPScriptLanguage new.
	self assert: (writer languageForScript: item) class equals: PRUnspecifiedScriptLanguage.
	self configuration defaultScriptLanguage: smalltalk.
	self assert: (writer languageForScript: item) equals: smalltalk.
	item := (PRCodeblock content: 'foo') language: http.
	self assert: (writer languageForScript: item) equals: http