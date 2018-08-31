accessing
tableOfContents
	| tocFilePath tocFileName inputDoc |
	tocFilePath := self configuration propertyAt: 'tocFile' ifAbsent: [ ^ PRToc new ].
	tocFileName := self class pathToString: tocFilePath.
	inputDoc := PRPillarParser new optimize parse: (self baseDirectory / tocFileName) contents.
	^ PRTocBuilderVisitor new
		documentSource: self baseDirectory / tocFileName;
		currentFile: tocFileName;
		inProcessFiles: (Array with: self baseDirectory / tocFileName);
		visit: inputDoc