dependencies
grease: spec
	spec
		project: 'Grease'
		with: [ 
			spec
				className: 'ConfigurationOfGrease';
				versionString: #stable;
				loads: #('Core');
				repository: 'http://www.smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ]