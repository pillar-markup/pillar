descriptions transcripted to chrysal
descriptionHeadingLevelOffset
	<magritteDescription>
	^ MANumberDescription new
		accessor: #headingLevelOffset;
		priority: 100;
		label:
				'Offset of Header counter.';
		cocoonDocumentation: 'Indicate how to convert from the level of a Pillar heading to the level of heading in your exported document.
	For example, a ==headingLevelOffset== of 3 converts a 1st level Pillar heading to an ==<h4>== in HTML.';
		beInteger;
		default: 0;
		min: 0 max: 6;
		yourself