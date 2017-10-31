versions for Pharo 50
version4084: spec
	<version: '4.0.8.4' imports: #('0.32-baseline')>
	spec
		for: #common
		do: [ spec blessing: #stable.
			spec description: 'version 4.0.8.4: version command line handler'.
			spec author: 'StephaneDucasse'.
			spec timestamp: '07/06/2017 20:47'.
			spec
				project: 'Cocoon' with: '1.31';
				project: 'JSON' with: '1.2';
				project: 'LightPhaser' with: '1.0';
				project: 'PetitParser' with: '1.14';
				project: 'PetitParserTest' with: '1.14'.
			spec
				package: 'Pillar-Cli' with: 'Pillar-Cli-StephaneDucasse.59';
				package: 'Pillar-Cli-PillarVersion' with: 'Pillar-Cli-PillarVersion-StephaneDucasse.1';
				package: #'Pillar-ExporterAsciiDoc' with: 'Pillar-ExporterAsciiDoc-DamienCassou.27';
				package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.30';
				package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-StephaneDucasse.391';
				package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-DamienCassou.12';
				package: #'Pillar-ExporterEPub' with: 'Pillar-ExporterEPub-DamienCassou.9';
				package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.88';
				package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.107';
				package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.75';
				package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-StephaneDucasse.41';
				package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.11';
				package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.2';
				package: 'Pillar-Model' with: 'Pillar-Model-YannDubois.292';
				package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-YannDubois.142';
				package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-TudorGirba.15';
				package: #'Pillar-Tests-Cli' with: 'Pillar-Tests-Cli-DamienCassou.1';
				package: #'Pillar-Tests-ExporterAsciiDoc' with: 'Pillar-Tests-ExporterAsciiDoc-DamienCassou.12';
				package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.19';
				package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-YannDubois.212';
				package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
				package: #'Pillar-Tests-ExporterEPub' with: 'Pillar-Tests-ExporterEPub-DamienCassou.6';
				package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.46';
				package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.113';
				package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-DamienCassou.32';
				package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.18';
				package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.16';
				package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.217';
				package: 'Pillar-Tests-PetitPillar' with: 'Pillar-Tests-PetitPillar-YannDubois.25' ]