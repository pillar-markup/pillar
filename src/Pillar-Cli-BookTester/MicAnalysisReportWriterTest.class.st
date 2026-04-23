Class {
	#name : 'MicAnalysisReportWriterTest',
	#superclass : 'TestCase',
	#category : 'Pillar-Cli-BookTester',
	#package : 'Pillar-Cli-BookTester'
}

{ #category : 'tests' }
MicAnalysisReportWriterTest >> testWithEmptyResults [

	self assert: MicAnalysisReportWriter new report isEmpty
]

{ #category : 'tests' }
MicAnalysisReportWriterTest >> testWithResults [

	| reporter |
	reporter := MicAnalysisReportWriter new 
					addResults: { MicBrokenSyncDefinitionResult new };
					addResults: { MicBrokenSyncOriginDefinitionResult new }.
	self assert: reporter results size equals: 2. 
	self deny: reporter report isEmpty
]
