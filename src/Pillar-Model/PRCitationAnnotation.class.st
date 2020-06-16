"
I am an annotation that represents a bibliographic citation.

```
	${cite:ref=Duca99a}$
```
	
My tag is: 'cite'.
- a ref with the key ""ref="" (required takes a reference in the LaTeX bib format)

### Examples: 
	`${cite:ref=Duca99a}$`
"
Class {
	#name : #PRCitationAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Pillar-Model-Document'
}

{ #category : #accessing }
PRCitationAnnotation class >> possibleParameters [
	^ #(ref)
]

{ #category : #protected }
PRCitationAnnotation class >> tag [
	^ #cite
]

{ #category : #visiting }
PRCitationAnnotation >> accept: aVisitor [

	^ aVisitor visitCitationAnnotation: self
]

{ #category : #printing }
PRCitationAnnotation >> asPillarParametersOn: aStream [
	self parameters
		at: 'ref'
		ifPresent: [ :v | self asPillarKey: 'ref' value: v on: aStream ]
]

{ #category : #testing }
PRCitationAnnotation >> isCitation [
	^true
]
