accessing
defaultConfiguration
	| defaultConfiguration |
	defaultConfiguration := ConfigurationForPillar new.
	defaultConfiguration properties at: 'outputType' put: self.
	defaultConfiguration properties at: 'configurations' put: Dictionary new.	"we specify an empty collection of sub configurations to avoid infinite recursion : a default configuration would otherwise contain a collection of default configurations, each containing a collection of default configurations..."
	^ defaultConfiguration