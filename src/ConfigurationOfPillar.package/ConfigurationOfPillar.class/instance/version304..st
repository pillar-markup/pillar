versions (3.x.x)
version304: spec
	<version: '3.0.4' imports: #('0.30-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 3.0.4
Fix bug when copying support'.
		spec author: 'DamienCassou'.
		spec timestamp: '6/9/2016 11:00'.
		spec 
			project: 'Grease' with: '1.2.7';
			project: 'PetitParser' with: '1.14';
			project: 'PetitParserTest' with: '1.14';
			project: 'Cocoon' with: '1.31'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-ThibaultArloing.254';
			package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-DamienCassou.138';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-YannDubois.321';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.71';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.101';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.27';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.83';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-DamienCassou.9';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.39';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.11';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-YannDubois.186';
			package: 'Pillar-Tests-PetitPillar' with: 'Pillar-Tests-PetitPillar-DamienCassou.23';
			package: 'Pillar-Cli' with: 'Pillar-Cli-YannDubois.30';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-YannDubois.147';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.28';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.110';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.18';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.43';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.16';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.15';
			package: #'Pillar-Tests-Cli' with: 'Pillar-Tests-Cli-DamienCassou.1';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1';
			package: #'Pillar-ExporterAsciiDoc' with: 'Pillar-ExporterAsciiDoc-ThibaultArloing.23';
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-ThibaultArloing.10';
			package: #'Pillar-Tests-ExporterAsciiDoc' with: 'Pillar-Tests-ExporterAsciiDoc-ThibaultArloing.10'. ].
