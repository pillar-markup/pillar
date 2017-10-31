visiting-document
visitHeader: aHeader

	aHeader level = 1 ifTrue: [ icon := PRToolIcons heading1Icon ].
	aHeader level = 2 ifTrue: [ icon := PRToolIcons heading2Icon ].
	aHeader level = 3 ifTrue: [ icon := PRToolIcons heading3Icon ].
	aHeader level = 4 ifTrue: [ icon := PRToolIcons heading4Icon ].
	aHeader level = 5 ifTrue: [ icon := PRToolIcons heading5Icon ].
	aHeader level = 6 ifTrue: [ icon := PRToolIcons heading6Icon ].
	aHeader level > 6 ifTrue: [ icon := PRToolIcons headingXIcon ].