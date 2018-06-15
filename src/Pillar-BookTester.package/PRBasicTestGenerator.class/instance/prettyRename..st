accessing
prettyRename: aPath

	| basename |
	basename := aPath basename.
	^ ((basename first asString capitalized), basename allButFirst) withoutPeriodSuffix 