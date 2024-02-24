IceRepository registry 
	detect: [ :each | each name = 'Microdown' ]
	ifFound: [ :aRepository | aRepository forget ].

IceRepository registry 
	detect: [ :each | each name = 'pillar' ]
	ifFound: [ :aRepository | aRepository forget ].

"This, however, needs to stay :)"

#( 'Microdown' 'BeautifulComments' 'DocumentBrowser' ) do: [ :name |
		(IceRepository repositoryNamed: name)
			ifNil: [ self inform: 'Project not found: ' , name ]
			ifNotNil: [ :found |
				found
					unload;
					forget ] ]