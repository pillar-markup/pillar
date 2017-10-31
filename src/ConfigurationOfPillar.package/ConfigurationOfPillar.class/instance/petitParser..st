dependencies
petitParser: spec
	spec
		project: 'PetitParser'
		with: [ 
			spec
				className: 'ConfigurationOfPetitParser';
				versionString: #stable;
				loads: #('Core');
				loads: #('Tests');
				repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ]