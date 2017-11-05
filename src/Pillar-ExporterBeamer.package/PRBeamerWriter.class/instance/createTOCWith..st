helpers
createTOCWith: aCollection
	|  parameters highlight |
	parameters := LinkedList new.
	"highlight := aCollection at: 'highlight' ifPresent: [ :param | param ] ifAbsent: [ false ].
	highlight = 1
		ifTrue: [ parameters add: 'currentsection, hideallsubsections' ]
		ifFalse: [ 
			highlight = 2
				ifTrue: [ parameters add: 'currentsection, currentsubsection' ]
				ifFalse: [ self sectionOptionFrom: (aCollection at: 'level') asInteger To: (aCollection at: 'depthLevel') asInteger On: parameters ] ]."
			self flag: #todo. "We need to change the highlight"
	canvas command
		name: 'tableofcontents';
		optParameter:
				(String streamContents: [ :s | parameters do: [ :each | s nextPutAll: each ] separatedBy: [ s nextPut: $, ] ])