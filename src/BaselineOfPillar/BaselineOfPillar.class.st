Class {
	#name : 'BaselineOfPillar',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPillar',
	#package : 'BaselineOfPillar'
}

{ #category : 'baselines' }
BaselineOfPillar >> baseline: spec [

	<baseline>
	"undo all the changes that I tried"
	spec for: #common do: [
		self
			osSubProcess: spec;
			chrysal: spec;
			containersPropertyEnvironment: spec;
			microdown: spec;
			mustache: spec.
			
		spec postLoadDoIt: #postload:package:.
		spec
			package: 'Pillar-Core' 
				with: [ spec requires: #( 'OSSubprocess')];
			package: 'Pillar-Tests-Core' 
				with: [ spec requires: 
							#( 'Pillar-Core') ];
		
			package: 'Pillar-Model' 
				with: [ spec requires: #( 'Pillar-Core' ) ];
		
			"I reintroduced Latex and HTML package because they contain project logic
			I removed the generation part."
			package: 'Pillar-ExporterLaTeX'
				with: [ spec requires: #( 'Pillar-ExporterCore' 'Pillar-Model' 'Mustache') ];
			package: 'Pillar-ExporterHTML'
				with: [ spec requires: #( 'Pillar-ExporterCore') ];
		
		
			package: 'Pillar-Tests-Model' 
				with: [ spec requires: 
						#( 	'Pillar-Core' 'Pillar-Model' 'Pillar-Tests-Core' ) ];
			
			package: 'Pillar-Chrysal-Generator' 
				with: [ spec requires: #( 'Chrysal' ) ];
			
			
			package: 'Pillar-Cli' 
				with: [ spec requires: #( 'Pillar-ExporterCore' 'Pillar-Chrysal' 'Pillar-Project') ];
				
			package: 'Pillar-Tests-Cli' with: [ spec requires: #( 'Pillar-Cli' ) ];
			
			package: 'Pillar-Chrysal' with: [ spec requires: #( 'Pillar-ExporterCore' ) ];
		
			package: 'Pillar-ExporterCore' with: [ spec requires: #( 'Pillar-Model' 'ContainersPropertyEnvironment' ) ];
			package: 'Pillar-Tests-ExporterCore' with: [ spec requires: #( 'Pillar-Tests-Model' 'Pillar-ExporterCore' ) ];
			
			package: 'Pillar-Project' with: [ spec requires: #( 'Pillar-Model' ) ];
		
			package: 'Pillar-Tests-Project' with: [ spec requires: #( 'Pillar-Project' ) ];
			package: 'Pillar-Tests-Integration' with: [ spec requires: #( 'Pillar-Project' ) ].


		spec
			group: 'All' 
				with: 
				#(
				'Pillar-ExporterLaTeX'
				'Pillar-ExporterHTML'
				'Pillar-Tests-Core'
				'Pillar-Tests-ExporterCore' 
				'Pillar-Tests-Cli' 
				'Pillar-Tests-Project' 
				'Pillar-Tests-Integration' );
			group: 'Core' 
				with: #( 'Pillar-Core' );
			group: 
				'Model' with: #( 'Pillar-Model' ) ].
]

{ #category : 'dependencies' }
BaselineOfPillar >> chrysal: spec [

	spec baseline: 'Chrysal' with: [ spec repository: 'github://Ducasse/Chrysal:v1.0.0/src' ]
]

{ #category : 'dependencies' }
BaselineOfPillar >> containersPropertyEnvironment: spec [

	spec baseline: 'ContainersPropertyEnvironment' with: [ spec repository: 'github://Ducasse/Containers-PropertyEnvironment:v1.0.0' ]
]

{ #category : 'baselines' }
BaselineOfPillar >> customProjectAttributes [
    "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes "

	| attributes |
	attributes := OrderedCollection new.
	OSPlatform current isWindows ifTrue: [ attributes add: #windows ].
	OSPlatform current isUnix    ifTrue: [ attributes add: #unix ].
	OSPlatform current isMacOS   ifTrue: [ attributes add: #osx ].
	^ attributes asArray
]

{ #category : 'dependencies' }
BaselineOfPillar >> microdown: spec [
	
	"self microdownPreLoad."
	spec baseline: 'Microdown' with: [ spec repository: 'github://pillar-markup/Microdown:v2.9.2/src' ]
]

{ #category : 'dependencies' }
BaselineOfPillar >> microdownPreLoad [
	
	| packagesToUnload mic |
	
	packagesToUnload := ((PackageOrganizer default packages 
		select: [ :each | each name beginsWith: 'Microdown' ])  collect: [ :each | each name ]) 
		reject: [ :each |  
 	#('Microdown-RichTextPresenter' 'Microdown-RichTextPresenter-Tests') includes: each ].
	"these two are not managed by the microdown repo but the documentation.
	I should rename them in the future to avoid confusion"
	packagesToUnload := packagesToUnload asOrderedCollection.
	packagesToUnload add: 'BaselineOfMicrodown'.
	mic := (IceRepository repositoryNamed: 'Microdown').
	mic ifNotNil: [ 
		packagesToUnload do: 
			[ :each | 
				(mic packageNamed: each) unload ].
		mic delete ].
	#( 'Microdown' 'DocumentBrowser' ) do: [ :name |
		(IceRepository repositoryNamed: name)
			ifNil: [ ('Project not found: ' , name) traceCr ]
			ifNotNil: [ :found |
				found
					unload;
					forget ] ].
]

{ #category : 'dependencies' }
BaselineOfPillar >> mustache: spec [

	spec baseline: 'Mustache' with: [
		spec
			repository: 'github://noha/mustache:v1.3/repository';
			loads: #( 'Core' 'Tests' ) ]
]

{ #category : 'dependencies' }
BaselineOfPillar >> osSubProcess: spec [

	spec baseline: 'OSSubprocess' with: [ spec repository: 'github://pharo-contributions/OSSubprocess:v2.0.0/repository' ]
]

{ #category : 'baselines' }
BaselineOfPillar >> postload: loader package: packageSpec [
	" we terminate this polling process. "
	| list |
	list := ((Process allInstances select: [ :p | p priority = 70 ]) select: [ :e | '*OSSub*' match: e name ]).
	list ifNotEmpty: [ :f | f first terminate ]
]

{ #category : 'dependencies' }
BaselineOfPillar >> processWrapper: spec [

	spec configuration: 'ProcessWrapper' with: [
		spec
			versionString: '1.2';
			repository: 'http://smalltalkhub.com/mc/hernan/ProcessWrapper/main' ]
]
