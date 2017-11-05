dependencies
petitParserTest: spec
	spec
		project: 'PetitParserTest'
		with: [ 
			spec
				className: 'ConfigurationOfPetitParser';
				versionString: #stable;
				loads: #('Tests');
				repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ]