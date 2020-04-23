Class {
	#name : #FDWindowPathPresenterTest,
	#superclass : #TestCase,
	#instVars : [
		'windowPathUI'
	],
	#category : #'FileDialog-UI'
}

{ #category : #running }
FDWindowPathPresenterTest >> setUp [
	windowPathUI := FDWindowPathPresenter new.
]

{ #category : #tests }
FDWindowPathPresenterTest >> testRoot [
	windowPathUI currentDirectory: FileLocator root.
	windowPathUI openWithSpec.
	self assert: windowPathUI pathButtons items size equals: 1
]
