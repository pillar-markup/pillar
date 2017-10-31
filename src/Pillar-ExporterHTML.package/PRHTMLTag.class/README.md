I'm a helper class to generate HTML code. For example, to generate: 

    <p>foo <a href="url">bar</a></b>

you can write something like this:

String streamContents: [ :stream | | canvas |
	stream := PROutputStream on: stream.
	canvas := PRHTMLCanvas on: stream.
	canvas tag
 		name: 'p';
 		with: [ canvas nextPutAll: 'foo '.
			    canvas tag 
	     		      name: 'a';
	    			parameterAt: 'href' put: 'url';
	                  with: 'bar' ]	 ]