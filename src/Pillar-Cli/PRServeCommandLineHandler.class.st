"
I am a command line handler to serve of the current project.

Example of usage:

./pillar serve -w
"
Class {
	#name : #PRServeCommandLineHandler,
	#superclass : #PRSubCommandLineHandler,
	#category : 'Pillar-Cli-Handlers'
}

{ #category : #accessing }
PRServeCommandLineHandler class >> commandName [
	^ 'serve'
]

{ #category : #activation }
PRServeCommandLineHandler >> activate [
	| baseurl watch port watcher |
	baseurl := self optionAt: 'baseurl' ifAbsent: [ '' ].
	watch := self hasOption: #w.
	port := self
		optionAt: 'p'
		ifPresent: [ :portString | portString asInteger ]
		ifAbsent: [ 8080 ].
	self stdout
		nextPutAll: 'Serving website at: http://localhost:';
		nextPutAll: port asString;
		nextPutAll: '/';
		nextPutAll: baseurl;
		lf.
	(ZnServer defaultOn: port) start.
	ZnServer default
		delegate:
			(ZnStaticFileServerDelegate new
				prefixFromString: baseurl;
				directory: self project baseDirectory / '_result/html/';
				yourself).
	watch
		ifFalse: [ ^ self ].
	watcher := PRWatcher new.
	watcher project: self project.
	watcher start
]
