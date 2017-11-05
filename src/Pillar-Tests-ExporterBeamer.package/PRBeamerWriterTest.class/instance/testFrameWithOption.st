tests
testFrameWithOption
	"For now the option are not activated."

	"
	| item |
	item := PRDocument new
		add: (PRSlideTitleAnnotation parameters: (PRParameterParser parse: 'title=Slide title|option=plain') yourself);
		add: (PRText content: 'Presentation text');
		yourself.
	self
		assertWriting: item
		includesTexts:
			{'\begin{frame}[plain]'.
			'\frametitle{Slide title}'.
			'Presentation text'.
			'\end{frame}'}"

	