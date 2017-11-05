grammar - Annotation
annotation
	self flag: #todo.	"An annotation should have the possibility to be outside of a paragraph."
	^ (Markups at: PRAbstractAnnotation) asParser , annotationTag , annotationParameters optional
		, annotationEndMarkup , #blank asParser star