accessing
start
	| separator snippet islandSnippet |
	separator := #newline asParser , $= asParser.
	snippet := (separator, #newline asParser negate star flatten ==> #third) plus ==> [:t | 
		String cr, '[[[', String cr, (String cr join: t), String cr, ']]]' ].
	islandSnippet := snippet island ==> [ :t | String new join: t ].
	^ islandSnippet star ==> [ :t | String new join: t ]