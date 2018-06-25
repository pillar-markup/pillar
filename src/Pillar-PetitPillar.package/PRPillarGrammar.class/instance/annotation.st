grammar - Annotation
annotation
	self flag: #todo.	"An annotation should have the possibility to be outside of a paragraph."
	^	epsilonToken , 	
		(Markups at: PRAbstractAnnotation) asPParser , 
		annotationTag , 
		annotationParameters optional ,
		annotationEndMarkup , 
		epsilonToken ,
		#blank asPParser star