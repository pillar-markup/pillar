*Pillar-Pharo-Tools
gtInspectorPillarIn: composite
	<gtInspectorPresentationOrder: 40>
	(#('pier' 'pillar') includes: self extension)
		ifFalse: [ ^ self ].
	
	^ composite custom: (GLMRubricHighlightedTextPresentation new
		title: 'Pillar';
		editingMode: [ : rubPresentation |
			GLMHighlighterTextRubEditingMode withStylerDecorator: (
				GTPillarHighlighterTextDecorator 
					inPresentation: rubPresentation
					fileReference: self)];
		display: [ self readStreamDo: #contents ];
		act: [ :rub | 
			| newContents |
			newContents := GTOldCodeSnippet new parse: self contents.
			self 
				ensureDelete; 
				writeStreamDo: [ :s | s nextPutAll: newContents ].
			rub update ]
			entitled: 'Transform code snippets to new format';
		act: [:rub | 
			self 
				ensureDelete; 
				writeStreamDo: [ :s | s nextPutAll: rub text asString ]] 
			icon: GLMUIThemeExtraIcons glamorousSave 
			on: $s
			entitled: 'Save')