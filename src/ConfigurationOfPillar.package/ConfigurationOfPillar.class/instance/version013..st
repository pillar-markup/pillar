versions (0.x)
version013: spec
	<version: '0.13' imports: #('0.11-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.13'.
		spec author: 'DamienCassou'.
		spec timestamp: '4/18/2014 17:44'.
		spec 
			project: 'Grease' with: #'release1.1';
			project: 'Mustache' with: '0.50';
			project: 'STON' with: '0.8'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.75';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.51';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.80';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.57';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.50';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.40';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.9';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-DamienCassou.4';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.51';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.15';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.36';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.31';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.4';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.4'. ].

	spec for: #'pharo3.x' do: [
		spec 
			package: 'Pillar-PharoInspector' with: 'Pillar-PharoInspector-DamienCassou.1';
			package: 'Pillar-Cli' with: 'Pillar-Cli-BenjaminVanRyseghem.7'. ].

