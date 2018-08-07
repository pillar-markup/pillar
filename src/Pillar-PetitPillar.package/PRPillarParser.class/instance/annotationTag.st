grammar - Annotation
annotationTag
	^ super annotationTag
		==> [ :array | | aTagName |
				aTagName := self stringFrom: array.
				PRAbstractAnnotation 
					findClassAcceptingTag: aTagName
					ifNone: [ PRValidation strategy missingAnnotationSupport: aTagName ] ]