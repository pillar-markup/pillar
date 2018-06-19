accessing
prettyRename: aPath

	| basename |
	basename := aPath asFileReference basename.
	^ ((basename first asString capitalized), basename allButFirst) withoutPeriodSuffix 