accessing
configuration
	^ super configuration
		"we disable these phases as they pollute the tests"
		disabledPhases: #('sections'  'justKeepHeaders');
		yourself