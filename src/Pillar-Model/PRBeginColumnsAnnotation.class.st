"
I am an annotation that mark the beginning of a columns environement.

My tag is: 'columns''.

Example: ${columns}$ in

${columns}$

   ${column:width=60}$
      bla
   ${column:40}$
      bla

${endColumns}$
"
Class {
	#name : #PRBeginColumnsAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRBeginColumnsAnnotation class >> hasParameters [

	^ false
]

{ #category : #testing }
PRBeginColumnsAnnotation class >> possibleParameters [
	^ #()
]

{ #category : #protected }
PRBeginColumnsAnnotation class >> tag [
	^ #columns
]

{ #category : #visiting }
PRBeginColumnsAnnotation >> accept: aVisitor [
	^ aVisitor visitColumnsAnnotation: self
]
