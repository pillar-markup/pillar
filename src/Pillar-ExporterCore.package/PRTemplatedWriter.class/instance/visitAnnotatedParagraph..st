visiting
visitAnnotatedParagraph: anAnnotatedParagraph

	| arguments |
	arguments := { 'annotation' -> anAnnotatedParagraph annotation }.
	self
		write: anAnnotatedParagraph
		withTemplateFileName: anAnnotatedParagraph annotation , '.mustache'
		extraArguments: arguments 
		ifAbsent: [
			self
				write: anAnnotatedParagraph
				withTemplateFileName: self defaultAnnotatedParagraphTemplateFileName
				extraArguments: arguments 
				ifAbsent: [ defaultWriter visitAnnotatedParagraph: anAnnotatedParagraph ] ]