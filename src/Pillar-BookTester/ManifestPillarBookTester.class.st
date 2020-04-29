"
BookTester introduces new annotations

- ${showMethod:method=foo|class=Integer}$ to display the method definition.
- ${showMethod:class=Integer}$ to display the class definition.
- ${screenshot:class=Class|
		method=foo|
		caption='jlkl'|
		width=100|
		label=mylabel}$
- run and load should be commented here
		
BookTester also validates the annotations for example, class and method definitions.

[[[example=true
1+1 
>>> 2
]]]
are either checked or turn into tests.

Method definitions and class definitions are checked by compiling them.			
[[[methodDefinition=true
yourClass >> yourMethod
   ^ 'bla'
]]]

[[[classDefinition=true
Object subclass:...
    ...
]]]

Booktester creates a report on stdout. 

pillar build checkbook test all the pillar file recursively available in the directory.

pillar clap checkFile x.pillar 

"
Class {
	#name : #ManifestPillarBookTester,
	#superclass : #PackageManifest,
	#category : #'Pillar-BookTester-Manifest'
}
