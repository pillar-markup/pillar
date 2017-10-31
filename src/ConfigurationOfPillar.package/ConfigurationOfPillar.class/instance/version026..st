versions (0.x)
version026: spec
	<version: '0.26' imports: #('0.22-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.26 - Add transformers.'.
		spec author: 'DamienCassou'.
		spec timestamp: '2015/04/06 22:12'.
		spec 
			project: 'Grease' with: '1.1.13';
			project: 'Mustache' with: '0.71';
			project: 'Cocoon' with: '1.7'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-DamienCassou.96';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-DamienCassou.106';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-DamienCassou.95';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-DamienCassou.60';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.62';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.4';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.49';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.15';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-DamienCassou.7';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.62';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-BenComan.18';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.84';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.1';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-BenComan.33';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-BenComan.6';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.8'. ].

	spec for: #'pharo' do: [
		spec 
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-DamienCassou.8';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.10';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1'. ].
