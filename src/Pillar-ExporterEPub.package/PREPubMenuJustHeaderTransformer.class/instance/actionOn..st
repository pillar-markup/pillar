actions
actionOn: anInput
	^ (self class writers
		includes: anInput configuration outputType writerName)
		ifTrue: [ maxHeader := self maxHeaderOf: anInput input.
			super actionOn: anInput ]
		ifFalse: [ anInput ]