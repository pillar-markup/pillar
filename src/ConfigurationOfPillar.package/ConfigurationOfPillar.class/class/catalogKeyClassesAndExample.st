metadata
catalogKeyClassesAndExample
	^ 'The key classes are:

- ==PRDocumentItem== and all its subclasses (e.g., ==PRLink==, ==PRParagraph==, ==PRHeader==, ==PRDocument==). These classes represent the document model.
- ==PRDocumentParser== which takes a pillar-formatted string as input and produces a ==PRDocument== (i.e., the document model) as output. Its main public method is its ==parse:== method on class-side to start the parsing process.
- ==PRVisitor== which provides all the functionality to navigate the document model.
- ==PRTransformer== is a set of visitor which will transform the document to improve it before the export.
- ==PRDocumentWriter== is the superclass of all classes supposed to output a pier document model to a text file. Its subclasses include one to output a LaTeX document and one to output an HTML webpage.

From Pharo, you can create an HTML out of a Pillar-formatted string by writing a code similar to:

[[[language=Smalltalk
PRHTMLWriter defaultConfiguration
	outputDirectory: FileLocator imageDirectory;
    inputString: ''Some text with *a link to Pharo>http://www.pharo.org*.'';
    outputFile: (RelativePath from: ''foo.html'');
    export
]]]

Executing this code will result in the creation of a ==myFirstPillarExport.html== file with this content:

[[[language=html
<p>Some text with <a href="http://www.pharo.org">a link to Pharo</a>.</p>
]]]
'