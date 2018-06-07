"
I'm a specific item for Pillar only configuration. 
I'm used to manage languages. 

Used for example this way

languageForScript: aScript
	^ aScript language isSpecified
		ifTrue: [ aScript language ]
		ifFalse: [ self configuration defaultScriptLanguage ]
		
	
scriptLanguages are defined that way in cocoon

descriptionDefaultScriptLanguage
	<magritteDescription>
	^ PRMagritteScriptLanguageDescription new
		priority: 100;
		accessor: #defaultScriptLanguage;
		label: 'Default language for scripts.';
		cocoonDocumentation:
				'Indicate the language in scripts when none is specified. This language is used for syntax highlighting. The currently supported languages are ', (PRRealScriptLanguage withAllConcreteClasses collect: #standardName) asCommaStringAnd, '.';
		default: PRUnspecifiedScriptLanguage default;
		cocoonDefaultDocumentation: 'An unspecified language';
		yourself
		
	

PRRealScriptLanguage withAllConcreteClasses collect: #standardName 
>>> #('bash' 'css' 'html' 'http' 'json' 'javascript' 'pillar' 'sql' 'ston' 'shellcommands' 'smalltalk')

PRUnspecifiedScriptLanguage default 
>>> ''




"
Class {
	#name : #CodeBlockDefaultLanguageItem,
	#superclass : #ChrysalItem,
	#category : 'Pillar-Chrysal-Generator'
}

{ #category : #accessing }
CodeBlockDefaultLanguageItem >> defaultDomainValueString [
	"Returns a string representing the default value but as an object once imported in Pharo and not a string used by the writer of a configuration."

	^ '(PRRealScriptLanguage for: {1})' format: {self default}
]

{ #category : #accessing }
CodeBlockDefaultLanguageItem >> defaultValue [
	"Default value is the default value of an item in the domain of the configuration writer and not in the Pharo world."
	^ nil  
	
	"so that we get PRRealScriptLanguage for: nil 
	returns a PRUnspecificiedScriptLanguage"
]

{ #category : #conversion }
CodeBlockDefaultLanguageItem >> domainValueConversionString [
	"Returns a string converting a string as written by in the configuration file to a pharo object. 
	Note that this method is like the body of a macro that will be expanded in the configuration class: here aValue is the name of the parameter of the generated method.
	
	 Parameter of the item like baseline should be accessed via self nameOfProperty"

	^ '^ PRAbstractScriptLanguage for: aValue' 
]

{ #category : #initialization }
CodeBlockDefaultLanguageItem >> initialize [

	super initialize. 
	propertyName := #defaultScriptLanguage.
	explanation := 'Indicate the language in scripts when none is specified. This language is used for syntax highlighting. The currently supported languages are ', self possibleValuesString
]

{ #category : #initialization }
CodeBlockDefaultLanguageItem >> possibleValuesString [
	^(PRRealScriptLanguage withAllConcreteClasses collect: #standardName) asCommaStringAnd.
]
