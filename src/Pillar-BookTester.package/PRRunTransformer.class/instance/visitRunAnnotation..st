visiting
visitRunAnnotation: aPRRunAnnotation
	"Todo visitor specification + exception handling"
	| testClass visitor |
	testClass := ((aPRRunAnnotation parameters)at: #testClass) asSymbol.
	((self class environment) at: testClass) suite run failures 
								do: [ :each |visitor allTestsResults add:
													(PRBookTestResult new 
													 explanation: 'Test failed';
													 text: 'How to obtain that text?';
													 status: false; yourself)].
	((self class environment) at: testClass) suite run failures 
								do: [ :each |visitor allTestsResults add:
													(PRBookTestResult new 
													 explanation: 'Test errored';
													 text: 'How to obtain that text?';
													 status: false; yourself)].
	
	