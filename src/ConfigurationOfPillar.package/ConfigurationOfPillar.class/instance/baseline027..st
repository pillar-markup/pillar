baselines
baseline027: spec
	<version: '0.27-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/'.
		spec 
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
			project: 'Mustache' with: [
				spec
					className: #ConfigurationOfMustache;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://www.smalltalkhub.com/mc/NorbertHartl/Mustache/main' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Tests' );
					repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'PetitParserTest' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Tests' );
					repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
			project: 'Cocoon' with: [
				spec
					className: #ConfigurationOfCocoon;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/Cocoon/main' ].
		spec 
			package: 'Pillar-Model' with: [
				spec requires: #('Grease' ). ];
			package: 'Pillar-PetitPillar' with: [
				spec requires: #('PetitParser' 'Pillar-Model' ). ];
			package: 'Pillar-ExporterCore' with: [
				spec requires: #('Pillar-Model' 'Mustache' 'Cocoon' ). ];
			package: 'Pillar-ExporterMarkdown' with: [
				spec requires: #('Pillar-ExporterCore' ). ];
			package: 'Pillar-ExporterLaTeX' with: [
				spec requires: #('Pillar-ExporterCore' ). ];
			package: 'Pillar-ExporterBeamer' with: [
				spec requires: #('Pillar-ExporterLaTeX' ). ];
			package: 'Pillar-ExporterHTML' with: [
				spec requires: #('Pillar-ExporterCore' ). ];
			package: 'Pillar-ExporterDeckJS' with: [
				spec requires: #('Pillar-ExporterHTML' ). ];
			package: 'Pillar-ExporterPillar' with: [
				spec requires: #('Pillar-ExporterCore' 'Pillar-PetitPillar' ). ];
			package: 'Pillar-ExporterText' with: [
				spec requires: #('Pillar-ExporterCore' ). ];
			package: 'Pillar-Tests-Model' with: [
				spec requires: #('Pillar-Model' 'Pillar-ExporterPillar' 'Pillar-ExporterText' ). ];
			package: 'Pillar-Cli' with: [
				spec requires: #('Pillar-ExporterCore' ). ];
			package: 'Pillar-Tests-ExporterCore' with: [
				spec requires: #('Pillar-Tests-Model' 'Pillar-ExporterCore' ). ];
			package: 'Pillar-Tests-ExporterMarkdown' with: [
				spec requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-ExporterCore' ). ];
			package: 'Pillar-Tests-ExporterLaTeX' with: [
				spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-ExporterCore' ). ];
			package: 'Pillar-Tests-ExporterBeamer' with: [
				spec requires: #('Pillar-ExporterBeamer' 'Pillar-Tests-ExporterLaTeX' ). ];
			package: 'Pillar-Tests-ExporterHTML' with: [
				spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-ExporterCore' ). ];
			package: 'Pillar-Tests-ExporterDeckJS' with: [
				spec requires: #('Pillar-ExporterDeckJS' 'Pillar-Tests-ExporterHTML' ). ];
			package: 'Pillar-Tests-ExporterPillar' with: [
				spec requires: #('Pillar-ExporterPillar' 'Pillar-Tests-ExporterCore' ). ];
			package: 'Pillar-Tests-ExporterText' with: [
				spec requires: #('Pillar-ExporterText' 'Pillar-Tests-ExporterCore' ). ];
			package: 'Pillar-GitBook' with: [
				spec requires: #('Pillar-Cli' 'markdown exporter' 'text exporter' ). ];
			package: 'Pillar-Pharo-Tools' with: [
				spec requires: #('Pillar-Model' 'All exporters' ). ];
			package: #'Pillar-Tests-Cli' with: [
				spec requires: #('Pillar-Cli' ). ].
		spec 
			group: 'html exporter' with: #('Pillar-ExporterHTML' );
			group: 'html exporter tests' with: #('Pillar-Tests-ExporterHTML' );
			group: 'latex exporter' with: #('Pillar-ExporterLaTeX' );
			group: 'latex exporter tests' with: #('Pillar-Tests-ExporterLaTeX' );
			group: 'beamer exporter' with: #('Pillar-ExporterBeamer' );
			group: 'beamer exporter tests' with: #('Pillar-Tests-ExporterBeamer' );
			group: 'deckjs exporter' with: #('Pillar-ExporterDeckJS' );
			group: 'deckjs exporter tests' with: #('Pillar-Tests-ExporterDeckJS' );
			group: 'markdown exporter' with: #('Pillar-ExporterMarkdown' );
			group: 'markdown exporter tests' with: #('Pillar-Tests-ExporterMarkdown' );
			group: 'pillar exporter' with: #('Pillar-ExporterPillar' );
			group: 'pillar exporter tests' with: #('Pillar-Tests-ExporterPillar' );
			group: 'text exporter' with: #('Pillar-ExporterText' );
			group: 'text exporter tests' with: #('Pillar-Tests-ExporterText' );
			group: 'All exporters' with: #('html exporter' 'latex exporter' 'beamer exporter' 'deckjs exporter' 'markdown exporter' 'pillar exporter' 'text exporter' );
			group: 'All exporter tests' with: #('html exporter tests' 'latex exporter tests' 'beamer exporter tests' 'deckjs exporter tests' 'markdown exporter tests' 'pillar exporter tests' 'text exporter tests' );
			group: 'All tests' with: #('All exporter tests' 'Pillar-Tests-Model' 'Pillar-Tests-ExporterCore' #'Pillar-Tests-Cli' );
			group: 'All but tests' with: #('All exporters' 'Pillar-Cli' 'Pillar-Pharo-Tools' 'Pillar-GitBook' );
			group: 'ALL' with: #('All tests' 'All but tests' ). ].
