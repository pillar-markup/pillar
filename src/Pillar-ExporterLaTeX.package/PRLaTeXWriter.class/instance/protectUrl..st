helpers
protectUrl: aString
	^ ((aString copyReplaceAll: '\' with: '\\') copyReplaceAll: '#' with: '\#') copyReplaceAll: '%' with: '\%'