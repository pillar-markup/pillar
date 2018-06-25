grammar - Document
content
	^ super content ==> [ :array | array second ifNil: [ {array first} ] ifNotNil: [ array ] ]