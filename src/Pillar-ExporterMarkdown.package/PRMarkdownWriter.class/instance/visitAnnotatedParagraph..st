visiting-document
visitAnnotatedParagraph: anAnnotatedParagraph
	"Annotations need to be defined as block quotes. For example...
		@@note 
		@@dothis
	could have...
	 	> Note:
		> DoThis:
	"

	canvas writeBlockQuoteDuring: [
		canvas
			bold: anAnnotatedParagraph annotation;
			raw: ': '.
		self visitParagraph: anAnnotatedParagraph
	]