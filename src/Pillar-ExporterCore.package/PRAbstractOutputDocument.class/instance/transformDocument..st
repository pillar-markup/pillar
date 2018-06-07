building
transformDocument: aDocument

	| inclusionVisitor withInclusions |
	inclusionVisitor := PRFileInclusion new.
	inclusionVisitor topFile: file file.
	withInclusions := inclusionVisitor start: (PRCleanAnnotationInParagraphTransformer new start: aDocument).

	^ self transformations
		inject: withInclusions
		into: [ :accum :each | each start: accum ]