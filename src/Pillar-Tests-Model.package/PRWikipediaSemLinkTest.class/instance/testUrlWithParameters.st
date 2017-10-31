as yet unclassified
testUrlWithParameters
	"this link could be for example *link to atom on wiki>wikipedia:Atom|lang=fr*"
	
	self instance reference: self referenceString;
		parameters: (Dictionary with: 'lang' -> 'fr').
	self assert: self instance url equals: 'https://fr.wikipedia.org/wiki/Atom'