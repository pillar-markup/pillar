baselines
"protocol: accessing"
baseline01: spec
	<version: '0.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/'.
			spec package: 'Pillar-Model' with: [ spec requires: #('Grease') ].
			spec package: 'Pillar-Tests-Model' with: [ spec requires: #('Pillar-Model') ].
			spec package: 'Pillar-ExporterHTML' with: [ spec requires: #('Pillar-Model') ].
			spec package: 'Pillar-Tests-ExporterHTML' with: [ spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-Model') ].
			spec package: 'Pillar-ExporterLaTeX' with: [ spec requires: 'Pillar-Model' ].
			spec package: 'Pillar-Tests-ExporterLaTeX' with: [ spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-Model') ].
			spec package: 'Pillar-ExporterMarkdown' with: [ spec requires: 'Pillar-Model' ].
			spec package: 'Pillar-Tests-ExporterMarkdown' with: [ spec requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-Model') ].
			spec group: 'ALL' with: #('Pillar-Tests-ExporterLaTeX' 'Pillar-Tests-ExporterHTML' 'Pillar-Tests-ExporterMarkdown' ).
			self grease: spec ]