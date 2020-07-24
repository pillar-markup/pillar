Class {
	#name : #PRTocBuilderVisitorTest,
	#superclass : #PRVisitorTest,
	#instVars : [
		'simpleDocument',
		'inputDocument',
		'advancedDocument',
		'builder',
		'complexToc'
	],
	#category : #'Pillar-Tests-ExporterCore-Toc'
}

{ #category : #private }
PRTocBuilderVisitorTest >> actualClass [
	^ PRTocBuilderVisitor 
]

{ #category : #tests }
PRTocBuilderVisitorTest >> createCyclicPillarFile1 [
	| pillarFile |
	pillarFile := 'cyclic1.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!! TestCyclicFile1

${inputFile:path=cyclic1.pillar}$

Look at my eyes'
		 ]
]

{ #category : #tests }
PRTocBuilderVisitorTest >> createPillarFile1 [
	| pillarFile |
	pillarFile := 'input1.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!!! TestFile11

+Pillar logo>figures/pillar.png|width=30+

If you don''t know ''Pillar'', its documentation is *here>https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html*


!!! TestFile12



!!! TestFile13

The book is generated directly in HTML and LaTeX with the command ==make book==



You can compile just one chapter with the command ==make book-result/chapterPathAndName.format==
For example, for the first chapter in LaTeX: ==make book-result/Chapters/Chapter1/chapter1.tex==


!!! TestFile14

${inputFile:path=input3.pillar}$

!!! TestFile15'
		 ]
]

{ #category : #tests }
PRTocBuilderVisitorTest >> createPillarFile2 [
	| pillarFile |
	pillarFile := 'input2.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!! TestFile21

There is also a template system, you can find template in the folder ''_support/template''.
Some template are already written, but if you want to have your own, you had two solutions:
-edit the existing template related to the format you want to change (recommanded)
-create your own template with its own name and change used template in the Makefile'
		 ]
]

{ #category : #tests }
PRTocBuilderVisitorTest >> createPillarFile3 [
	| pillarFile |
	pillarFile := 'input3.pillar' asFileReference.
	
	pillarFile writeStreamDo: [ :stream |
		stream nextPutAll: '!! TestFile31

Look at my eyes'
		 ]
]

{ #category : #initialization }
PRTocBuilderVisitorTest >> setUp [
	super setUp.
	builder := PRTocBuilderVisitor new.
	simpleDocument := PRPillarParser
		parse:
			'! test1
! test2'.

	inputDocument := PRPillarParser
		parse:
			'! test1
! test2

${inputFile:path=input1.pillar}$

${inputFile:path=input2.pillar}$
'.

	advancedDocument := PRPillarParser
		parse:
			'! test1
! test2

! test3

${inputFile:path=input2.pillar}$

! test4

${inputFile:path=input1.pillar}$

'.

	complexToc := PRPillarParser
		parse:
			'!! Test1
!!! Test11
!!!! Test111
!!! Test12
!!!!! Test121
!!!! Test122
!! Test2
! Test3'.
	self createPillarFile1.
	self createPillarFile2.
	self createPillarFile3.
	self createCyclicPillarFile1.
]

{ #category : #running }
PRTocBuilderVisitorTest >> tearDown [
	(FileSystem workingDirectory / 'input1.pillar') delete.
	(FileSystem workingDirectory / 'input2.pillar') delete.
	(FileSystem workingDirectory / 'input3.pillar') delete.
	(FileSystem workingDirectory / 'cyclic1.pillar') delete.
	super tearDown
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testDocumentWithCyclicInputShouldRaiseError [
	| document |
	document := PRPillarParser
		parse:
			'
! Test1
!! Test2

${inputFile:path=cyclic1.pillar}$

!! Test3'.

	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar').
		
	self should: [ builder visit: document ] raise: PRCyclicFileInclusionError
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testDocumentWithInputAnnotationAndTitle [
	| document expectedToc |
	document := PRPillarParser
		parse:
			'
! Test1
!! Test2

${inputFile:path=input1.pillar}$

!! Test3'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 1;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 2;
						addChildren:
							(PRToc new
								name: 'TestFile11';
								level: 3;
								fileReference: 'input1.pillar');
						addChildren:
							(PRToc new
								name: 'TestFile12';
								level: 3;
								fileReference: 'input1.pillar');
						addChildren:
							(PRToc new
								name: 'TestFile13';
								level: 3;
								fileReference: 'input1.pillar');
						addChildren:
							(PRToc new
								name: 'TestFile14';
								level: 3;
								fileReference: 'input1.pillar'));
				addChildren:
					(PRToc new
						name: 'TestFile31';
						level: 2;
						fileReference: 'input3.pillar';
						addChildren:
							(PRToc new
								name: 'TestFile15';
								level: 3;
								fileReference: 'input1.pillar'));
				addChildren:
					(PRToc new
						name: 'Test3';
						level: 2)).
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: document.
	self assert: builder tableOfContents children size equals: 1.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testDocumentWithInputAnnotationContainsMultipleTocs [
	| expectedToc |
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'test1';
				level: 1);
		addChildren:
			(PRToc new
				name: 'test2';
				level: 1);
		addChildren:
			(PRToc new
				name: 'test3';
				level: 1;
				addChildren:
					(PRToc new
						name: 'TestFile21';
						level: 2;
						fileReference: 'input2.pillar'));
		addChildren:
			(PRToc new
				name: 'test4';
				level: 1;
				addChildren:
					(PRToc new
						name: 'TestFile11';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile12';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile13';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile14';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile31';
						level: 2;
						fileReference: 'input3.pillar';
						addChildren:
							(PRToc new
								name: 'TestFile15';
								level: 3;
								fileReference: 'input1.pillar'))).
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: advancedDocument.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testDocumentWithInputAnnotationHasTocs [
	| expectedToc |
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'test1';
				level: 1);
		addChildren:
			(PRToc new
				name: 'test2';
				level: 1;
				addChildren:
					(PRToc new
						name: 'TestFile11';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile12';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile13';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile14';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile31';
						level: 2;
						fileReference: 'input3.pillar';
						addChildren:
							(PRToc new
								name: 'TestFile15';
								level: 3;
								fileReference: 'input1.pillar'));
				addChildren:
					(PRToc new
						name: 'TestFile21';
						level: 2;
						fileReference: 'input2.pillar')).
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: inputDocument.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testDocumentWithOnlyInputAnnotation [
	| document expectedToc |
	document := PRPillarParser parse: '${inputFile:path=input2.pillar}$'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'TestFile21';
				level: 2;
				fileReference: 'input2.pillar').
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: document.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testDocumentWithoutInputAnnotationOnlyContainsTitles [
	| expectedToc |
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'test1';
				level: 1);
		addChildren:
			(PRToc new
				name: 'test2';
				level: 1).
	builder visit: simpleDocument.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testTitlesHaveGoodFileRefs [
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!!! Test2
${inputFile:path=input1.pillar}$
!! Test3
! Test4'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2;
				fileReference: nil;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 3;
						fileReference: nil);
				addChildren:
					(PRToc new
						name: 'TestFile11';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile12';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile13';
						level: 3;
						fileReference: 'input1.pillar');
				addChildren:
					(PRToc new
						name: 'TestFile14';
						level: 3;
						fileReference: 'input1.pillar'));
		addChildren:
			(PRToc new
				name: 'TestFile31';
				level: 2;
				fileReference: 'input3.pillar';
				addChildren:
					(PRToc new
						name: 'TestFile15';
						level: 3;
						fileReference: 'input1.pillar'));
		addChildren:
			(PRToc new
				name: 'Test3';
				level: 2;
				fileReference: nil);
		addChildren:
			(PRToc new
				name: 'Test4';
				level: 1;
				fileReference: nil).
	builder
		documentSource: FileSystem workingDirectory / 'document.pillar';
		currentFile: 'document.pillar';
		inProcessFiles: (Array with: FileSystem workingDirectory / 'document.pillar');
		visit: document.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testTocChildrenHasTheSameLevel [
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!! Test2'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2);
		addChildren:
			(PRToc new
				name: 'Test2';
				level: 2).
	builder visit: document.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testTocHasGoodLevelOfChildren [
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!!! Test2
!! Test3
! Test4'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 3));
		addChildren:
			(PRToc new
				name: 'Test3';
				level: 2);
		addChildren:
			(PRToc new
				name: 'Test4';
				level: 1).
	builder visit: document.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testTocHasOneChildren [
	| document expectedToc |
	document := PRPillarParser
		parse:
			'! Test1
!! Test2'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 1;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 2)).
	builder visit: document.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testTocIsEmpty [
	| document expectedToc |
	document := PRPillarParser parse: 'Test1'.
	builder visit: document.
	expectedToc := PRToc new level: 0.
	self assert: builder tableOfContents equals: expectedToc
]

{ #category : #tests }
PRTocBuilderVisitorTest >> testTocOnlyContainsTocs [
	| document expectedToc |
	document := PRPillarParser
		parse:
			'!! Test1
!!! Test2
!!! Test3
!! Test4
!!!! Test5
! Test6
!! Test7'.
	expectedToc := PRToc new
		level: 0;
		addChildren:
			(PRToc new
				name: 'Test1';
				level: 2;
				addChildren:
					(PRToc new
						name: 'Test2';
						level: 3);
				addChildren:
					(PRToc new
						name: 'Test3';
						level: 3));
		addChildren:
			(PRToc new
				name: 'Test4';
				level: 2;
				addChildren:
					(PRToc new
						name: 'Test5';
						level: 4));
		addChildren:
			(PRToc new
				name: 'Test6';
				level: 1;
				addChildren:
					(PRToc new
						name: 'Test7';
						level: 2)).
	builder visit: document.
	self assert: builder tableOfContents equals: expectedToc
]
