*pillar-exportertext
titleFromFirstHeader
	^ self children
		detect: [ :child | child isHeader ]
		ifFound: [ :header | PRTextWriter write: header ]
		ifNone: [ self defaultTitle ]