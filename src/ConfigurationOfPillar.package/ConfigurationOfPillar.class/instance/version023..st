versions (0.x)
version023: spec
	<version: '0.23' imports: #('0.21-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.23'.
		spec author: 'CyrilFerlicot'.
		spec timestamp: '4/1/2015 18:21'.
		spec 
			project: 'Grease' with: '1.1.13';
			project: 'Mustache' with: '0.71';
			project: 'Cocoon' with: '1.7'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-TorstenBergmann.87';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-JohnCBorden.100';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-CyrilFerlicot.90';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-BenComan.59';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-TorstenBergmann.59';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.48';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-TorstenBergmann.10';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-TorstenBergmann.6';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-CyrilFerlicot.59';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-BenComan.18';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.84';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-BenComan.33';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-BenComan.6';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.8'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-TorstenBergmann.6';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.10';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
