"
I'm the output of a book checking phase. 
I will report on stdout failing and working test.
"
Class {
	#name : #PRCheckBookDocument,
	#superclass : #PRAbstractOutputDocument,
	#category : #'Pillar-BookTester-CommandLine'
}

{ #category : #writing }
PRCheckBookDocument >> basicWriter [
	" No basicWriter : do nothing"
]

{ #category : #building }
PRCheckBookDocument >> buildOn: aPRProject [ 
	
	| parsedDocument transformedDocument |
	parsedDocument := self parseInputFile: file.
	transformedDocument := self transformDocument: parsedDocument.
	^ self writeDocument: transformedDocument.
]

{ #category : #building }
PRCheckBookDocument >> extension [
	^ 'txt'
]

{ #category : #building }
PRCheckBookDocument >> writeDocument: aDocument [
	| bTester checkReport outputFile| 
	bTester := PRBookTesterVisitor new.
	bTester start: aDocument.
	checkReport := String streamContents: 
				 [ :s |
					s << file fullName.
					s crlf.
					s << 'Passed: ' << (bTester allTestResults size - bTester failedTests size) asString.
					s crlf.
					s << 'Failed: ' << bTester failedTests size asString.
					s crlf;crlf. 
					bTester failedTests do: [ :each | 
														s << each explanation.
														s crlf.
											  			s << each text.
											  		 	s crlf; crlf. ].
				   s << 'File Checked!'.
					s crlf;crlf.].
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , self extension.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | stream nextPutAll: checkReport contents].
	
	bTester allTestResults do: [:each | bTester finalStatus: (bTester finalStatus and: each status) ].	
	^ PRStatus withStatus: bTester finalStatus
	
]
