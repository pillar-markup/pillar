baselines
baseline010: spec

	<version: '0.10-baseline'>
	spec
		for: #common
		do: [ 
			spec
				blessing: #baseline;
				repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/';
				package: 'Pillar-Model' with: [ spec requires: #('Grease') ];
				package: 'Pillar-ExporterCore' with: [ spec requires: #('Pillar-Model' 'Mustache' 'STON') ];
				package: 'Pillar-Tests-Model' with: [ spec requires: #('Pillar-Model') ];
				package: 'Pillar-Tests-ExporterCore' with: [ spec requires: #('Pillar-Tests-Model' 'Pillar-ExporterCore') ];
				package: 'Pillar-ExporterHTML' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterHTML' with: [ spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-ExporterLaTeX' with: [ spec requires: 'Pillar-ExporterCore' ];
				package: 'Pillar-Tests-ExporterLaTeX'
					with: [ spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-ExporterMarkdown' with: [ spec requires: 'Pillar-ExporterCore' ];
				package: 'Pillar-Tests-ExporterMarkdown'
					with: [ spec requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-ExporterCore') ].
			spec
				group: 'html' with: 'Pillar-ExporterHTML';
				group: 'html tests' with: 'Pillar-Tests-ExporterHTML';
				group: 'latex' with: 'Pillar-ExporterLaTeX';
				group: 'latex tests' with: 'Pillar-Tests-ExporterLaTeX';
				group: 'markdown' with: 'Pillar-ExporterMarkdown';
				group: 'markdown tests' with: 'Pillar-Tests-ExporterMarkdown';
				group: 'All exporters' with: #('html' 'latex' 'markdown');
				group: 'All exporter tests' with: #('html tests' 'latex tests' 'markdown tests');
				group: 'All tests' with: #('All exporter tests' 'Pillar-Tests-Model' 'Pillar-Tests-ExporterCore');
				group: 'All but tests' with: #('All exporters');
				group: 'ALL' with: #('All tests' 'All but tests').
			self
				grease: spec;
				mustache: spec;
				ston: spec ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec package: 'Pillar-Cli' with: [ spec requires: 'Pillar-ExporterCore' ].
			spec group: 'All but tests' with: #('Pillar-Cli') ]