tests
testIsClassDefinition

	| cb1 |
	cb1 := PRCodeblock content:'SuperClass name subclass: #ClassName
instanceVariableNames: ''''
classVariableNames: ''''
package: ''PackageName'''
						   parameters: (OrderedDictionary newFromKeys: #('classDefinition') andValues: #(true)).
	self assert: cb1 isClassDefinition.	