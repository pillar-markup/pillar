accessing
isOldInTarget: first
	
	| relative |
	relative := (first path relativeTo: origin path) pillarPrintString.
	^ (target / relative) entry modification > (origin / relative ) entry modification
	