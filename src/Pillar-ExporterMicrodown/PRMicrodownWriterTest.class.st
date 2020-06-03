Class {
	#name : #PRMicrodownWriterTest,
	#superclass : #TestCase,
	#category : #'Pillar-ExporterMicrodown'
}

{ #category : #tests }
PRMicrodownWriterTest >> testHeader [ 
	
	| builder text bloc text2 |
	"we should use this builder but the canvas"
	builder := MicroDownParser builder. 
	text := builder buildHeader: 'Hello Pharo'; contents.
	
	bloc := MicroDownParser new parse: text readStream.
	text2 := PRMicrodownWriter new start: bloc asPillar; contents.
	self assert: text equals: text2.
]
