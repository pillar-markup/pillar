baselines
baseline02: spec
	"protocol: accessing"

	<version: '0.2-baseline'>
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
			spec group: 'ALL' with: #('Pillar-Tests-ExporterLaTeX' 'Pillar-Tests-ExporterHTML' 'Pillar-Tests-ExporterMarkdown').
			self
				grease: spec;
				mustache: spec;
				ston: spec ].