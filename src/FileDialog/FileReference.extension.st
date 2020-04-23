Extension { #name : #FileReference }

{ #category : #'*FileDialog' }
FileReference >> isHiddenInWindows [
	^ (self windowAttributes & 16r2) = 1
]

{ #category : #'*FileDialog' }
FileReference >> windowAttributes [
	^ self windowAttributes: self fullName
]

{ #category : #'*FileDialog' }
FileReference >> windowAttributes: lpFileName [
	^ self ffiCall: #(long GetFileAttributesW #(char * lpFileName))
]
