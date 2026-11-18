Class {
	#name : 'PRHtmlDocument',
	#superclass : 'PRAbstractOutputDocument',
	#category : 'Pillar-ExporterHTML',
	#package : 'Pillar-ExporterHTML'
}

{ #category : 'templating' }
PRHtmlDocument >> addCustomCssTo: someTemplateValues [
	"Tell the template that the book has a _custom/html/css/custom.css, merged into the support files of the output, so that it links it after book.css."

	(self outputDirectory / '_support' / 'html' / 'css' / 'custom.css')
		exists ifTrue: [ someTemplateValues at: #customCss put: true ]
]

{ #category : 'writing' }
PRHtmlDocument >> basicWriter [

	^ target writerFor: project configuration
]

{ #category : 'accessing' }
PRHtmlDocument >> extension [
	
	^ 'html'
]

{ #category : 'building' }
PRHtmlDocument >> getMustacheTemplateValuesFromDocument: aDocument [
	"aDocument already has a dictionary holding potential metadata. 
	We add the text contents to the dictionary, and whether the book has a custom.css.
	This dictionary will be used by the mustache."

	| template |
	template := super getMustacheTemplateValuesFromDocument: aDocument.
	self addCustomCssTo: template.
	"
	Removed Toc management but keep it since I will revuild it soon
	template 
		at: #toc 
		put: (self tableOfContents asCTEnvironmentWithParent: template)."
	^ template
]
