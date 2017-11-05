visiting-annotations
visitFootnote: aFootnote
	footnoteID := footnoteID + 1.
	canvas tag
		name: 'sup';
		with: [ canvas tag
				name: 'a';
				parameterAt: 'href' put: '#footnote' , footnoteID asString;
				with: '[' , footnoteID asString , ']' ].
	noteDictionary at: footnoteID ifAbsentPut: aFootnote note