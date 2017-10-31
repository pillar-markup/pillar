helpers
writeLabelOfExternalLink: anExternalLink
	| label |
	label := anExternalLink parameters at: 'label' ifAbsent: [ anExternalLink localFileOrExternalReference ].
	canvas command
		name: 'label';
		parameter: [ canvas raw: label ]