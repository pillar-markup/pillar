tests
createPillarConfFile
	| pillarConf |
	pillarConf := 'pillar.conf' asFileReference.
	
	pillarConf writeStreamDo: [ :stream |
		stream nextPutAll: '{
  "title": "The Pillar Super Book Archetype",
  "attribution": "The Pillar team",
  "series": "Square Bracket tutorials",
  "keywords": "project template, Pillar, Pharo, Smalltalk",
  "language": "en-UK",
  "epub-id": "urn:uuid:A1B0D67E-2E81-4DF5-9E67-A64CBE366809",
  
  "latexTemplate": "main.latex.mustache",
  "htmlTemplate": "html.mustache",
  "latexWriter" : #''latex:sbabook'',
  "htmlWriter": #html
}'
		 ]