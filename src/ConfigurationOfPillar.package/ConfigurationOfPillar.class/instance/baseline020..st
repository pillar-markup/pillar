baselines
baseline020: spec
	<version: '0.20-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/'.
			self
				grease: spec;
				mustache: spec;
				ston: spec.
			spec
				package: 'Pillar-Model' with: [ spec requires: #('Grease') ];
				package: 'Pillar-Tests-Model'
					with: [ spec requires: #('Pillar-Model' 'Pillar-ExporterPillar' 'Pillar-ExporterText') ];
				package: 'Pillar-ExporterCore' with: [ spec requires: #('Pillar-Model' 'Mustache' 'STON') ];
				package: 'Pillar-ExporterMarkdown' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterLaTeX' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterHTML' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterPillar' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterText' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterCore' with: [ spec requires: #('Pillar-Tests-Model' 'Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterMarkdown'
					with: [ spec requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterLaTeX'
					with: [ spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterHTML' with: [ spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterPillar'
					with: [ spec requires: #('Pillar-ExporterPillar' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterText' with: [ spec requires: #('Pillar-ExporterText' 'Pillar-Tests-ExporterCore') ].
			spec
				group: 'html exporter' with: #('Pillar-ExporterHTML');
				group: 'html exporter tests' with: #('Pillar-Tests-ExporterHTML');
				group: 'latex exporter' with: #('Pillar-ExporterLaTeX');
				group: 'latex exporter tests' with: #('Pillar-Tests-ExporterLaTeX');
				group: 'markdown exporter' with: #('Pillar-ExporterMarkdown');
				group: 'markdown exporter tests' with: #('Pillar-Tests-ExporterMarkdown');
				group: 'pillar exporter' with: #('Pillar-ExporterPillar');
				group: 'pillar exporter tests' with: #('Pillar-Tests-ExporterPillar');
				group: 'text exporter' with: #('Pillar-ExporterText');
				group: 'text exporter tests' with: #('Pillar-Tests-ExporterText');
				group: 'All exporters'
					with: #('html exporter' 'latex exporter' 'markdown exporter' 'pillar exporter' 'text exporter');
				group: 'All exporter tests'
					with:
						#('html exporter tests' 'latex exporter tests' 'markdown exporter tests' 'pillar exporter tests' 'text exporter tests');
				group: 'All tests' with: #('All exporter tests' 'Pillar-Tests-Model' 'Pillar-Tests-ExporterCore');
				group: 'All but tests' with: #('All exporters');
				group: 'ALL' with: #('All tests' 'All but tests') ].
	spec
		for: #pharo
		do: [ 
			spec
				package: 'Pillar-Pharo-Tools' with: [ spec requires: #('Pillar-Model' 'Pillar-ExporterPillar') ];
				package: 'Pillar-Cli' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-GitBook' with: [ spec requires: #('Pillar-Cli' 'markdown exporter' 'text exporter') ];
				group: 'All but tests' with: #('Pillar-Cli' 'Pillar-Pharo-Tools' 'Pillar-GitBook') ]