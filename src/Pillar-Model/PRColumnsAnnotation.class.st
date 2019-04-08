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
	#name : #PRColumnsAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PRColumnsAnnotation class >> hasParameters [

	^ false
]

{ #category : #testing }
PRColumnsAnnotation class >> possibleParameters [
	^ #()
]

{ #category : #protected }
PRColumnsAnnotation class >> tag [
	^ #columns
]

{ #category : #visiting }
PRColumnsAnnotation >> accept: aVisitor [
	aVisitor visitColumnsAnnotation: self
]
