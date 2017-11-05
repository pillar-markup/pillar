versions (0.x)
version07: spec
	<version: '0.7' imports: #('0.3-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'Pillar-Model' with: 'Pillar-Model-BenjaminVanRyseghem.51';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-BenjaminVanRyseghem.70';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.36';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.42';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.54';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.33';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.41';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.27';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.27';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.13' ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7'.
			 ]