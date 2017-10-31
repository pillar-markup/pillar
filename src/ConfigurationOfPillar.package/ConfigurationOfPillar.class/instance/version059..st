versions (0.x)
version059: spec
	<version: '0.59' imports: #('0.23-baseline')>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.59:
- Beamer/DeckJS exporter
- Configuration now use Magritte
- Removed the Pillar interpreter (now magritte do it)
- Cleaning the configuration, no private protocols anymore
- Now templates are inherit on the sub configurations
- Improved the speed of the export
- Export is now divided into phases
- Now we can generate the documentation of the transformers
- Replaced Dictionary by GRSmallDictionary for parameters 
- Use Magritte to manage annotations''s parameters
- Minor changes'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '20/07/2015 14:03'.
		spec 
			project: 'Grease' with: '1.1.13';
			project: 'Mustache' with: '0.71';
			project: 'Cocoon' with: '1.21'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-CyrilFerlicot.211';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-CyrilFerlicot.200';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.69';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-CyrilFerlicot.79';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-CyrilFerlicot.25';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-CyrilFerlicot.75';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-CyrilFerlicot.8';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-CyrilFerlicot.25';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.10';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-CyrilFerlicot.159';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-CyrilFerlicot.119';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.26';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-CyrilFerlicot.93';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-CyrilFerlicot.13';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-CyrilFerlicot.41';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-CyrilFerlicot.13';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-CyrilFerlicot.13'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-CyrilFerlicot.9';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.11';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
