accessing
start
	| separator snippet islandSnippet |
	separator := #newline asPParser , $= asPParser.
	snippet := (separator, #newline asPParser negate star flatten ==> #third) plus ==> [:t | 
		String cr, '[[[', String cr, (String cr join: t), String cr, ']]]' ].
	islandSnippet := snippet island ==> [ :t | String new join: t ].
	^ islandSnippet star ==> [ :t | String new join: t ]