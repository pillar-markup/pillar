versions (0.x)
version058: spec
	<version: '0.58' imports: #('0.22-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.58 - document properties are inherited'.
		spec author: 'GuillermoPolito'.
		spec timestamp: '2015-06-08T14:42:09.704219+02:00'.
		spec 
			project: 'Grease' with: '1.1.13';
			project: 'Mustache' with: '0.71';
			project: 'Cocoon' with: '1.19'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-CyrilFerlicot.163';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-CyrilFerlicot.133';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-CyrilFerlicot.149';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.69';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-CyrilFerlicot.71';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.4';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-CyrilFerlicot.61';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-CyrilFerlicot.22';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.9';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-CyrilFerlicot.92';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.25';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-CyrilFerlicot.92';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.1';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-CyrilFerlicot.39';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-CyrilFerlicot.13';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-CyrilFerlicot.13'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-DamienCassou.8';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.10';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
