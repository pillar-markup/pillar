instance creation
for: aLanguageName
	^ (self concreteClassFor: aLanguageName) new
		originalName: aLanguageName;
		yourself