conversion
domainValueConversionString
	"Returns a string converting a string as written by in the configuration file to a pharo object. 
	Note that this method is like the body of a macro that will be expanded in the configuration class: here aValue is the name of the parameter of the generated method.
	
	 Parameter of the item like baseline should be accessed via self nameOfProperty"

	^ '^ PRAbstractScriptLanguage for: aValue' 