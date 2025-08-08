"
I represent ways to identify files to process.
My main extension point is the method filesToBuildOn: aProject

When documents could be in pillar and md syntaxes, the input document class was selected based 
on the file extension and using meta programmation to avoid to have a direct reference from microdown to Pillar.


"
Class {
	#name : 'PRBuildStrategy',
	#superclass : 'Object',
	#instVars : [
		'supportedLanguageExtensions'
	],
	#category : 'Pillar-ExporterCore-Base',
	#package : 'Pillar-ExporterCore',
	#tag : 'Base'
}

{ #category : 'accessing' }
PRBuildStrategy >> filesToBuildOn: aProject [

	self subclassResponsibility
]

{ #category : 'accessing' }
PRBuildStrategy >> initialize [

	super initialize.
	supportedLanguageExtensions := #('pillar' 'mic' 'md')
]

{ #category : 'accessing' }
PRBuildStrategy >> isSupportedExtension: aString [
	^ supportedLanguageExtensions includes: aString trimBoth asLowercase
]
