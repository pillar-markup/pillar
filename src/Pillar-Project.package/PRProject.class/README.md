I represent a pillar document project.
I'm created using the directory where the pillar document resides.

project := PRProject on: 'someDirectory' asFileReference.

"Where the project is located"
project baseDirectory.

I take then my configuration from the pillar.conf cocoon file found in the given directory.
If I find no pillar.conf file, I will work with all default values.

project configuration.

To setup a new project in a directory, you can use the message #installArchetypeNamed:. This message will create  a sample of the asked archetype in the project's base directory. The sample will contain a basic pillar.conf file, some prototype pillar files and it will setup the asked template in the _support directory.
The accepted archetype names are for now those distributed along with Pillar (book, presentation, basic latex...). Check the archetypes folder in the pillar source repository for more information.

project installArchetypeNamed: 'book'.
project installArchetypeNamed: 'presentation'.
project installArchetypeNamed: 'basic-latex'.
project installArchetypeNamed: 'welcome'.

Once you have created a project, you can modify the project't template using #installTemplateNamed: with the corresponding template name.

project installTemplateNamed: 'book'.

!! Build Project

To build a project, you can send me the #build: message with the asked target output.
Outputs are instances of PRTarget.

"Build html"
project build: PRHtmlOutput new.

"Build pdf"
project build: PRPdfOutput new.

The project will detect the files to build using its build strategy and then create and execute a build pipeline for each of them.

!! Build pipeline construction

I am in charge of orchestrating the creation of the build pipeline and execute it using a PRGoal. There are however many participants that create the pipeline.

 - the project itself (myself) contributes to the build process adding my plugins
   Plugins are classes configured in the pillar.conf file.
 - the input that we are building contributes to the build process giving the possibility of changing the input parser for example
 -  the build target  contributes adding extra steps such as pdf compilation
 - plugins contribute to the build process adding themselves to the build pipeline.