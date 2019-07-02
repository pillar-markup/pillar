"
A parser for Markdown, inspired/ported from the PEG grammars in John MacFarlane's peg-markdown and lunamark.

http://daringfireball.net/projects/markdown/
http://github.com/jgm/peg-markdown/
http://github.com/jgm/lunamark/
"
Class {
	#name : #PPMarkdownGrammar,
	#superclass : #PP2CompositeNode,
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
	#category : #'PetitMarkdown-Core'
}

{ #category : #grammar }
PPMarkdownGrammar >> angleBracketSource [
	^ self delimitedSource: '<>'
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> atxHeading [
	|hash|
	hash := $# asPParser star.
	^ atxStart , spaces ,
		"(newline not , ($# asParser star trim , newline) not , inline) plus flatten,"
		((hash , newline) not , inline) plus,
		spaces optional, hash optional ,
		newline
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> atxStart [
	^ ($# asPParser min: 1 max: 6) token
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
	^ ($> asPParser , space optional) plus , line , newline
		, (newline not , line , newline) star
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> bullet [
	^ horizontalRule not
		, nonIndentSpace
		, ($+ asPParser / $* asPParser / $- asPParser) token
		, space plus
]

{ #category : #'grammar-block' }
PPMarkdownGrammar >> bulletList [
	^ bullet and , (listTight / listLoose)
]

{ #category : #grammar }
PPMarkdownGrammar >> code [
	| tick doubleTick |
	tick := $` asPParser.
	doubleTick := '``' asPParser.
		^ (doubleTick , spaces, doubleTick negate plus flatten, spaces, doubleTick) /
		(tick , spaces, tick negate plus flatten, spaces, tick).
		
	
]

{ #category : #grammar }
PPMarkdownGrammar >> delimitedSource: delimiters [
	^ 
		delimiters first asPParser, 
			(space / delimiters last asPParser) negate plus flatten trimSpaces , 
		delimiters last asPParser
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
	hexEntity := '&#' asPParser , $x asPParser caseInsensitive
		, #hex asPParser plus , $; asPParser.
	decEntity := '&#' asPParser , #digit asPParser plus , $; asPParser.
	charEntity := $& asPParser , #word asPParser plus , $; asPParser.
	^ (hexEntity / decEntity / charEntity) flatten
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> enumerator [
	^ nonIndentSpace , (#digit asPParser plus , $. asPParser) token , space plus
]

{ #category : #'grammar-inline' }
PPMarkdownGrammar >> escapedCharacter [
	^ $\ asPParser , newline not
		,
			(PP2PredicateObjectNode
				on: [ :char | '-\`|*_{}[]()#+.!><' includes: char ]
				message: 'Special character expected')
]

{ #category : #grammar }
PPMarkdownGrammar >> explicitImage [
	^ '!' asPParser, self link.
]

{ #category : #grammar }
PPMarkdownGrammar >> explicitLink [
	^ label , spacedNewline , (
		
		'()' asPParser |
		
		($( asPParser , spaces ,
		source , spaces ,
		title optional , spaces ,
		$) asPParser))
]

{ #category : #'grammar-block' }
PPMarkdownGrammar >> heading [
	^ atxHeading / setextHeading
]

{ #category : #grammar }
PPMarkdownGrammar >> horizontalRule [
	^ nonIndentSpace
		,
			(($* asPParser , ((spaces , $* asPParser) star min: 2))
				/ ($- asPParser , ((spaces , $- asPParser) star min: 2))
				/ ($_ asPParser , ((spaces , $_ asPParser) star min: 2))) , spaces
		, newline , blankLine plus
]

{ #category : #token }
PPMarkdownGrammar >> indent [
	^ Character tab asPParser / '    ' asPParser
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
	^ $[ asPParser
		, ($] asPParser not , labelInline) plus flatten trimBlanks
		, $] asPParser
	"notes handling here"
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
	^ '  ' asPParser , normalEndline
]

{ #category : #grammar }
PPMarkdownGrammar >> link [
	^ explicitLink / linkDefinition / referenceLink / autoLink
]

{ #category : #grammar }
PPMarkdownGrammar >> linkDefinition [
	^ label , $: asPParser , spaces
		, (angleBracketSource / parenthesisSource / source) , spaces
		, linkDefinitionTitle optional
]

{ #category : #grammar }
PPMarkdownGrammar >> linkDefinitionTitle [
	^ (self linkDefinitionTitle: '""') / (self linkDefinitionTitle: '''''') / (self linkDefinitionTitle: '()')
]

{ #category : #grammar }
PPMarkdownGrammar >> linkDefinitionTitle: delimiters [
	^ delimiters first asPParser
		,
			((delimiters last asPParser / newline) not , #any asPParser) star
				flatten trimBlanks , delimiters last asPParser
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
	^ #newline asPParser
]

{ #category : #token }
PPMarkdownGrammar >> nonIndentSpace [
	^ #space asPParser star max: 3
]

{ #category : #token }
PPMarkdownGrammar >> nonSpaceCharacter [
	^ space not , #endOfLine asPParser not , #any asPParser
]

{ #category : #token }
PPMarkdownGrammar >> normalEndline [
	^ spaces , newline , blankLine not , $> asPParser not , atxStart not
		,
			(line , (($= asPParser star min: 3) / ($- asPParser star min: 3))
				, newline) not
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
	^ label , (spacedNewline , (label / '[]' asPParser)) optional
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> setextHeading [
	^ (endline not , inline) plus , newline
		, (($= asPParser / $- asPParser) star min: 3) token , newline
]

{ #category : #grammar }
PPMarkdownGrammar >> source [
	^ ($( asPParser not , $) asPParser not , $> asPParser not
		, nonSpaceCharacter) plus flatten trimBlanks
]

{ #category : #token }
PPMarkdownGrammar >> space [
	^ #blank asPParser
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
	^ PP2PredicateObjectNode anyOf: #($* $_ $` $& $[ $] $< $! $\)
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> starLine [
	^ ($* asPParser star min: 4)
		/ (space , $* asPParser plus , space and)
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> starredEmphasis [
	| oneStarOpen oneStarClose |
	oneStarOpen := starLine not , $* asPParser , space not , newline not.
	oneStarClose := space not , newline not , $* asPParser.
	^ oneStarOpen , (oneStarClose not , inline) plus , oneStarClose
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> starredStrong [
	| twoStarOpen twoStarClose |
	twoStarOpen := starLine not , '**' asPParser , space not
		, newline not.
	twoStarClose := space not , newline not , '**' asPParser.
	^ twoStarOpen , (twoStarClose not , inline) plus , twoStarClose
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

	^ $" asPParser
		,
			(($" asPParser , spaces , ($) asPParser / newline)) not
				, #any asPParser) star flatten trimBlanks , $" asPParser
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underlinedEmphasis [
	| oneUnderscoreOpen oneUnderscoreClose |
	oneUnderscoreOpen := underscoreLine not , $_ asPParser , space not
		, newline not.
	oneUnderscoreClose := space not , newline not , underlinedStrong not
		, $_ asPParser , #word asPParser not.
	^ oneUnderscoreOpen , (oneUnderscoreClose not , inline) plus
		, oneUnderscoreClose
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underlinedStrong [
	| twoUlOpen twoUlClose |
	twoUlOpen := starLine not , '__' asPParser , space not , newline not.
	twoUlClose := space not , newline not , '__' asPParser
		, #word asPParser not.
	^ twoUlOpen , (twoUlClose not , inline) plus , twoUlClose
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underscoreLine [
	^ ($_ asPParser star min: 4)
		/ (space , $_ asPParser plus , space and)
]

{ #category : #'grammar-secondary' }
PPMarkdownGrammar >> underscoreOrStarLine [
	^ underscoreLine / starLine
]

{ #category : #grammar }
PPMarkdownGrammar >> url [
	^ (#letter asPParser plus , '://' asPParser
		, #space asPParser negate plus) flatten
]

{ #category : #grammar }
PPMarkdownGrammar >> verbatim [
	^ (indent , (newline not , #any asPParser) star flatten , newline)
		plus
]

{ #category : #token }
PPMarkdownGrammar >> withUnderscores [
	| normalCharacter |
	normalCharacter := (specialCharacter / space / #newline asPParser)
		negate.
	"withUnderscore is the Str production in peg-markdown"
	^ (normalCharacter
		, (normalCharacter / ($_ asPParser plus , normalCharacter and)) star)
		flatten
]
