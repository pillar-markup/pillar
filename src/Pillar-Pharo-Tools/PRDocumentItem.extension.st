Extension { #name : #PRDocumentItem }

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorAsciiDocRepresentationIn: composite [
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'AsciiDoc';
		display: [ 
			(PRAsciiDocWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorBeamerRepresentationIn: composite [
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'Beamer';
		display: [ 
			(PRBeamerWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorDeckJSRepresentationIn: composite [
	<gtInspectorPresentationOrder: 51>
	composite text 
		title: 'DeckJS';
		display: [ 
			(PRDeckJSWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorHTMLRepresentationIn: composite [
	<gtInspectorPresentationOrder: 50>
	composite text 
		title: 'HTML';
		display: [ 
			(PRHTMLWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorLaTeXRepresentationIn: composite [
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'LaTeX';
		display: [ 
			(PRLaTeXWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorMarkdownRepresentationIn: composite [
	<gtInspectorPresentationOrder: 70>
	composite text 
		title: 'Markdown';
		display: [ 
			(PRMarkdownWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorPillarRepresentationIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite text 
		title: 'Pillar';
		display: [ 
			(PRPillarWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorSBALaTeXRepresentationIn: composite [
	<gtInspectorPresentationOrder: 80>
	composite text 
		title: 'LaTeX (sbabook)';
		display: [ 
			(PRSBALaTeXWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> gtInspectorTextRepresentationIn: composite [
	<gtInspectorPresentationOrder: 60>
	composite text 
		title: 'Text';
		display: [ 
			(PRTextWriter write: self) ]

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> inpectionHTMLWriter [
	<inspectorPresentationOrder: 30 title: 'HTML'>

	^ SpTextPresenter new 
		text: (PRHTMLWriter write: self);
		yourself
			

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> inpectionMicrodownWriter [
	<inspectorPresentationOrder: 20 title: 'MuDown'>

	^ SpTextPresenter new 
		text: (PRMicrodownWriter write: self);
		yourself
			

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> inpectionPillarWriter [
	<inspectorPresentationOrder: 35 title: 'Pillar'>

	^ SpTextPresenter new 
		text: (PRPillarWriter write: self);
		yourself
			

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> inpectionTextWriter [
	<inspectorPresentationOrder: 30 title: 'Text'>

	^ SpTextPresenter new 
		text: (PRTextWriter write: self);
		yourself
			

]

{ #category : #'*Pillar-Pharo-Tools' }
PRDocumentItem >> spotterForPillarDocumentFor: aStep [
	<spotterOrder: 40>
	aStep listProcessor 
		title: 'Children';
		candidatesLimit: Float infinity;
		allCandidates: [ self children ];
		itemName: [:item | (PRToolLabelSelector new)
									visit: item;
									label ];
		itemIcon: [:item | (PRToolIconSelector new)
									visit: item;
									icon ];
		matchSubstring
]
