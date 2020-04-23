"
I'm an abstract 

my subclasses have to define:

* columnTitle 
	returning a String 

* evaluateOn:aFileReference 
	return something in function of it's superClass 
	example 
		in FDBasenameFileReferenceColumn my subclass is FDAbstractStringTableColumn 
			so it will creat a SpStringTablePresenter so i have to return a String 
				here I'm asking to the fileReference is basename	
				
* addContraintTo: aTableColumn
	with this method you can add option like with 
		see SpTableColumn and subclass for more information
"
Class {
	#name : #FDAbstractFileReferenceColumn,
	#superclass : #Object,
	#category : #'FileDialog-FileTreeStrategie'
}

{ #category : #adding }
FDAbstractFileReferenceColumn class >> addContraintTo: aTableColumn [
	"I'm use to add option to column like width ... 
	look at class 
		SpTableColumn"
	self subclassResponsibility
]

{ #category : #accessing }
FDAbstractFileReferenceColumn class >> column [
	"I'm returning a SpTreeTableColumn"
	|column|
	column  := self tableColumnClass
		title: self columnTitle
		evaluated: self columnEvaluated.
	self addContraintTo: column.
	^ column
]

{ #category : #templateMethod }
FDAbstractFileReferenceColumn class >> columnEvaluated [
	^ [:selectedFileReference | self evaluateOn: selectedFileReference   ]
]

{ #category : #templateMethod }
FDAbstractFileReferenceColumn class >> columnTitle [
	"I'm returning a String"
	^ self subclassResponsibility
]

{ #category : #templateMethod }
FDAbstractFileReferenceColumn class >> evaluateOn: aFileReference [ 
	^ self subclassResponsibility
]

{ #category : #testing }
FDAbstractFileReferenceColumn class >> isAbstract [ 
	^ self = FDAbstractFileReferenceColumn
]

{ #category : #sorting }
FDAbstractFileReferenceColumn class >> sortValue [
	^ self subclassResponsibility
]

{ #category : #class }
FDAbstractFileReferenceColumn class >> tableColumnClass [
	"I'm returning a son of SpTreeTableColumn"
	^ self subclassResponsibility 
]
