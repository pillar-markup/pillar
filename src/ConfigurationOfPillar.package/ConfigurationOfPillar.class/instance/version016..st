versions (0.x)
version016: spec
	<version: '0.16' imports: #('0.12-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.16'.
		spec author: 'DamienCassou'.
		spec timestamp: '6/6/2014 17:38'.
		spec 
			project: 'Grease' with: #'release1.1';
			project: 'Mustache' with: '0.60';
			project: 'STON' with: '0.9'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.83';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.97';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.84';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-BenComan.59';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-BenComan.54';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.46';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.9';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-DamienCassou.5';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.56';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-BenComan.18';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-BenComan.83';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-BenComan.33';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-BenComan.6';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.8'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-PharoInspector' with: 'Pillar-PharoInspector-DamienCassou.1';
			package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
