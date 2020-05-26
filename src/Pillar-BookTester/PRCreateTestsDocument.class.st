Class {
	#name : #PRCreateTestsDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #writing }
PRCreateTestsDocument >> basicWriter [
	" No basicWriter : do nothing"
]

{ #category : #accessing }
PRCreateTestsDocument >> buildOn: aPRProject [ 
	
	| parsedDocument transformedDocument |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	^ self writeDocument: transformedDocument.
]

{ #category : #accessing }
PRCreateTestsDocument >> extension [
	^ 'txt'
]

{ #category : #accessing }
PRCreateTestsDocument >> writeDocument: aDocument [
	| testGen testReport outputFile |
	testGen := PRBookTestGenerator new.
	testGen fileName: (testGen prettyRename: file file).
	testGen createClassFrom: testGen fileName.
	
	testGen start: aDocument.
	
	testReport := String streamContents:
		[ :s | 
			s crlf.
			s crlf.
			s << file fullName; crlf.
			s << 'Tests created under the package ''Pillar-BookTesterResults'' with the name of the file'; crlf.
		 ].
		
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: testReport contents].
		
	testGen allTestResults do: [:each | testGen finalStatus: (testGen finalStatus and: each status) ].
	^ PRStatus withStatus: testGen finalStatus
]
