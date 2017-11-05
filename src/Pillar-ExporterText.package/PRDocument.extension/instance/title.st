*pillar-exportertext
title
	^ self propertyAt: 'title' ifAbsent: [ self titleFromFirstHeader ]