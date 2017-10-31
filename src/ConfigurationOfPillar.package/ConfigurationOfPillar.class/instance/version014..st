versions (0.x)
version014: spec
	<version: '0.14' imports: #('0.11-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.14'.
		spec author: 'DamienCassou'.
		spec timestamp: '6/3/2014 17:49'.
		spec 
			project: 'Grease' with: #'release1.1';
			project: 'Mustache' with: '0.60';
			project: 'STON' with: '0.9'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.81';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.97';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.82';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.58';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.53';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.44';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.9';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-DamienCassou.4';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.52';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.16';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.82';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.32';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.5';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.6'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-PharoInspector' with: 'Pillar-PharoInspector-DamienCassou.1';
			package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7'. ].
