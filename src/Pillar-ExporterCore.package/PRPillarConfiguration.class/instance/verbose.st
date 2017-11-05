accessing
verbose
	"Indicate whether Pillar should write a verbose log when exporting."
	^ verbose ifNil: [ verbose := false ] 