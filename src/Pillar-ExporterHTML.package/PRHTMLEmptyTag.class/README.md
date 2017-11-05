I'm a helper class to generate HTML code. For example, to generate: 

    <img href="figure/test.png"/>

you can write something like this:

String streamContents: [ :stream | | canvas |
	stream := PROutputStream on: stream.
	canvas := PRHTMLCanvas on: stream.
	canvas emptyTag
 		name: 'img';
		parameterAt: 'href' put: 'figure/test.png';
		closeTag	 ]