running
createMockClass
	"I create a Mock Phase that just do nothing on the input."

	PRNodeTransformer
		subclass: #PRMockPhase
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'Pillar-Tests-ExporterCore'.
	(Smalltalk globals at: #PRMockPhase) class
		compile:
			'priority
	^ 90'.
	(Smalltalk globals at: #PRMockPhase) class
		compile:
			'key
	^ #mock'.
	(Smalltalk globals at: #PRMockPhase) class
		compile:
			'pipelineKey
	^ #transform'.
	(Smalltalk globals at: #PRMockPhase)
		compile:
			'start: anInput
	^ super start: (anInput add: (PRText content: ''Bar''); yourself)'.
	(Smalltalk globals at: #PRMockPhase)
		compile:
			'visitDocumentGroup: aGroup
			aGroup add: (PRText content: ''Timoleon'')'.
	(Smalltalk globals at: #PRMockPhase)
		compile:
			'transformerMock: aCollection
			<pillarTransformer: 100 key: ''mock'' documentation:''mock transformer''>'