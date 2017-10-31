versions (1.x.x)
version100: spec
	<version: '1.0.0' imports: #('0.23-baseline')>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0.0: First realese (nothing new since 0.62)'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '2015/08/31 18:07'.
		spec 
			project: 'Grease' with: '1.2.0';
			project: 'Mustache' with: '0.71';
			project: 'Cocoon' with: '1.28'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-CyrilFerlicot.223';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-CyrilFerlicot.247';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.70';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-CyrilFerlicot.80';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-CyrilFerlicot.25';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-CyrilFerlicot.77';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-CyrilFerlicot.8';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-CyrilFerlicot.31';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.10';
			
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-CyrilFerlicot.160';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.130';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.26';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-CyrilFerlicot.93';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-CyrilFerlicot.13';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-CyrilFerlicot.41';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-CyrilFerlicot.14';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-CyrilFerlicot.13'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-CyrilFerlicot.9';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.16';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
