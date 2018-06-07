accessing
plugins
	
	^ (self configuration propertyAt: #plugins ifAbsent: [ #() ])
			collect: [ :each | | plugin |
				plugin := Smalltalk globals
					at: each asSymbol
					ifAbsent: [ self error: 'Could not resolve plugin: ', each ].
				plugin withContext: self ]