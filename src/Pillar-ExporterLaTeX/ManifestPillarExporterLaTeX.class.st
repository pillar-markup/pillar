"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestPillarExporterLaTeX',
	#superclass : 'PackageManifest',
	#category : 'Pillar-ExporterLaTeX',
	#package : 'Pillar-ExporterLaTeX'
}

{ #category : 'code-critics' }
ManifestPillarExporterLaTeX class >> ruleRBSendsDifferentSuperRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PRLaTeXWriter #visitAnnotatedParagraph: #false)) #'2015-09-24T11:14:45.010115+02:00') )
]
