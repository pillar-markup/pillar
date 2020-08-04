Extension { #name : #PRRichTextWriterTest }

{ #category : #'*Pillar-Model' }
PRRichTextWriterTest >> testSuperscriptFormat [
	self assertWriting: sample superscript include: self superscriptFormat
]

{ #category : #'*Pillar-Model' }
PRRichTextWriterTest >> testUnderlineFormat [ 
	self assertWriting: sample underline include: self underlineFormat
]
