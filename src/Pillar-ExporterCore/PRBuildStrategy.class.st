Class {
	#name : #PRBuildStrategy,
	#superclass : #Object,
	#category : 'Pillar-ExporterCore-Base'
}

{ #category : #accessing }
PRBuildStrategy >> filesToBuildOn: aProject [

	self subclassResponsibility
]
