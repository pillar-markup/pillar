An embedded script

[[[language=smalltalk|caption="addition"
1 + 3 			
]]]

In addition scripts are also used to define structures

[[[structure=city
{
   "name"        : "Bordeaux",
   "latitude"    : 44.84, [...]
}
]]]

We needed a way to have a JSON structure in a Pillar file without interpreting the JSON as Pillar syntax. To do this, we used environments whose contents is JSON:
[[[structure=city
{
   "name"        : "Bordeaux",
   "latitude"    : 44.84, [...]
}
]]]
Environments are the only Pillar elements which keep their contents unparsed. This solution encapsulates new syntax within an existing one thus avoiding problems with existing documents.