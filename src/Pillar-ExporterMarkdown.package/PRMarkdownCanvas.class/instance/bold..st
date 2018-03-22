accessing
bold: aText

	^ self
		raw: '**';
		raw: aText;
		raw: '**'