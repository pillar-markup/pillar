accessing
defaultDomainValueString
	"Returns a string representing the default value but as an object once imported in Pharo and not a string used by the writer of a configuration."

	^ '(PRRealScriptLanguage for: ''{1}'')' format: {self default}