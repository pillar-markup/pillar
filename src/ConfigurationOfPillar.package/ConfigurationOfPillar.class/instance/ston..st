dependencies
ston: spec
	spec
		project: 'STON'
		with: [ 
			spec
				className: 'ConfigurationOfSton';
				versionString: #stable;
				loads: #('Core');
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main' ]