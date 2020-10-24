Extension { #name : #PRRichTextComposerTest }

{ #category : #'*Pillar-Model' }
PRRichTextComposerTest >> testSuperscriptFormat [
	self assertWriting: sample superscript include: self superscriptFormat
]

{ #category : #'*Pillar-Model' }
PRRichTextComposerTest >> testUnderlineFormat [ 
	self assertWriting: sample underline include: self underlineFormat
]
