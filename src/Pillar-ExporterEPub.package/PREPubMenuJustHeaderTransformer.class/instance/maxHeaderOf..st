private
maxHeaderOf: anObject
	^ anObject isHeader
		ifTrue: [ anObject level ]
		ifFalse: [ anObject isGroup
				ifTrue: [ anObject children size > 0
						ifTrue: [ (anObject children
								collect: [ :child | 
									child isHeader
										ifTrue: [ child level ]
										ifFalse: [ 7 ] ]) min ] ]
				ifFalse: [ 7 ] ]