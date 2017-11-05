versions (0.x)
version08: spec
	<version: '0.8' imports: #('0.3-baseline')>
	spec
		for: #common
		do: [ 
			spec
				description: 'To be filled out.'; 
				blessing: #release.
				
			spec
				project: 'Grease' with: '1.1.5';
				project: 'Mustache' with: '0.48';
				project: 'STON' with: '0.7'.
				
			spec
				package: 'Pillar-Model' with: 'Pillar-Model-BenjaminVanRyseghem.51';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-BenjaminVanRyseghem.70';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.36';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.43';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.54';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.33';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.41';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.27';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.28';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.13' ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7'.
			 ]