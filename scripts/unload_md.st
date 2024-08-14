"Smalltalk globals at: #BaselineOfMicrodown ifPresent: [ :c | c removeFromSystem ].
Uncommenting this line breaks the load from the script. I do not get why."

#( 'Microdown' 'DocumentBrowser' ) do: [ :name |
		(IceRepository repositoryNamed: name)
			ifNil: [ ('Project not found: ' , name) traceCr ]
			ifNotNil: [ :found |
				found
					unload;
					forget ] ].