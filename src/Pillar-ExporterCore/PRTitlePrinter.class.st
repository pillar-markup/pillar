"
I'm responsible for printing header level.

I contain level descriptions.  


"
Class {
	#name : #PRTitlePrinter,
	#superclass : #Object,
	#instVars : [
		'levels'
	],
	#classVars : [
		'StrategyMapping'
	],
	#category : 'Pillar-ExporterCore-Configuration'
}

{ #category : #accessing }
PRTitlePrinter class >> defaultStrategyMapping [
	^ Dictionary
		with: 'number' -> PRLevelNumberPrinter
		with: 'roman' -> PRLevelRomanPrinter
		with: 'letter' -> PRLevelLetterPrinter
		with: 'upperLetter' -> PRLevelUpperLetterPrinter
]

{ #category : #accessing }
PRTitlePrinter class >> printerSpecFor: aStyle [ 

	^ (self strategyClassMapping at: aStyle) new
	
	
]

{ #category : #accessing }
PRTitlePrinter class >> strategyClassMapping [
	^ StrategyMapping ifNil: [ StrategyMapping := self defaultStrategyMapping ]
]

{ #category : #initialization }
PRTitlePrinter >> initialize [

	super initialize.
	levels := Array new: self maxLevels.
	1 to: self maxLevels do: [ :l | 
		levels at: l put:  (PRLevelNumberPrinter new
								headerSize: l;
								level: l;
								printer: self;
								yourself) ]
]

{ #category : #accessing }
PRTitlePrinter >> level1 [

	^ levels at: (self levelIndex: 1)
]

{ #category : #accessing }
PRTitlePrinter >> level1: aLevelSpec [

	self level: aLevelSpec n: 1
]

{ #category : #accessing }
PRTitlePrinter >> level2 [

	^ levels at: (self levelIndex: 2)
]

{ #category : #accessing }
PRTitlePrinter >> level2: aLevelSpec [

	self level: aLevelSpec n: 2
]

{ #category : #accessing }
PRTitlePrinter >> level3 [

	^ levels at: (self levelIndex: 3)
]

{ #category : #accessing }
PRTitlePrinter >> level3: aLevelSpec [

	self level: aLevelSpec n: 3
]

{ #category : #accessing }
PRTitlePrinter >> level4 [

	^levels at: (self levelIndex: 4)
]

{ #category : #accessing }
PRTitlePrinter >> level4: aLevelSpec [

	self level: aLevelSpec n: 4
]

{ #category : #accessing }
PRTitlePrinter >> level5 [

	^ levels at: (self levelIndex: 5)
]

{ #category : #accessing }
PRTitlePrinter >> level5: aLevelSpec [

	self level: aLevelSpec n: 5
]

{ #category : #accessing }
PRTitlePrinter >> level6 [

	^ levels at: (self levelIndex: 6)
]

{ #category : #accessing }
PRTitlePrinter >> level6: aLevelSpec [

	self level: aLevelSpec n: 6
]

{ #category : #accessing }
PRTitlePrinter >> level7 [

	^ levels at: (self levelIndex: 7)
]

{ #category : #accessing }
PRTitlePrinter >> level7: aLevelSpec [

	self level: aLevelSpec n: 7
]

{ #category : #accessing }
PRTitlePrinter >> level: aLevelSpec n: n [

	levels at: (self levelIndex: n) put: aLevelSpec.
	aLevelSpec level: n.
	aLevelSpec printer: self.
]

{ #category : #accessing }
PRTitlePrinter >> levelConfigurationFor: aHeader [
	"to get the associated level spec"
	
	^ self perform: ('level' , aHeader level asString) asSymbol
]

{ #category : #accessing }
PRTitlePrinter >> levelIndex: wishedLevel [
	
	^ wishedLevel
]

{ #category : #accessing }
PRTitlePrinter >> leveln: anInteger [

	^ self perform: ('level', anInteger asString) asSymbol 
]

{ #category : #initialization }
PRTitlePrinter >> maxLevels [
	^ 7
]

{ #category : #builder }
PRTitlePrinter >> printerSpecFor: aStyle [

	^ self class printerSpecFor: aStyle
]

{ #category : #accessing }
PRTitlePrinter >> strategyClassFor: aStyle [
	
	^ self class strategyClassMapping at: aStyle ifAbsent: [ 'roman' ]
]
