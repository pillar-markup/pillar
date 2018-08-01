helpers
referenceParameters
	^ OrderedDictionary new 
		add: 'path' -> 'blogs';
		add: 'limit' -> 10;
		add: 'sort' -> 'date';
		add: 'templates' -> #('templates/docArticle.mustache');
		yourself