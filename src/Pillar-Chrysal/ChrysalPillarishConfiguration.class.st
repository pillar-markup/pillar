"
I'm a pillar specific class to manage code not generated for the configuration class. Pillar code should not use me but my subclass.
"
Class {
	#name : #ChrysalPillarishConfiguration,
	#superclass : #ChrysalConfiguration,
	#instVars : [
		'printer'
	],
	#category : 'Pillar-Chrysal'
}

{ #category : #accessing }
ChrysalPillarishConfiguration >> initialize [
	"This is a hack waiting for a better management of the printer for NodeTransformer."
	super initialize. 
	printer := PRTitlePrinter new.
]

{ #category : #'backward compatibility' }
ChrysalPillarishConfiguration >> levelConfigurationFor: aHeader [
	"I return a PRNumberingConfiguration corresponding for a Header."

	^ self printer perform: ('level' , aHeader level asString) asSymbol
]

{ #category : #'post hooks' }
ChrysalPillarishConfiguration >> postTreat [

	(self propertyAt: #levels ifAbsent: [^ self ]) do: [ 
			:levelSpec |
			| instance |
			instance := (self printer printerSpecFor: levelSpec renderAs).
			instance fillFromAnother: levelSpec. 
			self printer level: instance n: levelSpec level. 
			 ]
]

{ #category : #accessing }
ChrysalPillarishConfiguration >> printer [

	^ printer
]
