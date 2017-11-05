versions (0.x)
version01: spec
	"protocol: accessing"

	<version: '0.1' imports: #('0.1-baseline')>
	spec
		for: #common
		do: [ 
			spec
				blessing: #release;
				package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.34';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.18';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.23';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.27';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.24';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.13';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.15';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.3' ]