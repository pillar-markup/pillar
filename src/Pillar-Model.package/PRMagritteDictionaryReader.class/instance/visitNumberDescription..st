visiting-description
visitNumberDescription: aDescription
	self tryToAddFrom: aDescription withInterpretation: [ :value | self interpretAsNumber: value with: aDescription ]