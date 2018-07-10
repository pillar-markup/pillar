visiting-annotations
visitRunAnnotation: aPRRunAnnotation
	"Todo visitor specification + exception handling"
	| testClass |
	testClass := ((aPRRunAnnotation parameters)at: #testClass) asSymbol.
	((self class environment) at: testClass) suite run failures 
								do: [ :each | self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test failed';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: each) definition;
													 status: false; yourself)].
	((self class environment) at: testClass) suite run errors 
								do: [ :each |self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test errored';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: each) definition;
													 status: false; yourself)].
	
	