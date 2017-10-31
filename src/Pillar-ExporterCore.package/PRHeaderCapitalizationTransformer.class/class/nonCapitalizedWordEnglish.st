as yet unclassified
nonCapitalizedWordEnglish

	| result |
	result := Set with: 'to' with: 'and' with: 'or' with: 'an' with: 'a' with: 'of'.
			result addAll: (Set with: 'the' with: 'but' with: 'nor' with: 'for' with: 'yet' with: 'so').
			result addAll: (Set with: 'on' with: 'at' with: 'in').
			
	^ result