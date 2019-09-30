"
I am an annotation that mark the end of a 'columns' environment.

My tag is: 'endColumns'.

Example: ${endColumns}$ in

${columns}$

   ${column:width=60}$
      bla
   ${column:40}$
      bla

${endColumns}$
"
Class {
	#name : #PREndColumnsAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #testing }
PREndColumnsAnnotation class >> hasParameters [

	^ false
]

{ #category : #protected }
PREndColumnsAnnotation class >> possibleParameters [
	^ #()
]

{ #category : #protected }
PREndColumnsAnnotation class >> tag [ 
	^ #endColumns
]

{ #category : #visiting }
PREndColumnsAnnotation >> accept: aVisitor [
	^ aVisitor visitEndColumnsAnnotation: self
]
