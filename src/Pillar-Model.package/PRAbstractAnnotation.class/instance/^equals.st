comparing
= anObject
	^ super = anObject and: [ 
		self parameters = anObject parameters and: [ 
			self hadAllKeys = anObject hadAllKeys and: [ 
				self isValid = anObject isValid ] ] ]