Class {
	#name : #PRPrepareForGitBookCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#instVars : [
		'subconfName'
	],
	#category : 'Pillar-GitBook'
}

{ #category : #accessing }
PRPrepareForGitBookCommandLineHandler class >> commandName [
	^ 'prepareForGitBook'
]

{ #category : #activation }
PRPrepareForGitBookCommandLineHandler >> activate [
	super activate.
	self
		optionAt: 'from'
		ifPresent: [ :subconf | configuration := configuration subConfigurationNamed: subconf ]
		ifAbsent: [ self errorMissingParameter: 'from' ].
	self generateSummary.
	self exitSuccess
]

{ #category : #activation }
PRPrepareForGitBookCommandLineHandler >> generateSummary [
	(baseDirectory / 'SUMMARY.md') asFileReference
		writeStreamDo: [ :stream | 
			stream << '# Summary' << String lf << String lf.
			stream << 'Abstract (to be done)' << String lf << String lf.
			self flag: #todo. "This cannot work anymore because inputFiles has been replaced by inputFile."
			configuration inputFiles
				do: [ :inputFile | 
					| document title |
					document := configuration parseFile: inputFile.
					title := document title.
					stream << '* [' << title << ']('.
					(inputFile , PRMarkdownWriter fileExtension relativeTo: baseDirectory) printOn: stream delimiter: $/.
					stream << ')' << String lf ] ]
]
