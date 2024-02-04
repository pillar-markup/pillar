"
I represent ways to identify files to process.
My main extension point is the method filesToBuildOn: aProject
"
Class {
	#name : #PRBuildStrategy,
	#superclass : #Object,
	#instVars : [
		'supportedLanguageExtensions'
	],
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRBuildStrategy >> filesToBuildOn: aProject [

	self subclassResponsibility
]

{ #category : #accessing }
PRBuildStrategy >> initialize [

	super initialize.
	supportedLanguageExtensions := #('pillar' 'mic' 'md')
]

{ #category : #accessing }
PRBuildStrategy >> isSupportedExtension: aString [
	^ supportedLanguageExtensions includes: aString trimBoth asLowercase
]
