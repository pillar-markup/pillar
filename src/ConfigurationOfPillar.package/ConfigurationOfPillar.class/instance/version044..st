versions (0.x)
version044: spec
	<version: '0.44' imports: #('0.22-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.44 - little correction.'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '2015/04/23 14h58'.
		spec 
			project: 'Grease' with: '1.1.13';
			project: 'Mustache' with: '0.71';
			project: 'Cocoon' with: '1.14'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-CyrilFerlicot.128';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-CyrilFerlicot.125';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-CyrilFerlicot.111';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.62';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-CyrilFerlicot.64';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.4';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-CyrilFerlicot.52';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-CyrilFerlicot.18';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-DamienCassou.7';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-CyrilFerlicot.67';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-BenComan.18';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-CyrilFerlicot.85';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.1';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-BenComan.33';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-BenComan.6';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.8'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-DamienCassou.8';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.10';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
