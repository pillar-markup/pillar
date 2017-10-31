tests
testTransformationWithNonGroupItemAtTopLevel
	| input expected |
	"This test makes sure that a document item which is not a document group can be a direct child of a slide"
	input := PRDocument new
		add: PRSlideTitleAnnotation new;
		add: PRHorizontalRule new;
		yourself.
	expected := PRDocument new
		add:
			(PRSlide new
				add: PRHorizontalRule new;
				yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected