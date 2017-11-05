versions (0.x)
version02: spec
	<version: '0.2' imports: #('0.2-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.37';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.19';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.20';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.29';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.30';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.27';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-BenjaminVanRyseghem.31';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.13';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.16';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.3' ]