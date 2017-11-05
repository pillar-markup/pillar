*Pillar-Pharo-Tools
gtInspectorPillarCommentIn: composite
	"This provides an editable comment of the current class"
	<gtInspectorPresentationOrder: 40>
	composite custom: (GLMRubricHighlightedTextPresentation new
		editingMode: [ : rubPresentation |
			GLMHighlighterTextRubEditingMode withStylerDecorator: (
				GTPillarHighlighterTextDecorator 
					inPresentation: rubPresentation
					fileReference: self)];
		title: 'Pillar comment';
		display: [ self comment ];
		act: [ :text | 
			self comment: text text ]
			icon: GLMUIThemeExtraIcons glamorousAccept 
			on: $s
			entitled: 'Accept')