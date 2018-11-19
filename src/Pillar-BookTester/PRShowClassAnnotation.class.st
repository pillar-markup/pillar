"
I am an annotation used to show a Class defined in our system.

I am used in a PRDocument to include a PRCodeblock with the class description within it.

My parameters are: 
- class: the class name 

I am used as follows in a document:

	${showClass:class=MyClass}$
	
Note:
	Contrary to the loader or run annotations, there is a transformation going on here: a PRCodeblock is created in the end, so there is a need here to use a PRNodeTransformer subclass, PRShowClassTransformer.
"
Class {
	#name : #PRShowClassAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #accessing }
PRShowClassAnnotation class >> defaultParameterName [

	^ 'class'
]

{ #category : #accessing }
PRShowClassAnnotation class >> possibleParameters [

	^ #(class)
]

{ #category : #protected }
PRShowClassAnnotation class >> tag [

	^ #showClass
]

{ #category : #visiting }
PRShowClassAnnotation >> accept: aVisitor [

	aVisitor visitShowClassAnnotation: self
]

{ #category : #accessing }
PRShowClassAnnotation >> shownClassName [

	^ (self parameters at: #class) asSymbol
]
