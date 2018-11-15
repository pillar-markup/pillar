tests
testBibFileIsCorrectlyTransformed
	
	"Here we see that the configuration is holding a real object so taking its value blindly and pasting it in the template will not work."
	self assert: self configuration bibFile pathString equals: 'book.bib'.

	
	"the following test shows how the value of configuration is correctly transformed into a string that can be 
	used in a Mustache template."
	self assert: ((MustacheToken new token: 'bibFile') valueInContext: self configuration) equals: 'book.bib'