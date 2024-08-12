Class {
	#name : 'PRAlternateSlideMicrodownWriter',
	#superclass : 'PRMicrodownWriter',
	#category : 'Pillar-ExporterMicrodown',
	#package : 'Pillar-ExporterMicrodown'
}

{ #category : 'visiting - slides' }
PRAlternateSlideMicrodownWriter >> visitSlide: aPRSlide [

	canvas header: [ canvas text: aPRSlide title ] withLevel: 1.
	self visitDocumentGroup: aPRSlide.

]
