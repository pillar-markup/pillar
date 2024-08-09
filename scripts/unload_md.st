IceRepository registry 
	detect: [ :each | each name = 'Microdown' ]
	ifFound: [ :aRepository | aRepository forget ].

IceRepository registry 
	detect: [ :each | each name = 'pillar' ]
	ifFound: [ :aRepository | aRepository forget ].

"This, however, needs to stay :)"

"Smalltalk globals at: #BaselineOfMicrodown ifPresent: [ :c | c removeFromSystem ].
Uncommenting this line breaks the load from the script. I do not get why."

#( 'Microdown' 'BeautifulComments' 'DocumentBrowser' ) do: [ :name |
		(IceRepository repositoryNamed: name)
			ifNil: [ self inform: 'Project not found: ' , name ]
			ifNotNil: [ :found |
				found
					unload;
					forget ] ]