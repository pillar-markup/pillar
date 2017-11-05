versions (0.x)
version04: spec
	<version: '0.4' imports: #('0.3-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.47';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.57';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.30';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.33';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.47';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.31';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.34';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.24';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.20';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.9' ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7'.
			 ]