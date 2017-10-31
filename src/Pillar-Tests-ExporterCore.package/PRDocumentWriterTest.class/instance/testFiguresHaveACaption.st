tests
testFiguresHaveACaption
	| item caption filename |
	caption := 'A description'.
	filename := 'picture.png'.
	item := PRFigure new
		reference: 'file://' , filename;
		label: 'picture';
		add: (PRText content: caption);
		yourself.
	self
		assertWriting: item
		includesTexts:
			{(self figureBegin).
			filename.
			caption}