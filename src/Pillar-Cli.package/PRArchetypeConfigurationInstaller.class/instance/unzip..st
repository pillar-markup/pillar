extras
unzip: aString
	| archetype |
	ZipArchive new
		readFrom: configuration baseDirectory asFileReference / aString, 'zip';
		extractAllTo: (configuration baseDirectory / 'tmp') asFileReference.
	archetype := (configuration baseDirectory asFileReference / 'tmp' / aString).
	archetype isDirectory ifTrue: [ archetype copyAllTo: configuration baseDirectory ]
	