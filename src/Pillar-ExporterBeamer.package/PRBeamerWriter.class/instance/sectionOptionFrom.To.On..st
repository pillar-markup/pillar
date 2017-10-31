helpers
sectionOptionFrom: level To: depth On: parameters
	parameters
		add:
			((1 > level and: [ 1 <= depth ])
				ifTrue: [ 'sectionstyle=show/show' ]
				ifFalse: [ 'sectionstyle=hide/hide' ]).
	parameters
		add:
			((2 > level and: [ 2 <= depth ])
				ifTrue: [ 'subsectionstyle=show/show/show' ]
				ifFalse: [ 'subsectionstyle=hide/hide/hide' ]).
	parameters
		add:
			((3 > level and: [ 3 <= depth ])
				ifTrue: [ 'subsubsectionstyle=show/show/show' ]
				ifFalse: [ 'subsubsectionstyle=hide/hide/hide' ])