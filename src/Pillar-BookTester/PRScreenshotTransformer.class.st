"
I am a transformer for the screenshot annotation.

I know how to  visit a screenshot annotation and the way to transform it.

I have two main purposes:
- I create a PRFigure with the annotation parameters
- I create a PNG file in the /figures subfolder (with the help of exportAsPNGForPillar)
"
Class {
	#name : #PRScreenshotTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'workingDirectory'
	],
	#category : 'Pillar-BookTester-Annotations'
}

{ #category : #'instance-creation' }
PRScreenshotTransformer class >> withContext: aContext [

	| inst |
	inst := super withContext: aContext.
	inst workingDirectory: aContext baseDirectory.
	^ inst
]

{ #category : #accessing }
PRScreenshotTransformer >> initialize [

	super initialize.
	workingDirectory := FileSystem workingDirectory
]

{ #category : #accessing }
PRScreenshotTransformer >> visitScreenshotAnnotation: aPRShowMethodAnnotation [
	
	| className methodName browser fileName figure time doc |
	className := self class environment at: (aPRShowMethodAnnotation className asSymbol).
	methodName := aPRShowMethodAnnotation methodName asSymbol.
	"naming the file as follows: className>>methodName-date.png"
	time := (((DateAndTime now asString copyReplaceAll: ':' with: '-') copyReplaceAll: '.' with: '-') splitOn: '+') first.
	fileName := (aPRShowMethodAnnotation className, '_',aPRShowMethodAnnotation methodName),'-', time,'.png'.
	browser := Smalltalk tools browser openOnMethod: className>>methodName.
	
	UIManager default defer: [
		1 second wait.
		browser window exportAsPNGSilentlyForPillarFileNamed: fileName in: workingDirectory.
		browser close].
	
	doc := PRPillarParser new parse:('+' , aPRShowMethodAnnotation caption, '.>file://figures/screenshots/', fileName,
								'|width=', aPRShowMethodAnnotation width,
								'|label=', aPRShowMethodAnnotation label, '+').
	figure := (doc children first) children first.
	"returns aPRDocument (> children first >) aPRParagraph (>children first >) aPRFigure"
	self replace: {figure}
]

{ #category : #accessing }
PRScreenshotTransformer >> workingDirectory: aFileReference [

	workingDirectory := aFileReference 
]
