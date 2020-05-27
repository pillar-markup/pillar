Extension { #name : #ClyPackageCommentEditorToolMorph }

{ #category : #'*Pillar-Calypso' }
ClyPackageCommentEditorToolMorph class >> new [
	"A hack to swap in the RichText versions of the tools. "
	^ ClyPackageRichTextCommentEditorToolMorph  basicNew initialize
]
