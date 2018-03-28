writing
epubContentsGenerationDirectory

	^ (self outputDirectory resolve: (file file parent relativeTo: project baseDirectory asAbsolute)) / file file withoutExtension basename