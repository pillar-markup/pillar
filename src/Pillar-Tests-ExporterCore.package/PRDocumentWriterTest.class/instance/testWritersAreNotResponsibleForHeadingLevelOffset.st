tests
testWritersAreNotResponsibleForHeadingLevelOffset
	| item |
	item := PRHeader new
		level: 1;
		add: (PRText content: 'foo');
		yourself.
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}.
	self configuration headingLevelOffset: 2.
	"Writers should *not* take care of headingLevelOffset:"
	self assertWriting: item includesTexts: {self level1HeaderWithFoo}