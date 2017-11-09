actions
actionOn: anInput
	^ (self class writers
		includes: ((anInput configuration propertyAt: #_outputFormat) writerFor: anInput configuration) class writerName)
		ifTrue: [ maxHeader := self maxHeaderOf: anInput input.
			super actionOn: anInput ]
		ifFalse: [ anInput ]