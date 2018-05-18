tests
createMustacheTemplateFile
	| mustacheTemplate |
	mustacheTemplate := 'html.mustache' asFileReference.
	
	mustacheTemplate writeStreamDo: [ :stream |
		stream nextPutAll: 
'<!DOCTYPE html>
<html>
	<head>
		<title>{{site_name}}</title>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-12 col-md-4 section-heading">
				{{# toc}}
					{{name}}
 						{{#children}}
							<h1>{{name}}</h1>
						{{/children}}
				{{/ toc}}
			</div>
			
			<div class="col-xs-12 col-md-8">
				{{{content}}}
			</div>
		</div>
	</body>
</html>'
		 ]