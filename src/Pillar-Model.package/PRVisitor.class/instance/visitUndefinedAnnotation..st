visiting-annotations
visitUndefinedAnnotation: aUndefinedAnnotation
	"Visiting an annotation means that we visit the textual representation of an annotation. Such annotations will be transformed into annotation object. The corresponding visit method will be invoked on such object : visitFootnoteAnnotation vs visitFootnote."
	^ self visitAnnotation: aUndefinedAnnotation