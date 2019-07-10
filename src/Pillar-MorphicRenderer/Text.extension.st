Extension { #name : #Text }

{ #category : #'*Pillar-MorphicRenderer' }
Text >> makeItalicFrom: start to: stop [

	^ self addAttribute: TextEmphasis italic from: start to: stop
]
