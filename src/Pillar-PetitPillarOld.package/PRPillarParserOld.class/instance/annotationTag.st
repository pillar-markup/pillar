grammar - Annotation
annotationTag
	^ super annotationTag
		==> [ :array | | aTag |
				aTag := (self stringFrom: array).
				PRAbstractAnnotation 
					findClassAcceptingTag: aTag
					ifNone: [ PRSyntaxError signal: 'Pillar doesn''t support this tag : ''' , 
						aTag , ''' on his annotations.' ] ]