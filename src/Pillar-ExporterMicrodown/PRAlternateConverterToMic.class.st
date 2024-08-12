Class {
	#name : 'PRAlternateConverterToMic',
	#superclass : 'PRConverterToMic',
	#category : 'Pillar-ExporterMicrodown',
	#package : 'Pillar-ExporterMicrodown'
}

{ #category : 'conversion' }
PRAlternateConverterToMic >> microdownWriter [

	^ PRAlternateSlideMicrodownWriter
]
