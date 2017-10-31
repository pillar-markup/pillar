versions (1.x.x)
version110: spec
	<version: '1.1.0' imports: #('0.26-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1.0
- add shebang to generated pillarPostExport.sh
- improve pillarPostExport.sh messages a little
- HTML exporter
  - output a <figure> if and only if the Pillar figure has both a
    caption and a label
- LaTeX exporter
  - output a \begin{figure} if and only if the Pillar figure has both
    a caption and a label
'.
		spec author: 'DamienCassou'.
		spec timestamp: '9/7/2015 09:39'.
		spec 
			project: 'Grease' with: '1.2.1';
			project: 'Mustache' with: '0.71';
			project: 'PetitParser' with: '1.13';
			project: 'PetitParserTest' with: '1.13';
			project: 'Cocoon' with: '1.28'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.227';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.167';
			package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-CyrilFerlicot.99';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.250';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.70';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.81';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-CyrilFerlicot.25';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-CyrilFerlicot.8';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.79';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-CyrilFerlicot.31';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.10';
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-CyrilFerlicot.9';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.16';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.134';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.27';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.96';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.15';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.42';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.15';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-CyrilFerlicot.13'. ].
