"
An item selector for Spotter

Instance Variables
	icon:		<Object>

icon
	- xxxxx

"
Class {
	#name : #PRToolIconSelector,
	#superclass : #PRVisitor,
	#instVars : [
		'icon'
	],
	#category : 'Pillar-Pharo-Tools-Utilities'
}

{ #category : #testing }
PRToolIconSelector class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRToolIconSelector >> icon [
	^icon
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitAnchor: anObject [
	
	icon := PRToolIcons anchorIcon 
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitBoldFormat: anObject [

	icon := PRToolIcons boldIcon
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitEmptyParagraph: anObject [
	
	icon := PRToolIcons emptyParagraphIcon 
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitHeader: aHeader [

	aHeader level = 1 ifTrue: [ icon := PRToolIcons heading1Icon ].
	aHeader level = 2 ifTrue: [ icon := PRToolIcons heading2Icon ].
	aHeader level = 3 ifTrue: [ icon := PRToolIcons heading3Icon ].
	aHeader level = 4 ifTrue: [ icon := PRToolIcons heading4Icon ].
	aHeader level = 5 ifTrue: [ icon := PRToolIcons heading5Icon ].
	aHeader level = 6 ifTrue: [ icon := PRToolIcons heading6Icon ].
	aHeader level > 6 ifTrue: [ icon := PRToolIcons headingXIcon ].
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitItalicFormat: anObject [

	icon := PRToolIcons italicIcon  
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitListItem: anObject [

	icon := PRToolIcons listItemIcon
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitOrderedList: anObject [

	icon := PRToolIcons orderedList 
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitParagraph: anObject [
	
	icon := PRToolIcons paragraphIcon 
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitSubscriptFormat: anObject [

	icon := PRToolIcons subscriptIcon  
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitSuperscriptFormat: anObject [

	icon := PRToolIcons superscriptIcon 
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitTable: anObject [
	
	icon := PRToolIcons tableIcon 
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitTableCell: anObject [
	
	icon := PRToolIcons tableCellIcon
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitTableRow: anObject [
	
	icon := PRToolIcons tableRowIcon
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitText: anObject [

	icon := PRToolIcons textIcon  
]

{ #category : #'visiting-document' }
PRToolIconSelector >> visitUnorderedList: anObject [

	icon := PRToolIcons unorderedList 
]
