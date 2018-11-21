Class {
	#name : #BaselineOfPillarExporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarExporter
}

{ #category : #baselines }
BaselineOfPillarExporter >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec 
				baseline: 'PillarCore' with: [ spec 
					repository: 'github://feenkcom/pillar:feenk/src' ];
				baseline: 'Chrysal' with: [ spec 
					repository: 'github://Ducasse/Chrysal/src' ];
				baseline: 'Mustache' with: [ spec
					repository: 'github://noha/mustache:v1.0/repository';
					loads: #('Core' 'Tests') ];
				
				package: 'Pillar-Chrysal-Generator' with: [ spec 
					requires: #( 'PillarCore' 'Chrysal') ];
				package: 'Pillar-Chrysal' with: [ spec 
					requires: #( 'PillarCore' "'Pillar-ExporterCore'" ) ];
				"Pillar-Chrysal should only depend on Chrysal-Runtime 
				but right now I do not know how to express that the Chrysal (builder) 
				is different from Chrysal-Runtime"
				
				package: 'Pillar-ExporterCore' with: [ spec 
					requires: #( 'PillarCore' 'Mustache' 'Pillar-Chrysal' ) ];
				package: 'Pillar-ExporterAsciiDoc' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterBeamer' with: [ spec requires: #('Pillar-ExporterLaTeX') ];
				package: 'Pillar-ExporterDeckJS' with: [ spec requires: #('Pillar-ExporterHTML') ];
				package: 'Pillar-ExporterEPub' with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-ExporterHTML') ];
				package: 'Pillar-ExporterHTML' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterLaTeX' with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-ExporterPillar') ];
				package: 'Pillar-ExporterMarkdown' with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-ExporterHTML') ];
				package: 'Pillar-ExporterPillar' with: [ spec requires: #('Pillar-ExporterCore' 'PillarCore') ];
				package: 'Pillar-ExporterText' with: [ spec requires: #('Pillar-ExporterCore') ];

				package: 'Pillar-Tests-ExporterAsciiDoc'
					with: [ spec requires: #('Pillar-ExporterAsciiDoc' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterBeamer' with: [ spec requires: #('Pillar-ExporterBeamer' 'Pillar-Tests-ExporterLaTeX') ];
				package: 'Pillar-Tests-ExporterCore' with: [ spec requires: #('Pillar-Tests-Model' 'Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterDeckJS' with: [ spec requires: #('Pillar-ExporterDeckJS' 'Pillar-Tests-ExporterHTML') ];
				package: 'Pillar-Tests-ExporterEPub' with: [ spec requires: #(#'Pillar-ExporterEPub' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterHTML' with: [ spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterLaTeX' with: [ spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterMarkdown'
					with: [ spec requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-ExporterCore' 'Pillar-Tests-ExporterHTML') ];
				package: 'Pillar-Tests-ExporterPillar' with: [ spec requires: #('Pillar-ExporterPillar' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterText' with: [ spec requires: #('Pillar-ExporterText' 'Pillar-Tests-ExporterCore') ];
				
				"Pillar-Tests-Model should be in core, but has many exporter dependencies"
				package: 'Pillar-Tests-Model' with: [ spec requires: #('PillarCore' 'Pillar-ExporterPillar' 'Pillar-ExporterText') ].
				
					
		spec
				group: 'All exporters'
					with:
					#('html exporter' 'latex exporter' 'beamer exporter' 'deckjs exporter' 'markdown exporter' 'pillar exporter' 'text exporter' 'asciidoc exporter' 'ePub exporter');
				group: 'asciidoc exporter' with: #(#'Pillar-ExporterAsciiDoc');
				group: 'asciidoc exporter tests' with: #(#'Pillar-Tests-ExporterAsciiDoc' 'ePub exporter');
				group: 'beamer exporter' with: #('Pillar-ExporterBeamer');
				group: 'beamer exporter tests' with: #('Pillar-Tests-ExporterBeamer');
				group: 'deckjs exporter' with: #('Pillar-ExporterDeckJS');
				group: 'deckjs exporter tests' with: #('Pillar-Tests-ExporterDeckJS');
				group: 'ePub exporter' with: #(#'Pillar-ExporterEPub');
				group: 'ePub exporter tests' with: #(#'Pillar-Tests-ExporterEPub');
				group: 'html exporter' with: #('Pillar-ExporterHTML');
				group: 'html exporter tests' with: #('Pillar-Tests-ExporterHTML');
				group: 'latex exporter' with: #('Pillar-ExporterLaTeX');
				group: 'latex exporter tests' with: #('Pillar-Tests-ExporterLaTeX');
				group: 'markdown exporter' with: #('Pillar-ExporterMarkdown' 'PillarCore');
				group: 'markdown exporter tests' with: #('Pillar-Tests-ExporterMarkdown');
				group: 'pillar exporter' with: #('Pillar-ExporterPillar');
				group: 'pillar exporter tests' with: #('Pillar-Tests-ExporterPillar');
				group: 'text exporter' with: #('Pillar-ExporterText');
				group: 'text exporter tests' with: #('Pillar-Tests-ExporterText').
	]

]
