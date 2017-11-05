versions (3.x.x)
version301: spec
	<version: '3.0.1' imports: #('0.30-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 3.0.1
Cocoon 1.31'.
		spec author: 'ThibaultArloing'.
		spec timestamp: '4/20/2016 17:02'.
		spec 
			project: 'Grease' with: '1.2.7';
			project: 'Mustache' with: '0.72';
			project: 'PetitParser' with: '1.14';
			project: 'PetitParserTest' with: '1.14';
			project: 'Cocoon' with: '1.31'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-ThibaultArloing.254';
			package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-DamienCassou.138';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-ThibaultArloing.275';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.71';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.100';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.26';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.83';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-DamienCassou.9';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.39';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.11';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-YannDubois.186';
			package: 'Pillar-Tests-PetitPillar' with: 'Pillar-Tests-PetitPillar-DamienCassou.23';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.20';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.146';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.28';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.109';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.17';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.43';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.16';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.15';
			package: #'Pillar-Tests-Cli' with: 'Pillar-Tests-Cli-DamienCassou.1';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1';
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-ThibaultArloing.10';
			package: #'Pillar-ExporterAsciiDoc' with: 'Pillar-ExporterAsciiDoc-ThibaultArloing.23';
			package: #'Pillar-Tests-ExporterAsciiDoc' with: 'Pillar-Tests-ExporterAsciiDoc-ThibaultArloing.10'. ].
