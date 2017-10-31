visiting-document
visitPreformatted: aPreformatted
	canvas tag
		name: 'pre';
		with: [ aPreformatted children do: [ :child | self visit: child ] separatedBy: [ canvas newLine ] ]