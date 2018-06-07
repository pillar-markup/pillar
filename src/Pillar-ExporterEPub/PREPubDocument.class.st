"
EPub document Version 3.1

Specs: http://www.idpf.org/epub/31/spec/

Helpful links:
 - validator: https://www.ebookit.com/tools/bp/Bo/eBookIt/epub-validator
 - validator: http://validator.idpf.org/application/validate
 - blog: http://www.hxa.name/articles/content/epub-guide_hxa7241_2007.html
"
Class {
	#name : #PREPubDocument,
	#superclass : #PRAbstractOutputDocument,
	#instVars : [
		'files'
	],
	#category : 'Pillar-ExporterEPub'
}

{ #category : #writing }
PREPubDocument >> epubContentsGenerationDirectory [

	^ (self outputDirectory resolve: (file file parent relativeTo: project baseDirectory asAbsolute)) / file file withoutExtension basename
]

{ #category : #accessing }
PREPubDocument >> extension [
	
	^ 'epub'
]

{ #category : #accessing }
PREPubDocument >> files [
	^ files
]

{ #category : #accessing }
PREPubDocument >> files: anObject [
	files := anObject
]

{ #category : #writing }
PREPubDocument >> navigationTemplateFile [

	^ project supportDirectory / 'templates' / 'nav.html.mustache'
]

{ #category : #writing }
PREPubDocument >> postWriteTransform: aFile [

	"Package the EPUB into a zip file.
	The first element of the zip file should be a non compressed mimetype file"
	| fileReference |
	fileReference := self epubContentsGenerationDirectory, self extension.
	fileReference ensureDelete.
	
	SystemVersion current major <= 6 ifTrue: [ 
		fileReference writeStreamDo: [ :stream | 
			stream binary.
			self writeZipFileOn: stream.
			^ self ] ].
	fileReference binaryWriteStreamDo: [ :stream | self writeZipFileOn: stream ]
]

{ #category : #writing }
PREPubDocument >> templateFile [
	
	| epubTemplatePath |
	epubTemplatePath := project configuration propertyAt: 'epubTemplate' ifAbsent: [ '_support/templates/xhtml.mustache' ].
	^ project baseDirectory / epubTemplatePath
]

{ #category : #writing }
PREPubDocument >> writeContentsFileForDocument: aDocument [

	self
		writeDocument: aDocument
		inFile: (self epubContentsGenerationDirectory / 'contents.xhtml')
		withWriter: PRXHTMLWriter new
]

{ #category : #writing }
PREPubDocument >> writeDocument: aDocument [

	"A pillar generated epub document contains a navigation xhtml file and a contents xhtml file.
	This is done like that because the only way so far of expression a table of contents (TOC) is by 
	  - including files
	  - then traversing their headings and sections
	
	Then, If you want o generate a big epub file, create a pillar file including all the other pillar files"
	self writeNavigationFileForDocument: aDocument.
	self writeContentsFileForDocument: aDocument.
	self writePackageManifestFile.
	self writeEPubDependencies.
	self writeEPubSupportFiles.
]

{ #category : #writing }
PREPubDocument >> writeDocument: aDocument inFile: aFileReference withWriter: aWriter [
	| content templateValues templatedOutput |
	
	content := aWriter write: aDocument.
	
	"We get the flattened meta-data obtained from the file header and the pillar configuration
	We add the text contents to the dictionary.
	This dictionary will be used by the mustache"
	templateValues := (self metadataConfigurationForDocument: aDocument) allProperties.
	templateValues at: #content put: content.
	
	templatedOutput := (MustacheTemplate on: self templateFile readStream contents) value: templateValues.
	aFileReference ensureDelete.
	aFileReference parent ensureCreateDirectory.
	aFileReference writeStreamDo: [ :stream | 
		stream nextPutAll: templatedOutput ]
]

{ #category : #writing }
PREPubDocument >> writeEPubDependencies [

	project baseDirectory children do: [ :each |
		((each basename beginsWith: '_') or: [ each basename beginsWith: '.' ]) ifFalse: [ 
			each copyAllTo: self epubContentsGenerationDirectory / each basename ] ]
]

{ #category : #writing }
PREPubDocument >> writeEPubSupportFiles [

	(project baseDirectory resolve: '_support/epub')
		copyAllTo: self epubContentsGenerationDirectory
]

{ #category : #writing }
PREPubDocument >> writeNavigationFileForDocument: aDocument [

	self
		writeDocument: aDocument
		inFile: (self epubContentsGenerationDirectory / 'navigation.xhtml')
		withWriter: PREPubNavigationMenuWriter new
]

{ #category : #writing }
PREPubDocument >> writePackageManifestFile [

	| configuration contentsOpfTemplate |
	
	configuration := self configuration allProperties.
	configuration
		at: 'manifestItems'
		put: '
		<item id="navigation" properties="nav" href="navigation.xhtml" media-type="application/xhtml+xml"/>
		<item id="contents" href="contents.xhtml" media-type="application/xhtml+xml" />'.

	configuration
		at: 'spineItems'
		put: '
		<itemref idref="navigation" linear="yes" />
		<itemref idref="contents" linear="yes" />'.

	contentsOpfTemplate := (project baseDirectory / '_support' / 'templates' / 'contents.opf.mustache') asMustacheTemplate.
	self epubContentsGenerationDirectory / 'contents', 'opf' writeStreamDo: [:stream |
		stream nextPutAll: (contentsOpfTemplate value: configuration) ]
]

{ #category : #writing }
PREPubDocument >> writeZipFileOn: stream [
	| archive |
	archive := ZipArchive new.
	(archive addFile: (self epubContentsGenerationDirectory / 'mimetype') fullName as: 'mimetype')
		desiredCompressionMethod: ZipArchive compressionStored;
		unixFileAttributes: 0.
	self epubContentsGenerationDirectory allChildren
		do: [ :each | 
			each = self epubContentsGenerationDirectory asAbsolute
				ifFalse: [ | absolutePathString relativePathString |
					absolutePathString := each fullName.
					relativePathString := each fileSystem stringFromPath: (each relativeTo: self epubContentsGenerationDirectory asAbsolute).
					(each isDirectory
						ifTrue: [ archive addDirectory: absolutePathString as: relativePathString ]
						ifFalse: [ archive addFile: absolutePathString as: relativePathString ]) unixFileAttributes: 0 ] ].
	archive writeTo: stream
]
