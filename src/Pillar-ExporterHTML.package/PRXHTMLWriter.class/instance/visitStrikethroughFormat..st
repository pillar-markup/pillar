visiting-document
visitStrikethroughFormat: aFormat
	canvas tag
		name: 'span';
		parameterAt: 'class' put: 'striked';
		with: [ self visitFormat: aFormat ]