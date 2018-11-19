"
I am an annotation used to show a screenshot of a given class and method.

I am used in a PRDocument to include a PRPicture and add a PNG file to the /figures chapter subfolder.

My parameters are: 
- package: the targetted package
- class: the targetted class
- method: the targetted method
- caption: the caption that will appear under my figure in the final book
- width: PRFigure width (as would be used in a more classic figure inclusion with +caption .>file|width=50)
- label: PRFigure label (as would be used in a more classic figure inclusion with +caption .>file|label=aa)

I am used as follows in a document:

	${screenshot:package=Kernel|class=Integer|method=+|caption='The Plus Method'|width=50|label=aa}$
	
Note:
	Contrary to the loader or run annotations, there is a transformation going on here: a PRFigure is created in the end, so there is a need here to use a PRNodeTransformer subclass, PRScreenshotTransformer.
"
Class {
	#name : #PRScreenshotAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #accessing }
PRScreenshotAnnotation class >> possibleParameters [

	^ #(class method caption width label)
]

{ #category : #accessing }
PRScreenshotAnnotation class >> tag [

	^ #screenshot
]

{ #category : #visiting }
PRScreenshotAnnotation >> accept: aVisitor [

	aVisitor visitScreenshotAnnotation: self
]

{ #category : #visiting }
PRScreenshotAnnotation >> caption [

	^ self parameters at: #caption ifAbsent: [ self className, '>>', self methodName ]
]

{ #category : #visiting }
PRScreenshotAnnotation >> className [

	^ self parameters at: #class
]

{ #category : #visiting }
PRScreenshotAnnotation >> label [

	^ self parameters at: #label ifAbsent: [ 'lab_', self methodName ]
]

{ #category : #visiting }
PRScreenshotAnnotation >> methodName [

	^ self parameters at: #method
]

{ #category : #visiting }
PRScreenshotAnnotation >> width [

	^ self parameters at: #width ifAbsent: [ 50 ]
]
