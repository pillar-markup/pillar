comparing
= anObject
	"We use the method language to be sure that the language is a PRAbstractScriptLanguage and not a string."
	
	^ super = anObject
		and: [ 
			self language.
			anObject language.
			self parameters = anObject parameters ]