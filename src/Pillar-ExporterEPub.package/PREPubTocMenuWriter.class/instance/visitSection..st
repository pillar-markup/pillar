visiting-document
visitSection: aSection
			counter := counter + 1.
			canvas tag
				name: 'navPoint';
				parameterAt: 'playOrder' put: counter;
				with: [ super visitDocumentGroup: aSection ]