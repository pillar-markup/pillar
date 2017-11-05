versions (1.x.x)
version113: spec
	<version: '1.1.3' imports: #('0.27-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1.3
		version for pier3'.
		spec author: 'StephanEggermont'.
		spec timestamp: '1/18/2016 15:40'.
		spec 
			project: 'Grease' with: #'release1.2';
			project: 'Mustache' with: #stable;
			project: 'PetitParser' with: #stable;
			project: 'PetitParserTest' with: #stable;
			project: 'Cocoon' with: #'pier'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.227';
			package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-CyrilFerlicot.99';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.251';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.70';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.81';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-CyrilFerlicot.25';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.79';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-CyrilFerlicot.8';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-CyrilFerlicot.31';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.10';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.167';
			package: 'Pillar-Cli' with: 'Pillar-Cli-DamienCassou.17';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.134';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.27';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.96';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.15';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.42';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.15';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-CyrilFerlicot.13';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1';
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-CyrilFerlicot.9';
			package: #'Pillar-Tests-Cli' with: 'Pillar-Tests-Cli-DamienCassou.1'. ].
