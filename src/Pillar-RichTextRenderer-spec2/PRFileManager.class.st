Class {
	#name : #PRFileManager,
	#superclass : #FileList,
	#instVars : [
		'validateButtonPane',
		'editorPresenter'
	],
	#category : #'Pillar-RichTextRenderer-spec2'
}

{ #category : #accessing }
PRFileManager >> editorPresenter: anEditorPresenter [
	editorPresenter := anEditorPresenter
]

{ #category : #'morphic ui' }
PRFileManager >> morphicValidateButton [
	^ SimpleButtonMorph new
		target: self;
		label: 'OK';
		actionSelector: #okAction
]

{ #category : #'morphic ui' }
PRFileManager >> morphicViewOnFile: aFile [
	| window fileListBottom midLine fileListTopOffset buttonPane fileContentsView |
	window := (SystemWindow labelled: self labelString) model: self.
	fileListTopOffset := TextStyle defaultFont pointSize * 2 + 11.
	fileListBottom := 0.4.
	midLine := 0.2.
	buttonPane := self optionalButtonRow addMorph: self morphicPatternPane.
	validateButtonPane := self optionalButtonRow addMorph: self morphicValidateButton.
	self
		addFullPanesTo: window
		from:
			{{self morphicDirectoryTreePane.
			(LayoutFrame identity rightFraction: midLine )}.
			{buttonPane.
			(LayoutFrame identity leftFraction: midLine ; bottomFraction: 0 ; bottomOffset: fileListTopOffset - 3)}.
			{self morphicFileListPane.
			(LayoutFrame identity leftFraction: midLine ; bottomFraction: fileListBottom ; topOffset: fileListTopOffset)}.
			{(fileContentsView := self morphicFileContentsPane).
			(LayoutFrame identity leftFraction: midLine ; topFraction: fileListBottom ; topOffset: fileListTopOffset)}.
			{validateButtonPane.
			(LayoutFrame identity leftFraction: midLine ; topFraction: fileListBottom)}.
			}.
	contents
		ifNotNil: [ fileContentsView setText: contents asText.
			fileContentsView hasUnacceptedEdits: true ].
	self postOpen.
	^ window
]

{ #category : #actions }
PRFileManager >> okAction [
	(self reference isFile) ifTrue: [ 
		editorPresenter openReference: self reference.
		 ]
	
	
]
