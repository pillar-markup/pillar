Extension { #name : #Text }

{ #category : #'*Pillar-MorphicRenderer' }
Text >> makeItalicFrom: start to: stop [

	^ self addAttribute: TextEmphasis italic from: start to: stop
]

{ #category : #'*Pillar-MorphicRenderer' }
Text >> makeNarrowFrom: start to: stop [

	^ self addAttribute: TextEmphasis narrow from: start to: stop
]

{ #category : #'*Pillar-MorphicRenderer' }
Text >> makeStruckOutFrom: start to: stop [

	^ self addAttribute: TextEmphasis struckOut from: start to: stop
]

{ #category : #'*Pillar-MorphicRenderer' }
Text >> makeUNormalFrom: start to: stop [

	^ self addAttribute: TextEmphasis normal from: start to: stop
]

{ #category : #'*Pillar-MorphicRenderer' }
Text >> makeUnderlinedFrom: start to: stop [

	^ self addAttribute: TextEmphasis underlined from: start to: stop
]
