private
configureLevelDescription: levelNumber
	^ PRMagritteHeaderLevelDescription new
		accessor: ('level' , levelNumber asString) asSymbol;
		priority: 100;
		label: 'Header level' , levelNumber asString , ' configuration';
		cocoonDocumentation: (self levelDescriptionCocoonDocumentation: levelNumber);
		cocoonDefaultDocumentation: 'All levels are numbered with digits and all parents are visible.';
		default:
				(PRLevelNumberConfiguration new
						numbering: true;
						size: levelNumber;
						level: levelNumber;
						autoAnchor: false;
						configuration: self;
						yourself);
		classes: PRTitleConfiguration allSubclasses;
		level: levelNumber;
		yourself