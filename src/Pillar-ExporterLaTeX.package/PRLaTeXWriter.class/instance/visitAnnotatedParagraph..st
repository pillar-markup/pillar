visiting-document
visitAnnotatedParagraph: anAnnotatedParagraph
	"Annotations need to be defined as environments in LaTeX include files (e.g. common.tex)"

	canvas environment
		name: anAnnotatedParagraph annotation;
		with: [ super visitParagraph: anAnnotatedParagraph.
			canvas newLine ]
	"Attention: we do a super call on #visitParagraph: instead of #visitAnnotatedParagraph:. The goal of this hack is to avoid trailing new line characters. This is related to PRLaTeXWriterTest>>#testStrictLineBreaksInAnnotatedParagraphs"