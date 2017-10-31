visiting-document
visitSection: aSection
	canvas tag
		name: 'ol';
		with: [ super visitDocumentGroup: aSection ]