accessing
defaultEndMarkups
	| markups |
	markups := Dictionary new.
	markups
		at: PRAbstractAnnotation put: '}$';
		at: PRRaw put: '}}}';
		at: PRCodeblock put: ']]]'.
	^ markups