visiting-document
visitExternalLink: anExternalLink
	self link: anExternalLink localFileOrExternalReference named: [ stream << anExternalLink text ]