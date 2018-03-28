writing
writeDocument: aDocument

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