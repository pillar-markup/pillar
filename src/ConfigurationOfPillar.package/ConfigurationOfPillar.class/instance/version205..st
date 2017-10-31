versions (2.x.x)
version205: spec
	<version: '2.0.5' imports: #('0.29-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 2.0.5
	- Correction of issue 94 (https://github.com/pillar-markup/pillar/issues/94
	- Remove old parser
	- Rename PRCocoonConfiguration into PRPillarConfiguration
	- Use PetitCompiler'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '01/24/2016 18:53'.
		spec 
			project: 'Grease' with: '1.2.1';
			project: 'Mustache' with: '0.72';
			project: 'PetitParser' with: '1.13';
			project: 'PetitParserTest' with: '1.13';
			project: 'Cocoon' with: #stable.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-CyrilFerlicot.240';
			package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-DamienCassou.138';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-CyrilFerlicot.256';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.70';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.84';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-CyrilFerlicot.25';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.79';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-CyrilFerlicot.8';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.37';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.10';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-CyrilFerlicot.178';
			package: 'Pillar-Tests-PetitPillar' with: 'Pillar-Tests-PetitPillar-DamienCassou.23';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.20';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-CyrilFerlicot.139';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.28';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.101';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.17';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.42';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.15';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-CyrilFerlicot.13';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1';
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-CyrilFerlicot.9';
			package: #'Pillar-Tests-Cli' with: 'Pillar-Tests-Cli-DamienCassou.1'. ].
