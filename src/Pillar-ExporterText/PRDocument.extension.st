Extension { #name : #PRDocument }

{ #category : #'*pillar-exportertext' }
PRDocument >> defaultTitle [
	^ 'No title'
]

{ #category : #'*pillar-exportertext' }
PRDocument >> title [
	^ self propertyAt: 'title' ifAbsent: [ self titleFromFirstHeader ]
]

{ #category : #'*pillar-exportertext' }
PRDocument >> titleFromFirstHeader [
	^ self children
		detect: [ :child | child isHeader ]
		ifFound: [ :header | PRTextWriter write: header ]
		ifNone: [ self defaultTitle ]
]
