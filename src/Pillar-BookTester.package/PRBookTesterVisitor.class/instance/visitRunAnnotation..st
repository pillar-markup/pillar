visiting-annotations
visitRunAnnotation: aPRRunAnnotation
	"Todo visitor specification + exception handling"
	| testClass |
	testClass := ((aPRRunAnnotation parameters)at: #testClass) asSymbol.
	1halt.
	((self class environment) at: testClass) suite run passed 
								do: [ :each | |methodName| 
												  methodName := (each asString splitOn: '>>#') second.
												  self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test passed';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: methodName asSymbol) definition;
													 status: true; yourself)].
	((self class environment) at: testClass) suite run failures 
								do: [ :each | |methodName| 
												  methodName := (each asString splitOn: '>>#') second. 
												  self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test failed';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: methodName asSymbol) definition;
													 status: false; yourself)].
	((self class environment) at: testClass) suite run errors 
								do: [ :each | |methodName| 
												  methodName := (each asString splitOn: '>>#') second.
 												  self allTestResults add:
													(PRBookTestResult new 
													 explanation: 'Test errored';
													 text: testClass asString, '>>', 
															 (((self class environment) at: testClass) methodDict at: methodName asSymbol) definition;
													 status: false; yourself)].
	
	