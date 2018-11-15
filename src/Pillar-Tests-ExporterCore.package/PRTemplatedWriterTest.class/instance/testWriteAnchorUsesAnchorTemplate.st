tests-templatefiles
testWriteAnchorUsesAnchorTemplate

	self
		assertTemplate: 'todo.mustache'
		writesValue: 'annotated paragraph'
		forNode: (PRAnnotatedParagraph withAll: #() annotation: 'todo')