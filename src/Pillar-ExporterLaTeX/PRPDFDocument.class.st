Class {
	#name : 'PRPDFDocument',
	#superclass : 'PRAbstractOutputDocument',
	#category : 'Pillar-ExporterLaTeX',
	#package : 'Pillar-ExporterLaTeX'
}

{ #category : 'writing' }
PRPDFDocument >> basicWriter [
	
	^ target writerFor: project configuration
]

{ #category : 'accessing' }
PRPDFDocument >> defaultParagraphLevelFor: aChapterLevel [
	"Four levels below the chapters, so that the PDF of a book that declares nothing is what it has always been: ##### is \subsubsection, ###### \paragraph."

	^ aChapterLevel + 4
]

{ #category : 'compiling' }
PRPDFDocument >> executeCommand: command arguments: arguments workingDirectory: aWorkingDirectory [

	OSPlatform current isWindows ifTrue: [ 
		^ self
			executeOnWindowsCommand: command
			arguments: arguments
			workingDirectory: aWorkingDirectory
	].
	^ self
		executeOnUnixCommand: command
		arguments: arguments
		workingDirectory: aWorkingDirectory
]

{ #category : 'compiling' }
PRPDFDocument >> executeOnUnixCommand: command arguments: arguments workingDirectory: aWorkingDirectory [
	"Run command and wait for it; raise a PRCommandError when it cannot be run or fails."

	| process |
	process := [
		           OSSUnixSubprocess new
			           command: command;
			           workingDirectory: aWorkingDirectory;
			           arguments: arguments;
			           runAndWait ]
		           on: Error
		           do: [ :error |
				           PRCommandError signal:
					           ('{1} cannot be run: is it installed? To build PDF files, install a TeX distribution (TeX Live, MacTeX) that provides latexmk and lualatex.'
						            format: { command }) ].
	process isSuccess ifFalse: [
			PRCommandError signal: ('{1} failed (exit status {2})' format: {
						 command.
						 process exitStatus }) ]
]

{ #category : 'compiling' }
PRPDFDocument >> executeOnWindowsCommand: command arguments: arguments workingDirectory: aWorkingDirectory [
	| process success commandString |
	commandString := 'cd "', aWorkingDirectory, '" && ', command, ' ', (' ' join: arguments).
	
	process := ProcessWrapper new.
	process useStderr; useStdout.
	success := process startWithShellCommand: commandString.
	success ifFalse: [
		self error: 'command ', commandString ,' failed' ].

	success := process waitForExit.
	success ifFalse: [
		self error: 'command ', commandString ,' failed' ].
	
	Transcript show: process stdoutStream upToEnd.
	Transcript show: process stderrStream upToEnd.

	process closeStdin.
	process closeStderr.

	process exitCode = 0 ifFalse: [
		self error: 'command ', commandString ,' failed' ].
]

{ #category : 'accessing' }
PRPDFDocument >> extension [
	
	^ 'pdf'
]

{ #category : 'accessing' }
PRPDFDocument >> pdfTransformationsFor: aDocument [

	^ aDocument pdfTransformationsFor: self
]

{ #category : 'building' }
PRPDFDocument >> postWriteTransform: aFile [
	"Run latexmk on the LaTeX file aFile; when it fails, say where its log is."

	| relativePath outputFileReference log |
	relativePath := file file asAbsolute relativeTo:
		                project baseDirectory asAbsolute.
	outputFileReference := outputDirectory resolve: relativePath parent.
	log := outputFileReference
	       / (aFile basenameWithoutExtension , '.log').
	[
		self
			executeCommand: 'latexmk'
			arguments: {
					'-pdflatex=lualatex'.
					'-pdf'.
					'-ps-'.
					'-f'.
					'-interaction=nonstopmode'.
					('-outdir=' , (self toCommandPath: outputFileReference fullName)).
					(self toCommandPath: (self toLatexPath:
							  (aFile relativeTo: outputDirectory) pillarPrintString)) }
			workingDirectory: outputDirectory fullName ]
		on: PRCommandError
		do: [ :error |
				log exists ifTrue: [
						error messageText: ('{1}: see the LaTeX log {2}' format: {
									 error messageText.
									 log fullName }) ].
				error pass ]
]

{ #category : 'compiling' }
PRPDFDocument >> toCommandPath: aPathString [

	OSPlatform current isWindows ifTrue: [ 
		^ aPathString surroundedBy: '"'
	].
	^ aPathString
]

{ #category : 'writing' }
PRPDFDocument >> toLatexPath: aString [
	"Replace all (windows style) back slashes in paths by (unix style) forward slashes.
	This is required as path in latex only support unix style pathes like
	
	  /home/xxx
	
	or
	
	  C:/home/xxx
	
	See https://tex.stackexchange.com/questions/9363/how-does-one-insert-a-backslash-or-a-tilde-into-latex
	"
	^ aString copyReplaceAll: '\' with: '/'
]

{ #category : 'accessing' }
PRPDFDocument >> transformations [
	self halt.
	^ super transformations
		", self pdfTransformations to test if for MD we need them." 
]

{ #category : 'accessing' }
PRPDFDocument >> transformationsFor: aDocument [
	
	^ (super transformationsFor: aDocument)
		, (self pdfTransformationsFor: aDocument)
]

{ #category : 'writing' }
PRPDFDocument >> writeDocument: aDocument [

	| content environment templatedOutput outputFile |
	
	environment := self getMustacheTemplateValuesFromDocument: aDocument.
	content := self writer write: aDocument.
	environment at: #content put: content.

	"so that we can force to have book.bib in the environment"
	"we will have to fix that"
	"environment at: #bibFile put: (environment bibFile)."
	templatedOutput := (MustacheTemplate on: (self templateFile: aDocument) readStream contents) value: environment.


	self flag: #DuplicatedInSuperclass.
	outputFile := (self outputDirectory resolve: (file file asAbsolute relativeTo: project baseDirectory asAbsolute)) withoutExtension , 'tex'.
	outputFile ensureDelete.
	outputFile parent ensureCreateDirectory.
	outputFile writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ].
	^ outputFile
]
