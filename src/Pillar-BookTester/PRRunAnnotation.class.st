"
I am an annotation used to run the tests of a given test class.

I am used in a PRDocument in order test already defined tests methods in a given test class.

My parameters are: 
- testClass : a test class you want to run

I am used as follows in a document:

	${run:testClass=ChapterTest}$
	
Note:
	The visit of this annotation is performed by the PRBookTesterVisitor in charge of visiting the document and therefore there is not a PRRunAnnotationTransformer defined for a simple reason, this annotation does not transform anything.
"
Class {
	#name : #PRRunAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-BookTester-Annotations'
}

{ #category : #accessing }
PRRunAnnotation class >> defaultParameterName [

	^ 'testClass'
]

{ #category : #accessing }
PRRunAnnotation class >> possibleParameters [

	^ #(testClass)
]

{ #category : #accessing }
PRRunAnnotation class >> tag [

	^ #run
]

{ #category : #visiting }
PRRunAnnotation >> accept: aVisitor [

	^ aVisitor visitRunAnnotation: self
]
