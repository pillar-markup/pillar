versions (3.x.x)
version300: spec
	<version: '3.0.0' imports: #('0.30-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 3.0.0
- Addition of an AsciiDoc exporter
- LaTeX exporter:
	-- external links now produce footnotes
	-- replace \begin{code}{} with \begin{listing}[language=XXXX]
	-- replace \ct with \code
	-- use \textasciitilde instead of \texttildelow to represent a ~ character in Pillar
	-- SBALaTeXWriter for sba book (by Damien Pollet) https://github.com/cdlm/sbabook
- HTML exporter:
	-- default template charset is UTF-8
- Features: For more you can see Pillar documentation.
	-- hideable scripts with the option hideable.
		ex: [[[hideable=true
				with a parameter in pillar.conf "scriptHide"=true this text will be hidden.	 
			 ]]]
	-- auto anchor for headers
		ex: in a level configuration
			 "level1":{
				"numbering"=true,
				"autoAnchor"=true
			}
			there will be an automatic creation of an anchor for headers of level 1.
	-- header capitalization in a level configuration with options:
		capitalize, capitalizeEnglish, uppercase and lowercase
		ex: "level1":{
				"capitalization":"uppercase"
			 }
			Will render all headers of level 1 to Uppercase.'.
		spec author: 'ThibaultArloing'.
		spec timestamp: '4/20/2016 11:48'.
		spec 
			project: 'Grease' with: '1.2.7';
			project: 'Mustache' with: '0.72';
			project: 'PetitParser' with: '1.14';
			project: 'PetitParserTest' with: '1.14';
			project: 'Cocoon' with: '1.30'.
		spec 
			package: 'Pillar-Model' with: 'Pillar-Model-ThibaultArloing.254';
			package: 'Pillar-PetitPillar' with: 'Pillar-PetitPillar-DamienCassou.138';
			package: 'Pillar-ExporterCore' with: 'Pillar-ExporterCore-ThibaultArloing.275';
			package: 'Pillar-ExporterMarkdown' with: 'Pillar-ExporterMarkdown-CyrilFerlicot.71';
			package: 'Pillar-ExporterLaTeX' with: 'Pillar-ExporterLaTeX-DamienCassou.100';
			package: 'Pillar-ExporterBeamer' with: 'Pillar-ExporterBeamer-DamienCassou.26';
			package: 'Pillar-ExporterHTML' with: 'Pillar-ExporterHTML-DamienCassou.83';
			package: 'Pillar-ExporterDeckJS' with: 'Pillar-ExporterDeckJS-DamienCassou.9';
			package: 'Pillar-ExporterPillar' with: 'Pillar-ExporterPillar-DamienCassou.39';
			package: 'Pillar-ExporterText' with: 'Pillar-ExporterText-CyrilFerlicot.11';
			package: 'Pillar-Tests-Model' with: 'Pillar-Tests-Model-YannDubois.186';
			package: 'Pillar-Tests-PetitPillar' with: 'Pillar-Tests-PetitPillar-DamienCassou.23';
			package: 'Pillar-Cli' with: 'Pillar-Cli-CyrilFerlicot.20';
			package: 'Pillar-Tests-ExporterCore' with: 'Pillar-Tests-ExporterCore-DamienCassou.146';
			package: 'Pillar-Tests-ExporterMarkdown' with: 'Pillar-Tests-ExporterMarkdown-CyrilFerlicot.28';
			package: 'Pillar-Tests-ExporterLaTeX' with: 'Pillar-Tests-ExporterLaTeX-DamienCassou.109';
			package: 'Pillar-Tests-ExporterBeamer' with: 'Pillar-Tests-ExporterBeamer-DamienCassou.17';
			package: 'Pillar-Tests-ExporterHTML' with: 'Pillar-Tests-ExporterHTML-DamienCassou.43';
			package: 'Pillar-Tests-ExporterDeckJS' with: 'Pillar-Tests-ExporterDeckJS-DamienCassou.5';
			package: 'Pillar-Tests-ExporterPillar' with: 'Pillar-Tests-ExporterPillar-DamienCassou.16';
			package: 'Pillar-Tests-ExporterText' with: 'Pillar-Tests-ExporterText-DamienCassou.15';
			package: #'Pillar-Tests-Cli' with: 'Pillar-Tests-Cli-DamienCassou.1';
			package: 'Pillar-GitBook' with: 'Pillar-GitBook-DamienCassou.1';
			package: 'Pillar-Pharo-Tools' with: 'Pillar-Pharo-Tools-ThibaultArloing.10';
			package: #'Pillar-ExporterAsciiDoc' with: 'Pillar-ExporterAsciiDoc-ThibaultArloing.23';
			package: #'Pillar-Tests-ExporterAsciiDoc' with: 'Pillar-Tests-ExporterAsciiDoc-ThibaultArloing.10'. ].
