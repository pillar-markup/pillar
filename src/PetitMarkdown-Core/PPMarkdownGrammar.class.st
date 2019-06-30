"
A parser for Markdown, inspired/ported from the PEG grammars in John MacFarlane's peg-markdown and lunamark.

http://daringfireball.net/projects/markdown/
http://github.com/jgm/peg-markdown/
http://github.com/jgm/lunamark/
"
Class {
	#name : #PPMarkdownGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'atxHeading',
		'atxStart',
		'blankLine',
		'block',
		'blockQuote',
		'bullet',
		'bulletList',
		'code',
		'document',
		'emphasis',
		'endline',
		'entity',
		'enumerator',
		'escapedCharacter',
		'explicitLink',
		'heading',
		'horizontalRule',
		'indent',
		'inline',
		'inlines',
		'label',
		'line',
		'linebreak',
		'link',
		'listBlockLine',
		'listContinuationBlock',
		'listItem',
		'listLoose',
		'listTight',
		'newline',
		'nonIndentSpace',
		'nonSpaceCharacter',
		'normalEndline',
		'optionallyIndentedLine',
		'orderedList',
		'paragraph',
		'plain',
		'referenceLink',
		'setextHeading',
		'source',
		'space',
		'spacedNewline',
		'spaces',
		'specialCharacter',
		'starLine',
		'starredEmphasis',
		'starredStrong',
		'strong',
		'terminalEndline',
		'title',
		'underlinedEmphasis',
		'underlinedStrong',
		'underscoreLine',
		'underscoreOrStarLine',
		'symbol',
		'withUnderscores',
		'text',
		'verbatim',
		'url',
		'listItemTight',
		'explicitImage',
		'linkDefinition',
		'linkDefinitionTitle',
		'angleBracketSource',
		'parenthesisSource',
		'autoLink',
		'labelInline'
	],
	#category : 'PetitMarkdown-Core'
}

