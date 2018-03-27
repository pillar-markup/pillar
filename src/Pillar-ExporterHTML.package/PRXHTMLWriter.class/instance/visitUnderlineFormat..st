visiting-document
visitUnderlineFormat: aFormat
	canvas tag
		name: 'span';
		parameterAt: 'class' put: 'underline';
		with: [ self visitFormat: aFormat ]