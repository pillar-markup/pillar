visiting-document
visitTableCell: aCell
	| tagName tag |
	tagName := aCell isHeading
		ifTrue: [ 'th' ]
		ifFalse: [ 'td' ].
	tag := canvas tag name: tagName.
	aCell isAligned
		ifTrue: [ 
			aCell isAlignedLeft
				ifTrue: [ tag parameterAt: 'style' put: 'text-align: left' ].
			aCell isAlignedCenter
				ifTrue: [ tag parameterAt: 'style' put: 'text-align: center' ].
			aCell isAlignedRight
				ifTrue: [ tag parameterAt: 'style' put: 'text-align: right' ] ].
	tag with: [ super visitTableCell: aCell ].
	canvas newLine