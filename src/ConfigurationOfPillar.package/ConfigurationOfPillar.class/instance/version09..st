versions (0.x)
version09: spec
	<version: '0.9' imports: #('0.3-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release.
				
			spec
				project: 'Grease' with: '1.1.5';
				project: 'Mustache' with: '0.48';
				project: 'STON' with: '0.7'.
				
			spec
				package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.62';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.71';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.37';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienPollet.46';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.54';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.39';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.42';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.27';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.30';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.13' ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7'.
			 ]