"
I am an annotation used to load a github project in a given state.

I am used in a PRDocument in order to load a github project at a given tag.

My parameters are: 
- account : github account name
- project : github project name
- tag : github commit tag 

I am used as follows in a document:

	${loader:account=QDucasse|project=TestBook|tag=Chapter1}$
	
Note:
	The visit of this annotation is performed by the PRBookTesterVisitor in charge of visiting the document and therefore there is not a PRLoaderAnnotationTransformer defined for a simple reason, this annotation does not transform anything.
"
Class {
	#name : #PRLoaderAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #accessing }
PRLoaderAnnotation class >> possibleParameters [

	^ #(account project tag baseline)
]

{ #category : #accessing }
PRLoaderAnnotation class >> tag [

	^ #loader
]

{ #category : #visiting }
PRLoaderAnnotation >> accept: aVisitor [

	aVisitor visitLoaderAnnotation: self
]

{ #category : #visiting }
PRLoaderAnnotation >> account [

	^ self parameters at: #account
]

{ #category : #visiting }
PRLoaderAnnotation >> baseline [

	"The baseline name may be different than the project name but we make it the same by default"
	^ self parameters at: #baseline ifAbsent: [ self project ]
]

{ #category : #visiting }
PRLoaderAnnotation >> gitTag [
	"gitTag and not tag to avoid interfering with other methods with the same name"
	^ self parameters at: #tag
]

{ #category : #visiting }
PRLoaderAnnotation >> project [

	^ self parameters at: #project
]
