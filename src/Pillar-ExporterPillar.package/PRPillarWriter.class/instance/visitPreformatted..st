visiting-document
visitPreformatted: aPreformatted
	self
		writeRawDuring: [ 
			aPreformatted children
				do: [ :child | 
					canvas raw: (self markupFor: aPreformatted).
					self visit: child.
					canvas newLine ] ]