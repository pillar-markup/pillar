"
I represent ways to identify files to process.
My main extension point is the method filesToBuildOn: aProject
"
Class {
	#name : #PRBuildStrategy,
	#superclass : #Object,
	#category : #'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRBuildStrategy >> filesToBuildOn: aProject [

	self subclassResponsibility
]
