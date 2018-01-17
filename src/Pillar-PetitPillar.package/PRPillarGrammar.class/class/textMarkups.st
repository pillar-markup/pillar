accessing
textMarkups
	| markups |
	markups := Dictionary new.
	markups
		at: PRBoldFormat put: '""';
		at: PRItalicFormat put: '''''';
		at: PRMonospaceFormat put: '==';
		at: PRStrikethroughFormat put: '--';
		at: PRSubscriptFormat put: '@@';
		at: PRSuperscriptFormat put: '^^';
		at: PRUnderlineFormat put: '__';
		at: PRFigure put: '+';
		at: PRLink put: '*';
		at: PRCodeblock put: '[[[';
		at: PRRaw put: '{{{';
		at: PRAbstractAnnotation put: '${'.
	^ markups