{ #category : #grammar }
PPMarkdownGrammar >> angleBracketSource [
	^ self delimitedSource: '<>'
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> atxHeading [
	|hash|
	hash := $# asParser star.
	^ atxStart , spaces ,
		"(newline not , ($# asParser star trim , newline) not , inline) plus flatten,"
		((hash , newline) not , inline) plus,
		spaces optional, hash optional ,
		newline
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> atxStart [
	^ ($# asParser min: 1 max: 6) token
]

{ #category : #grammar }
PPMarkdownGrammar >> autoLink [
	^ angleBracketSource
]

{ #category : #token }
PPMarkdownGrammar >> blankLine [
	^ spaces , newline
]

{ #category : #grammar }
PPMarkdownGrammar >> block [
	^ blankLine star , (
		"blockQuote / verbatim
		/ note / reference
		/ "
		verbatim / horizontalRule
		/ heading
		/ orderedList / bulletList
		"/ htmlBlock / styleBlock"
		/ paragraph "/ plain"
	)
]

{ #category : #grammar }
PPMarkdownGrammar >> blockQuote [
	"
	> level 1
	>> level 2
	> level 1
	
	> level 1
continuing on the next line
	"
	"TODO"
	| anIndent |
	anIndent := $> asParser.
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> bullet [
	^ horizontalRule not
		, nonIndentSpace
		, ($+ asParser / $* asParser / $- asParser) token
		, space plus
]

{ #category : #'grammar-block' }
PPMarkdownGrammar >> bulletList [
	^ bullet and , (listTight / listLoose)
]

{ #category : #grammar }
PPMarkdownGrammar >> code [
	| tick doubleTick |
	tick := $` asParser.
	doubleTick := '``' asParser.
		^ (doubleTick , spaces, doubleTick negate plus flatten, spaces, doubleTick) /
		(tick , spaces, tick negate plus flatten, spaces, tick).
		
	
]

{ #category : #grammar }
PPMarkdownGrammar >> delimitedSource: delimiters [
	^ 
		delimiters first asParser, 
			(space / delimiters last asParser) negate plus flatten trimSpaces , 
		delimiters last asParser
]

{ #category : #grammar }
PPMarkdownGrammar >> document [
	^ block star
]

{ #category : #'grammar-inline' }
PPMarkdownGrammar >> emphasis [
	^ starredEmphasis / underlinedEmphasis
]

{ #category : #token }
PPMarkdownGrammar >> endline [
	^ linebreak / terminalEndline / normalEndline
	
]

{ #category : #'grammar-inline' }
PPMarkdownGrammar >> entity [
	| hexEntity decEntity charEntity |
	hexEntity := '&#' asParser , $x asParser caseInsensitive , #hex asParser plus , $; asParser.
	decEntity := '&#' asParser , #digit asParser plus , $; asParser.
	charEntity := $& asParser , #word asParser plus , $; asParser.
	^ (hexEntity / decEntity / charEntity) flatten
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> enumerator [
	^ nonIndentSpace , (#digit asParser plus , $. asParser) token , space plus
]

{ #category : #'grammar-inline' }
PPMarkdownGrammar >> escapedCharacter [
	^ $\ asParser , newline not ,
		(PPPredicateObjectParser chars: '-\`|*_{}[]()#+.!><' message: 'Special character expected')
]

{ #category : #grammar }
PPMarkdownGrammar >> explicitImage [
	^ '!' asParser, self link.
]

{ #category : #grammar }
PPMarkdownGrammar >> explicitLink [
	^ label , spacedNewline , (
		
		'()' asParser |
		
		($( asParser , spaces ,
		source , spaces ,
		title optional , spaces ,
		$) asParser))
]

{ #category : #'grammar-block' }
PPMarkdownGrammar >> heading [
	^ atxHeading / setextHeading
]

{ #category : #grammar }
PPMarkdownGrammar >> horizontalRule [
	^ nonIndentSpace
		, (($* asParser , (spaces , $* asParser min: 2))
			/ ($- asParser , (spaces , $- asParser min: 2))
			/ ($_ asParser , (spaces , $_ asParser min: 2)))
		, spaces , newline , blankLine plus
]

{ #category : #token }
PPMarkdownGrammar >> indent [
	^ #tab asParser / '    ' asParser
]

{ #category : #grammar }
PPMarkdownGrammar >> inline [
	^ endline / strong / emphasis / explicitImage / link / url "
		/ noteReference / inlineNote"
		/ code "/ rawHtml"
		/ text
		"/ entity / escapedCharacter / smart / symbol / space"
]

{ #category : #grammar }
PPMarkdownGrammar >> inlines [
	^ (endline not , inline / (endline , inline and)) plus , endline optional
]

{ #category : #grammar }
PPMarkdownGrammar >> label [
	^ $[ asParser ,
		"notes handling here"
		($] asParser not, labelInline) plus flatten trimBlanks,
		$] asParser
]

{ #category : #grammar }
PPMarkdownGrammar >> labelInline [
	"almost everything from label except links and urls"
	^ endline 
		/ strong / emphasis / explicitImage "
		/ noteReference / inlineNote"
		/ code "/ rawHtml"
		/ text
		"/ entity / escapedCharacter / smart / symbol / space"
]

{ #category : #token }
PPMarkdownGrammar >> line [
	^ (newline not, inline) plus
]

{ #category : #token }
PPMarkdownGrammar >> linebreak [
	^ '  ' asParser , normalEndline
]

{ #category : #grammar }
PPMarkdownGrammar >> link [
	^ explicitLink / linkDefinition / referenceLink / autoLink
]

{ #category : #grammar }
PPMarkdownGrammar >> linkDefinition [
	^ label, $: asParser, spaces,
		(angleBracketSource / parenthesisSource / source), 
		spaces, linkDefinitionTitle optional
]

{ #category : #grammar }
PPMarkdownGrammar >> linkDefinitionTitle [
	^ (self linkDefinitionTitle: '""') / (self linkDefinitionTitle: '''''') / (self linkDefinitionTitle: '()')
]

{ #category : #grammar }
PPMarkdownGrammar >> linkDefinitionTitle: delimiters [
	^ delimiters first asParser ,
	((delimiters last asParser / newline) not , #any asParser ) star flatten trimBlanks,
	delimiters last asParser
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> listBlockLine [
	^ (bullet / enumerator) not
		, blankLine not
		, horizontalRule not
		, optionallyIndentedLine
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> listContinuationBlock [
	^ blankLine star 
	, listBlockLine
]

{ #category : #grammar }
PPMarkdownGrammar >> listItem [
	^ (bullet / enumerator)
		, line
		, listContinuationBlock star
]

{ #category : #grammar }
PPMarkdownGrammar >> listItemTight [
	^ (bullet / enumerator)
		, line
		, (newline, listBlockLine) star
]

{ #category : #grammar }
PPMarkdownGrammar >> listLoose [
	^ (listItem , blankLine star) plus
]

{ #category : #grammar }
PPMarkdownGrammar >> listTight [
	^ listItemTight plus
		, blankLine star
		, (bullet / enumerator) not
]

{ #category : #token }
PPMarkdownGrammar >> newline [
	"Copied from PPToken>>newline, because it's private there.
	#newline asParser is incorrect because it represents a class of characters."
	^ (Character lf asParser)
		/ (Character cr asParser , Character lf asParser optional)

]

{ #category : #token }
PPMarkdownGrammar >> nonIndentSpace [
	^ #space asParser max: 3
]

{ #category : #token }
PPMarkdownGrammar >> nonSpaceCharacter [
	^ space not , #newline asParser not , #any asParser
]

{ #category : #token }
PPMarkdownGrammar >> normalEndline [
	^ spaces , newline ,
		blankLine not ,
		$> asParser not ,
		atxStart not ,
		(line , (($= asParser min: 3) / ($- asParser min: 3)) , newline) not
]

{ #category : #token }
PPMarkdownGrammar >> optionallyIndentedLine [
	^ indent optional , line
]

{ #category : #'grammar-block' }
PPMarkdownGrammar >> orderedList [
	^ enumerator and , (listLoose / listTight)
]

{ #category : #'grammar-block' }
PPMarkdownGrammar >> paragraph [
	^ nonIndentSpace , inlines , (blankLine plus / document end)
]

{ #category : #grammar }
PPMarkdownGrammar >> parenthesisSource [
	^ self delimitedSource: '()'
]

{ #category : #grammar }
PPMarkdownGrammar >> plain [
	^ inlines
]

{ #category : #grammar }
PPMarkdownGrammar >> referenceLink [
	^ label , (spacedNewline , (label / '[]' asParser)) optional
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> setextHeading [
	^ (endline not , inline) plus , newline , ($= asParser / $- asParser min: 3) token , newline
]

{ #category : #grammar }
PPMarkdownGrammar >> source [
	^ ($( asParser not , $) asParser not , $> asParser not , nonSpaceCharacter) plus flatten trimBlanks.
]

{ #category : #token }
PPMarkdownGrammar >> space [
	^ #blank asParser
]

{ #category : #token }
PPMarkdownGrammar >> spacedNewline [
	^ spaces , (newline , spaces) optional
]

{ #category : #token }
PPMarkdownGrammar >> spaces [
	^ space star token
]

{ #category : #token }
PPMarkdownGrammar >> specialCharacter [
	^ PPPredicateObjectParser anyOf: #( $* $_ $` $& $[ $] $< $! $\ )
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> starLine [
	^ ($* asParser min: 4) / (space , $* asParser plus , space and)
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> starredEmphasis [
	| oneStarOpen oneStarClose |
	oneStarOpen := starLine not , $* asParser , space not , newline not.
	oneStarClose := space not , newline not , $* asParser.
	^  oneStarOpen , (oneStarClose not , inline) plus, oneStarClose
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> starredStrong [
	| twoStarOpen twoStarClose |
	twoStarOpen := starLine not , '**' asParser , space not , newline not.
	twoStarClose := space not , newline not , '**' asParser.
	^  twoStarOpen, (twoStarClose not , inline) plus, twoStarClose
]

{ #category : #accessing }
PPMarkdownGrammar >> start [
	^ document trimSpacesRight end
]

{ #category : #'grammar-inline' }
PPMarkdownGrammar >> strong [
	^ starredStrong / underlinedStrong
]

{ #category : #token }
PPMarkdownGrammar >> symbol [
	^ specialCharacter
]

{ #category : #token }
PPMarkdownGrammar >> terminalEndline [
	^ spaces , newline end
]

{ #category : #token }
PPMarkdownGrammar >> text [
	^ withUnderscores / entity / escapedCharacter / symbol / (space flatten)
]

{ #category : #grammar }
PPMarkdownGrammar >> title [
	"this is actually TitleDouble from peg-markdown"
	^ $" asParser ,
	(($" asParser , spaces , ($) asParser / newline)) not , #any asParser ) star flatten trimBlanks,
	$" asParser
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underlinedEmphasis [
	| oneUnderscoreOpen oneUnderscoreClose |
	oneUnderscoreOpen := underscoreLine not , $_ asParser , space not , newline not.
	oneUnderscoreClose := space not , newline not ,
		underlinedStrong not , $_ asParser , #word asParser not.
	^  oneUnderscoreOpen, (oneUnderscoreClose not , inline) plus, oneUnderscoreClose
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underlinedStrong [
	| twoUlOpen twoUlClose |
	twoUlOpen := starLine not , '__' asParser , space not , newline not.
	twoUlClose := space not , newline not , '__' asParser , #word asParser not.
	^  twoUlOpen, ( twoUlClose not , inline ) plus, twoUlClose
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underscoreLine [
	^ ($_ asParser min: 4) / (space , $_ asParser plus , space and)
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underscoreOrStarLine [
	^ underscoreLine / starLine
]

{ #category : #grammar }
PPMarkdownGrammar >> url [
	^ ((#letter asParser plus) , '://' asParser , (#space asParser negate plus)) flatten
]

{ #category : #grammar }
PPMarkdownGrammar >> verbatim [
	^ (indent, ((newline not, #any asParser) star) flatten, newline) plus.
]

{ #category : #token }
PPMarkdownGrammar >> withUnderscores [
	| normalCharacter |
	normalCharacter := (specialCharacter / space / #newline asParser) negate.
	"withUnderscore is the Str production in peg-markdown"
	^ (normalCharacter , (normalCharacter / ($_ asParser plus , normalCharacter and)) star) flatten.
]
