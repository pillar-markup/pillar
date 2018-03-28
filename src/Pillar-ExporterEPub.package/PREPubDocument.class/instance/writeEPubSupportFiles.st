writing
writeEPubSupportFiles

	(project baseDirectory resolve: '_support/epub')
		copyAllTo: self epubContentsGenerationDirectory