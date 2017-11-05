action
generateDoc
	| transformers |
	transformers := self allTransformers.
	stream
		lf;
		lf;
		nextPutAll: 'Transformers and keywords to disable them:';
		lf;
		lf.
	self generateDocumentationOf: transformers