private
createAnchorWith: anId
	canvas tag
		name: 'a';
		parameterAt: 'id' put: anId;
		with: ''