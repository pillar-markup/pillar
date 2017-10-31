tests
testFrameWithoutOption
	| item |
	item := PRDocument new
		add: (PRSlide titled: 'Slide title');
		add: (PRText content: 'Presentation text');
		yourself.
	self
		assertWriting: item
		includesTexts:
			{'\begin{frame}[fragile]'.
			'\frametitle{Slide title}'.
			'Presentation text'.
			'\end{frame}'}