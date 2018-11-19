Class {
	#name : #PRFileCopyVisitor,
	#superclass : #CopyVisitor,
	#instVars : [
		'conflictResolutionBlock'
	],
	#category : 'Pillar-Project-Core'
}

{ #category : #copying }
PRFileCopyVisitor class >> copy: srcReference to: dstReference onConflictDo: conflictResolutionBlock [
	^ self basicNew
		initializeWithSource: srcReference 
		dest: dstReference;
		conflictResolutionBlock: conflictResolutionBlock;
		visit
]

{ #category : #accessing }
PRFileCopyVisitor >> conflictResolutionBlock: aConflictResolutionBlock [

	conflictResolutionBlock := aConflictResolutionBlock
]

{ #category : #accessing }
PRFileCopyVisitor >> copyDirectory: aReference [
	| copy |
	copy := dest resolve: (aReference relativeTo: source).
	copy exists ifTrue: [ 
		^ conflictResolutionBlock value: aReference value: copy ].
	copy createDirectory
]

{ #category : #accessing }
PRFileCopyVisitor >> copyFile: aReference [
	| copy |
	copy := dest resolve: (aReference relativeTo: source).
	copy exists ifTrue: [ 
		^ conflictResolutionBlock value: aReference value: copy ].
	aReference copyTo: copy
]

{ #category : #accessing }
PRFileCopyVisitor >> initialize [
	super initialize.
	conflictResolutionBlock := [ :sourceFile :targetFile | sourceFile copyTo: targetFile ]
]
