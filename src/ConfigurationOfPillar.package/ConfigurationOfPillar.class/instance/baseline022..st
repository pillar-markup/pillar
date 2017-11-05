baselines
baseline022: spec
	<version: '0.22-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/'.
			self
				grease: spec;
				mustache: spec;
				cocoon: spec.
			spec
				package: 'Pillar-Model' with: [ spec requires: #('Grease') ];
				package: 'Pillar-Tests-Model'
					with: [ spec requires: #('Pillar-Model' 'Pillar-ExporterPillar' 'Pillar-ExporterText') ];
				package: 'Pillar-ExporterCore' with: [ spec requires: #('Pillar-Model' 'Mustache' 'Cocoon') ];
				package: 'Pillar-ExporterMarkdown' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterLaTeX' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterBeamer' with: [ spec requires: #('Pillar-ExporterLaTeX') ];
				package: 'Pillar-ExporterHTML' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterPillar' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterText' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterCore' with: [ spec requires: #('Pillar-Tests-Model' 'Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterMarkdown'
					with: [ spec requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterLaTeX'
					with: [ spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterBeamer'
					with: [ spec requires: #('Pillar-ExporterBeamer' 'Pillar-Tests-ExporterLaTeX') ];
				package: 'Pillar-Tests-ExporterHTML' with: [ spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterPillar'
					with: [ spec requires: #('Pillar-ExporterPillar' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterText' with: [ spec requires: #('Pillar-ExporterText' 'Pillar-Tests-ExporterCore') ].
			spec
				group: 'html exporter' with: #('Pillar-ExporterHTML');
				group: 'html exporter tests' with: #('Pillar-Tests-ExporterHTML');
				group: 'latex exporter' with: #('Pillar-ExporterLaTeX');
				group: 'latex exporter tests' with: #('Pillar-Tests-ExporterLaTeX');
				group: 'beamer exporter' with: #('Pillar-ExporterBeamer');
				group: 'beamer exporter tests' with: #('Pillar-Tests-ExporterBeamer');
				group: 'markdown exporter' with: #('Pillar-ExporterMarkdown');
				group: 'markdown exporter tests' with: #('Pillar-Tests-ExporterMarkdown');
				group: 'pillar exporter' with: #('Pillar-ExporterPillar');
				group: 'pillar exporter tests' with: #('Pillar-Tests-ExporterPillar');
				group: 'text exporter' with: #('Pillar-ExporterText');
				group: 'text exporter tests' with: #('Pillar-Tests-ExporterText');
				group: 'All exporters'
					with: #('html exporter' 'latex exporter' 'beamer exporter' 'markdown exporter' 'pillar exporter' 'text exporter');
				group: 'All exporter tests'
					with:
						#('html exporter tests' 'latex exporter tests' 'beamer exporter tests' 'markdown exporter tests' 'pillar exporter tests' 'text exporter tests');
				group: 'All tests' with: #('All exporter tests' 'Pillar-Tests-Model' 'Pillar-Tests-ExporterCore');
				group: 'All but tests' with: #('All exporters');
				group: 'ALL' with: #('All tests' 'All but tests') ].
	spec
		for: #pharo
		do: [ 
			spec
				package: 'Pillar-Pharo-Tools' with: [ spec requires: #('Pillar-Model' 'All exporters') ];
				package: 'Pillar-Cli' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-GitBook' with: [ spec requires: #('Pillar-Cli' 'markdown exporter' 'text exporter') ];
				group: 'All but tests' with: #('Pillar-Cli' 'Pillar-Pharo-Tools' 'Pillar-GitBook') ]