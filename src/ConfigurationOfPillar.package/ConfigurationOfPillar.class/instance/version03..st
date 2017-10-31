versions (0.x)
version03: spec
	<version: '0.3' imports: #('0.3-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.39';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.44';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.25';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.30';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.34';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.27';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.27';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.19';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.17';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.4' ].
	spec
		for: #'pharo3.x'
		do: [ 
			spec package: 'Pillar-Cli' with: 'Pillar-Cli-DamienCassou.5'.
			 ]