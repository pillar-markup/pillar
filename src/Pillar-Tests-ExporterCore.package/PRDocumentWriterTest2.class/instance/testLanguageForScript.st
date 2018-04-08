tests
testLanguageForScript
	| item smalltalk writer http |
	writer := self instance.
	item := PRCodeblock content: 'foo'.
	
	self assert: (writer languageForScript: item) class equals: PRUnspecifiedScriptLanguage. 
	
	
	smalltalk := PRSmalltalkScriptLanguage new.
	self configuration defaultScriptLanguage: smalltalk.
	self assert: (writer languageForScript: item) equals: smalltalk.
	
	http := PRHTTPScriptLanguage new.
	item := (PRCodeblock content: 'foo') language: http.
	self assert: (writer languageForScript: item) equals: http