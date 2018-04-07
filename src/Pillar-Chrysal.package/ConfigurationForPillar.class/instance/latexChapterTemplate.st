accessing
latexChapterTemplate
	"generated code"
	^ self propertyAt: #latexChapterTemplate ifAbsent: ['_support/templates/chapter.latex.mustache']