grammar - Annotation
annotationTag
	^ super annotationTag
		==> [ :array | PRAbstractAnnotation findClassAcceptingTag: (self stringFrom: array) ]