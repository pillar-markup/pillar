visiting-document
visitPreformatted: aPreformatted
	canvas environment
		name: 'verbatim';
		with: [ 
					self
						writeRawDuring: [ 
							aPreformatted children
								do: [ :child | 
									self visit: child.
									canvas newLine ] ] ]