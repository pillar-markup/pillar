"
This is a utility parser that identifies old style of code formatting (= at the beginning of the line) and transforms it into the new format ([[[ ... ]]])
"
Class {
	#name : #GTOldCodeSnippet,
	#superclass : #PP2CompositeNode,
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #accessing }
GTOldCodeSnippet >> start [
	| separator snippet islandSnippet |
	separator := #newline asPParser , $= asPParser.
	snippet := (separator, #newline asPParser negate star flatten ==> #third) plus ==> [:t | 
		String cr, '[[[', String cr, (String cr join: t), String cr, ']]]' ].
	islandSnippet := snippet island ==> [ :t | String new join: t ].
	^ islandSnippet star ==> [ :t | String new join: t ]
]
