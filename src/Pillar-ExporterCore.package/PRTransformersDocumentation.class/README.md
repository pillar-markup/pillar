I am a class that will generate the documentation of the transformers in Pillar.

I will use the 'pillarTransformer:key:documentation' pragma. 
I will display the keyword and the documentation of a transformer. The keyword is use to disable a transformer into a configuration.

To use me you can execute :

| stream |
stream := '' writeStream.
PRTransformersDocumentation on: stream.
stream contents