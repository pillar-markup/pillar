accessing
toc
	| tocFileName inputDoc |
	tocFileName := self configuration propertyAt: 'tocFile' ifAbsent: [ ^ nil ].
	inputDoc := PRPillarParser parse: (self baseDirectory / tocFileName) asFileReference readStream.
	^ PRTocBuilderVisitor new documentSource: (self baseDirectory / tocFileName); currentFile: tocFileName; inProcessFiles: (Array with: (self baseDirectory / tocFileName )); visit: inputDoc