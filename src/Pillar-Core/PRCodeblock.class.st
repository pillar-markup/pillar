"
An embedded script

[[[language=smalltalk|caption=""addition""
1 + 3 			
]]]

In addition scripts are also used to define structures

[[[structure=city
{
   ""name""        : ""Bordeaux"",
   ""latitude""    : 44.84, [...]
}
]]]

We needed a way to have a JSON structure in a Pillar file without interpreting the JSON as Pillar syntax. To do this, we used environments whose contents is JSON:
[[[structure=city
{
   ""name""        : ""Bordeaux"",
   ""latitude""    : 44.84, [...]
}
]]]
Environments are the only Pillar elements which keep their contents unparsed. This solution encapsulates new syntax within an existing one thus avoiding problems with existing documents.
"
Class {
	#name : #PRCodeblock,
	#superclass : #PRText,
	#traits : 'PRTParametrizable',
	#classTraits : 'PRTParametrizable classTrait',
	#instVars : [
		'parameters',
		'caption'
	],
	#category : #'Pillar-Core-Model'
}

{ #category : #'instance creation' }
PRCodeblock class >> content: aString parameters: parameters [
	^ (self content: aString)
		parameters: parameters;
		yourself
]

{ #category : #comparing }
PRCodeblock >> = anObject [
	"We use the method language to be sure that the language is a PRAbstractScriptLanguage and not a string."
	
	^ super = anObject
		and: [ 
			self language.
			anObject language.
			self parameters = anObject parameters ]
]

{ #category : #visiting }
PRCodeblock >> accept: aVisitor [
	^ aVisitor visitCodeblock: self
]

{ #category : #'accessing-delegated' }
PRCodeblock >> caption [
	^ caption
		ifNil: [ 
			caption := self
				parameters at: 'caption'
				ifPresent: [ :string | (PRDocument parser parse: string) children first ]
				ifAbsent: [ PRParagraph with: (PRText content: '') ] ]
]

{ #category : #'accessing-delegated' }
PRCodeblock >> caption: aString [
	parameters := self parameters copyWith: 'caption' -> aString
]

{ #category : #'accessing-delegated' }
PRCodeblock >> eval: aString [
	parameters := parameters copyWith: 'eval' -> aString
]

{ #category : #accessing }
PRCodeblock >> firstLine: aString [
	parameters := parameters copyWith: 'firstLine' -> aString
]

{ #category : #accessing }
PRCodeblock >> fromFile: aString [
	parameters := parameters copyWith: 'fromFile' -> aString
]

{ #category : #testing }
PRCodeblock >> hasCaption [
	^ self parameters at: 'caption' ifPresent: [ :param | param isEmptyOrNil not ] ifAbsent: [ false ]
]

{ #category : #testing }
PRCodeblock >> hasLabel [
	| label |
	label := self parameters at: 'label' ifAbsent: [ ^ false ].
	^ label isEmptyOrNil not
]

{ #category : #testing }
PRCodeblock >> hasNoCode [
	^ (self text copyWithout: Character tab) isEmpty
]

{ #category : #testing }
PRCodeblock >> hasShortCaption [
	^ self parameters at: 'shortCaption'
		ifPresent: [ :param | param isEmptyOrNil not ]
		ifAbsent: [ false ]
]

{ #category : #comparing }
PRCodeblock >> hash [
	^ super hash bitXor: self properties hash
]

{ #category : #'accessing-delegated' }
PRCodeblock >> hideable: aString [
	parameters := parameters copyWith: 'hideable' -> aString
]

{ #category : #initialization }
PRCodeblock >> initialize [
	super initialize.
	parameters := OrderedDictionary new
]

{ #category : #testing }
PRCodeblock >> isEvaluated [
	^ self parameters at: 'eval' ifAbsent: [ false ]
]

{ #category : #testing }
PRCodeblock >> isHideable [
	^ self parameters at: 'hideable' ifPresent: [ :hideable | hideable = 'true' or: [ hideable = true ] ] ifAbsent: [ false ]
]

{ #category : #testing }
PRCodeblock >> isStructure [
	^ self parameters includesKey: 'structure'
]

{ #category : #'accessing-delegated' }
PRCodeblock >> label [
	^ self parameters at: 'label' ifAbsent: ['']
]

{ #category : #'accessing-delegated' }
PRCodeblock >> label: aString [
	parameters := parameters copyWith: 'label' -> aString
]

{ #category : #'accessing-delegated' }
PRCodeblock >> language [
	^ self
		parameters at: 'language'
		ifPresent: [ :language | 
			language isString
				ifTrue: [ 
					| realObject |
					realObject := PRAbstractScriptLanguage for: language.
					self language: realObject.
					realObject ]
				ifFalse: [ language ] ]
		ifAbsent: [ PRUnspecifiedScriptLanguage default ]
]

{ #category : #'accessing-delegated' }
PRCodeblock >> language: aLanguage [
	self parameters at: 'language' put: aLanguage
]

{ #category : #accessing }
PRCodeblock >> lastLine: aString [
	parameters := parameters copyWith: 'lastLine' -> aString
]

{ #category : #accessing }
PRCodeblock >> lineNumber: aString [
	parameters := parameters copyWith: 'lineNumber' -> aString
]

{ #category : #'accessing-parameters' }
PRCodeblock >> parameters [
	^ parameters
]

{ #category : #'accessing-parameters' }
PRCodeblock >> parameters: aCollection [

	parameters := aCollection
]

{ #category : #operations }
PRCodeblock >> removePossibleParagraph: content [
	^ content first class = PRParagraph
		ifTrue:[ content first children ] 
		ifFalse: [ content ]
]

{ #category : #'accessing-delegated' }
PRCodeblock >> shortCaption [
	^ self parameters at: 'shortCaption' ifAbsent: ['']
]

{ #category : #'accessing-delegated' }
PRCodeblock >> shortCaption: aString [ 
	parameters := parameters copyWith: 'shortCaption' -> aString
]

{ #category : #testing }
PRCodeblock >> structureName [
	^ self parameters at: 'structure'
]

{ #category : #testing }
PRCodeblock >> structureName: aName [
	^ self parameters at: 'structure' put: aName
]

{ #category : #accessing }
PRCodeblock >> text: aString [
	super text: aString withoutTrailingNewlines
]
