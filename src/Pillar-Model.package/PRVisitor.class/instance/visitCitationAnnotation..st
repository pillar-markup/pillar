visiting-annotations
visitCitationAnnotation: aCitation
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitCitationAnnotation vs visitCitation."
	self visitAnnotation: aCitation