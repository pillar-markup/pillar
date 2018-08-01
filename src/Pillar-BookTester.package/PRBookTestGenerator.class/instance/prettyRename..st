accessing
prettyRename: aPath

	| basename |
	basename := aPath asFileReference basename.
	^ 'PRT',((basename first asString capitalized), basename allButFirst) withoutPeriodSuffix