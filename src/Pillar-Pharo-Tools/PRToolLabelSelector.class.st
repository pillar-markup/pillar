"
A visitor to display the correct label in spotter

Instance Variables
	label:		<String>

label
	- xxxxx

"
Class {
	#name : #PRToolLabelSelector,
	#superclass : #PRVisitor,
	#instVars : [
		'label'
	],
	#category : 'Pillar-Pharo-Tools-Utilities'
}

{ #category : #testing }
PRToolLabelSelector class >> isAbstract [
	^ false
]

{ #category : #accessing }
PRToolLabelSelector >> label [
	^ label
]

{ #category : #accessing }
PRToolLabelSelector >> label: anObject [
	label := anObject
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitAnchor: anObject [
	
	label := anObject name
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitCommentedLine: aCommentedLine [

	label := aCommentedLine text
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitEmptyParagraph: anObject [

	label := ''
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitOrderedList: anObject [

	label := '#... (', anObject children size asString, ')' 
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitTable: anObject [
	label := anObject rowCount asString, ' row(s) x ', anObject columnCount asString, ' column(s)'
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitText: anObject [

	label := anObject text
]

{ #category : #'visiting-document' }
PRToolLabelSelector >> visitUnorderedList: anObject [

	label := '-... (', anObject children size asString, ')' 
]
