"
I am an annotation used to show a method defined in our system.

I am used in a PRDocument to include a PRCodeblock with the method description within it.

My parameters are: 
- class: the class name 
- method: the method name

I am used as follows in a document:

	${showMethod:class=MyClass|method=myMethod}$
	
Note:
	Contrary to the loader or run annotations, there is a transformation going on here: a PRCodeblock is created in the end, so there is a need here to use a PRNodeTransformer subclass, PRShowMethodTransformer.
"
Class {
	#name : #PRShowMethodAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #accessing }
PRShowMethodAnnotation class >> defaultParameterName [

	^ 'method'
]

{ #category : #accessing }
PRShowMethodAnnotation class >> possibleParameters [

	^ #(method class)
]

{ #category : #accessing }
PRShowMethodAnnotation class >> tag [

	^ #showMethod
]

{ #category : #visiting }
PRShowMethodAnnotation >> accept: aVisitor [

	aVisitor visitShowMethodAnnotation: self
]

{ #category : #accessing }
PRShowMethodAnnotation >> shownClassName [

	^ (self parameters at: #class) asSymbol
]

{ #category : #accessing }
PRShowMethodAnnotation >> shownMethodName [

	^ (self parameters at: #method) asSymbol
]
