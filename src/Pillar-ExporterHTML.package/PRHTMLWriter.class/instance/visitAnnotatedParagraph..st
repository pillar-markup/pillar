visiting-document
visitAnnotatedParagraph: anAnnotatedParagraph
	"Annotations need to be defined as CSS styles. For example...
		@@note 
		@@dothis
	could have...
	 	<head><style>
		p.note{colour:green}
		p.dothis{colour:red}
		</style></head> 
	"

	canvas tag
		name: 'p';
		parameterAt: 'class' put: anAnnotatedParagraph annotation;
		with: [ 
					"We call #visitParagraph: directly because we don't want 'self visitParagraph:' to be executed."
					super visitParagraph: anAnnotatedParagraph ]