private
noteAtEnd
	self noteDictionary isNotEmpty
		ifTrue: [ canvas newLine.
			canvas tag
				name: 'hr';
				with: ''.
			canvas newLine ].
	self noteDictionary
		keysAndValuesDo: [ :keys :value | 
			canvas tag
				name: 'sup';
				parameterAt: 'id' put: 'footnote' , keys asString;
				with: '[' , keys asString , '] ' , value.
			canvas emptyTag
				name: 'br';
				closeTag.
			canvas newLine ]