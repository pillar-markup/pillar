Class {
	#name : #PRHeaderCapitalizationTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PRHeaderCapitalizationTransformerTest >> actualClass [
	^ PRHeaderCapitalizationTransformer
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testCapitalizeCapitalization [

	self testTemplateForCapitalizationHeader: 'capitalize' text: 'i am a header' expected: 'I Am A Header'.
	self testTemplateForCapitalizationHeaderWithBold: 'capitalize' text: 'i am a header' expected: 'I Am A Header'.
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testCapitalizeEnglish [

	self assert: (self actualClass new capitalizeEnglish: 'i am a header') equals: 'I Am a Header'.
	self assert: (self actualClass new capitalizeEnglish: 'i am a header of level 1') equals: 'I Am a Header of Level 1'.
	self assert: (self actualClass new capitalizeEnglish: 'i like to code in Pharo for a long time') equals: 'I Like to Code in Pharo for a Long Time'.
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testCapitalizeEnglishCapitalization [

	self testTemplateForCapitalizationHeader: 'capitalize english' text: 'i am a header' expected: 'I Am a Header'.
	self testTemplateForCapitalizationHeaderWithBold: 'capitalize english' text: 'i like to code in Pharo for a long time' expected: 'I Like to Code in Pharo for a Long Time'.
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testCapitalizeHeader [

	self assert: (self actualClass new capitalizeHeader: 'i am a header') equals: 'I Am A Header'.
	self assert: (self actualClass new capitalizeHeader: 'i am a header of level 1') equals: 'I Am A Header Of Level 1'
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testCapitalizeHeaderShouldntCapitalizeAllText [
	| input printer spec  expected configuration |
	configuration := self configuration. 
	printer := configuration printer.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: 'upper case'.
	printer level2: spec.
	
	input := PRDocument new
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'Header'));
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		yourself.
		
	expected := PRDocument new
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: 'HEADER'));
		add: (PRParagraph new add: (PRText content: 'should not be capitalized'));
		yourself.
		
	self assert: (self executePhase: input with: configuration) equals: expected.
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testDefaultValueForCapitalization [

	self testTemplateForDefaultValueForCapitalization: 'i am a header'.
	self testTemplateForDefaultValueForCapitalization: 'I am A hEader'
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testLowerCaseCapitalization [

	self testTemplateForCapitalizationHeader: 'lower case' text: 'I AM A HEADER' expected: 'i am a header'.
	self testTemplateForCapitalizationHeaderWithBold: 'lower case' text: 'I AM A HEADER' expected: 'i am a header'.
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testNotUnderstandCapitalizationType [

	self testTemplateForCapitalizationHeader: 'hello' text: 'i aM A HeaDer' expected: 'i aM A HeaDer'.
	self testTemplateForCapitalizationHeaderWithBold: 'hello' text: 'i aM A HeaDer' expected: 'i aM A HeaDer'.
]

{ #category : #helpers }
PRHeaderCapitalizationTransformerTest >> testTemplateForCapitalizationHeader: aType text: aString expected: anotherString [
	| input printer spec expected configuration |
	configuration := self configuration.
	printer := configuration printer.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: aType.
	printer level2: spec.
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: aString));
		yourself.
	expected := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: anotherString));
		yourself.

	self assert: (self executePhase: input with: configuration) equals: expected.
	
]

{ #category : #helpers }
PRHeaderCapitalizationTransformerTest >> testTemplateForCapitalizationHeaderWithBold: aType text: aString expected: anotherString [
	| input printer spec expected configuration |
	configuration := self configuration. 
	printer := configuration printer.
	spec := printer printerSpecFor: 'roman'.
	spec capitalization: aType.
	printer level2: spec.
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRBoldFormat new add: (PRText content: aString)));
		yourself.
	expected := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRBoldFormat new add: (PRText content: anotherString)));
		yourself.
		
	self assert: (self executePhase: input with: configuration) equals: expected
]

{ #category : #helpers }
PRHeaderCapitalizationTransformerTest >> testTemplateForDefaultValueForCapitalization: aString [
	| input printer spec configuration |
	configuration := self configuration.
	printer := configuration printer. 
	spec := printer printerSpecFor: 'roman' .
	printer level2: spec. 
	
	input := PRDocument new
		add:
			(PRHeader new
				level: 2;
				add: (PRText content: aString));
		yourself.
	self assert: (self executePhase: input with: configuration) equals: input
]

{ #category : #tests }
PRHeaderCapitalizationTransformerTest >> testUpperCaseCapitalization [

	self testTemplateForCapitalizationHeader: 'upper case' text: 'i am a header' expected: 'I AM A HEADER'.
	self testTemplateForCapitalizationHeaderWithBold: 'upper case' text: 'i am a header' expected: 'I AM A HEADER'.
]
