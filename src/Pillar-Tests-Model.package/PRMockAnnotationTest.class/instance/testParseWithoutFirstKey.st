tests
testParseWithoutFirstKey
	"an annotation can have a default parameter name that the user does not have to be forced to specify.
	 ${mock:Foo|number=5}$ means  ${mock:value=Foo|number=5}$ since mock defines defaultParameterName as 'value'.
	"

	| input expected |
	input := '${mock:value=Foo}$'.
	expected := PRMockAnnotation new.
	expected hadAllKeys: false.
	expected parameters at: 'value' put: 'Foo'.
	self assert: (PRDocument parser parse: input startingAt: #annotation) equals: expected