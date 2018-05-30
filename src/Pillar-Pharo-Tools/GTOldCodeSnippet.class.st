"
This is a utility parser that identifies old style of code formatting (= at the beginning of the line) and transforms it into the new format ([[[ ... ]]])
"
Class {
	#name : #GTOldCodeSnippet,
	#superclass : #PPCompositeParser,
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #accessing }
GTOldCodeSnippet >> start [
	| separator snippet islandSnippet |
	separator := #newline asParser , $= asParser.
	snippet := (separator, #newline asParser negate star flatten ==> #third) plus ==> [:t | 
		String cr, '[[[', String cr, (String cr join: t), String cr, ']]]' ].
	islandSnippet := snippet island ==> [ :t | String new join: t ].
	^ islandSnippet star ==> [ :t | String new join: t ]
]
