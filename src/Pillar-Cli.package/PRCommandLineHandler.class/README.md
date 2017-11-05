Pillar is a system to produce documents (latex, html, markdown....) from a wiki like syntax named pillar. 
More information in deepintopharo books http://books.pharo.org and development on https://github.com/pillar-markup/pillar

Usage: 
A typical example is 

	./pharo-ui Pillar.image pillar export --to="latex" Chapters/Chapter1/chapter1.pillar
	./pharo-ui Pillar.image pillar --help

Main command is 
	pillar 	
Then subcommand with their options are 
	export --to=<FORMAT> export the file to the FORMAT --outputDirectory=<DIR> export file to the specified DIR --baseDirectory=<DIR>
	archetype --template=<ArchetypeName> load the archetype
	fileDependencies  printout return dependencies to other files of this file	
	imageDependencies  printout dependencies to images of this file