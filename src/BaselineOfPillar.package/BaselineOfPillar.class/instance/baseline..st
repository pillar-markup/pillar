baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/'.
			spec
				project: 'Cocoon'
					with: [ spec
						repository: 'github://marianopeck/OSSubprocess:v0.2.5/repository' ];
				baseline: 'OSSubprocess'
					with: [ spec
						className: #ConfigurationOfCocoon;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/Cocoon/main' ];
				project: 'JSON'
					with: [ spec
						className: #ConfigurationOfJSON;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/JSON/main/' ];
				project: 'LightPhaser'
					with: [ spec
						className: #ConfigurationOfLightPhaser;
						versionString: '1.0.1';
						repository: 'http://smalltalkhub.com/mc/Pier/LightPhaser/main/' ];
				project: 'PetitParser'
					with: [ spec
						className: #ConfigurationOfPetitParser;
						versionString: #stable;
						loads: #('Tests');
						repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ];
				project: 'PetitParserTest'
					with: [ spec
						className: #ConfigurationOfPetitParser;
						versionString: #stable;
						loads: #('Tests');
						repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ].
			spec
				package: 'Pillar-Cli' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-Cli-PillarVersion' with: [ spec requires: #('Pillar-Cli') ];
				package: #'Pillar-ExporterAsciiDoc'
					with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterBeamer' with: [ spec requires: #('Pillar-ExporterLaTeX') ];
				package: 'Pillar-ExporterCore'
					with: [ spec requires: #('Pillar-Model' 'Cocoon' 'JSON' 'LightPhaser') ];
				package: 'Pillar-ExporterDeckJS' with: [ spec requires: #('Pillar-ExporterHTML') ];
				package: #'Pillar-ExporterEPub'
					with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-ExporterHTML') ];
				package: 'Pillar-ExporterHTML' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterLaTeX'
					with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-ExporterPillar') ];
				package: 'Pillar-ExporterMarkdown'
					with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-ExporterHTML') ];
				package: 'Pillar-ExporterPillar'
					with: [ spec requires: #('Pillar-ExporterCore' 'Pillar-PetitPillar') ];
				package: 'Pillar-ExporterText' with: [ spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-GitBook'
					with: [ spec requires: #('Pillar-Cli' 'markdown exporter' 'text exporter') ];
				package: 'Pillar-Model';
				package: 'Pillar-PetitPillar'
					with: [ spec requires: #('PetitParser' 'Pillar-Model') ];
				package: 'Pillar-Pharo-Tools'
					with: [ spec requires: #('Pillar-Model' 'All exporters') ];
				package: 'Pillar-Project'
					with: [ spec requires: #('Pillar-Model' 'All exporters' 'OSSubprocess') ];
				package: #'Pillar-Tests-Cli' with: [ spec requires: #('Pillar-Cli') ];
				package: #'Pillar-Tests-ExporterAsciiDoc'
					with: [ spec requires: #(#'Pillar-ExporterAsciiDoc' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterBeamer'
					with: [ spec requires: #('Pillar-ExporterBeamer' 'Pillar-Tests-ExporterLaTeX') ];
				package: 'Pillar-Tests-ExporterCore'
					with: [ spec requires: #('Pillar-Tests-Model' 'Pillar-ExporterCore') ];
				package: 'Pillar-Tests-ExporterDeckJS'
					with: [ spec requires: #('Pillar-ExporterDeckJS' 'Pillar-Tests-ExporterHTML') ];
				package: #'Pillar-Tests-ExporterEPub'
					with: [ spec requires: #(#'Pillar-ExporterEPub' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterHTML'
					with: [ spec requires: #('Pillar-ExporterHTML' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterLaTeX'
					with: [ spec requires: #('Pillar-ExporterLaTeX' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterMarkdown'
					with: [ spec
						requires: #('Pillar-ExporterMarkdown' 'Pillar-Tests-ExporterCore' 'Pillar-Tests-ExporterHTML') ];
				package: 'Pillar-Tests-ExporterPillar'
					with: [ spec requires: #('Pillar-ExporterPillar' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-ExporterText'
					with: [ spec requires: #('Pillar-ExporterText' 'Pillar-Tests-ExporterCore') ];
				package: 'Pillar-Tests-Model'
					with: [ spec requires: #('Pillar-Model' 'Pillar-ExporterPillar' 'Pillar-ExporterText') ];
				package: 'Pillar-Tests-PetitPillar'
					with: [ spec requires: #('PetitParserTest' 'Pillar-PetitPillar') ];
				package: 'Pillar-Tests-Project'
					with: [ spec requires: #('Pillar-Project') ];
				package: 'Pillar-Tests-Integration'
					with: [ spec requires: #('Pillar-Project') ].
			spec
				group: 'ALL' with: #('All tests' 'All but tests');
				group: 'All but tests'
					with: #('All exporters' 'Pillar-Cli' 'Pillar-Pharo-Tools' 'Pillar-GitBook' 'parser' 'Pillar-Project');
				group: 'All exporter tests'
					with:
					#('html exporter tests' 'latex exporter tests' 'beamer exporter tests' 'deckjs exporter tests' 'markdown exporter tests' 'pillar exporter tests' 'text exporter tests' 'asciidoc exporter tests' 'ePub exporter tests');
				group: 'All exporters'
					with:
					#('html exporter' 'latex exporter' 'beamer exporter' 'deckjs exporter' 'markdown exporter' 'pillar exporter' 'text exporter' 'asciidoc exporter' 'ePub exporter');
				group: 'All tests'
					with:
					#('All exporter tests' 'Pillar-Tests-Model' 'Pillar-Tests-ExporterCore' #'Pillar-Tests-Cli' 'parser tests' 'Pillar-Tests-Project' 'Pillar-Tests-Integration' );
				group: 'asciidoc exporter' with: #(#'Pillar-ExporterAsciiDoc');
				group: 'asciidoc exporter tests'
					with: #(#'Pillar-Tests-ExporterAsciiDoc' 'ePub exporter');
				group: 'beamer exporter' with: #('Pillar-ExporterBeamer');
				group: 'beamer exporter tests' with: #('Pillar-Tests-ExporterBeamer');
				group: 'deckjs exporter' with: #('Pillar-ExporterDeckJS');
				group: 'deckjs exporter tests' with: #('Pillar-Tests-ExporterDeckJS');
				group: 'ePub exporter' with: #(#'Pillar-ExporterEPub');
				group: 'ePub exporter tests' with: #(#'Pillar-Tests-ExporterEPub');
				group: 'html exporter' with: #('Pillar-ExporterHTML');
				group: 'html exporter tests' with: #('Pillar-Tests-ExporterHTML');
				group: 'latex exporter' with: #('Pillar-ExporterLaTeX');
				group: 'latex exporter tests' with: #('Pillar-Tests-ExporterLaTeX');
				group: 'markdown exporter' with: #('Pillar-ExporterMarkdown' 'parser');
				group: 'markdown exporter tests' with: #('Pillar-Tests-ExporterMarkdown');
				group: 'parser' with: #('Pillar-PetitPillar');
				group: 'parser tests' with: #('Pillar-Tests-PetitPillar');
				group: 'pillar exporter' with: #('Pillar-ExporterPillar');
				group: 'pillar exporter tests' with: #('Pillar-Tests-ExporterPillar');
				group: 'text exporter' with: #('Pillar-ExporterText');
				group: 'text exporter tests' with: #('Pillar-Tests-ExporterText') ]