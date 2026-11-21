# The architecture of Pillar

This document is for the people who maintain Pillar or write archetypes. It describes the code loaded by
`BaselineOfPillar` and follows a build from the command line to the PDF or the web site. For the use of Pillar,
see [the commands](commands.md) and [the layout of a book](book-layout.md).

## Pillar and Microdown

Pillar does not know the syntax of the text. [Microdown](https://github.com/pillar-markup/Microdown) does:

- **Microdown** parses a `.md` file into a document tree, resolves the included files (`<!inputFile|path=...!>`),
  and writes the tree as LaTeX, Beamer or HTML. It also provides the passes of a book (header identifiers,
  numbering, table of contents, chapter splitting, references across pages) and the checkers used by `pillar check`.
- **Pillar** handles the book as a project: the command line, `pillar.conf`, the archetypes, the `_support` and
  `_custom` folders, the Mustache templates around the text written by Microdown, the output folders, and running
  LaTeX.

## Packages and dependencies

| Package | Role |
| --- | --- |
| `Pillar-Core` | the root classes (`PRObject`) and the old Pillar errors |
| `Pillar-ExporterCore` | the build: targets (`PRTarget`, `PRWritingTarget`), build strategies, input documents, `PRAbstractOutputDocument`, the copy of the support files (`PRCopyPhase`), the build status (`PRSuccess`, `PRFailure`) |
| `Pillar-ExporterLaTeX` | `pillar build pdf`: `PRPdfOutput`, `PRPDFDocument` (runs `latexmk`) |
| `Pillar-ExporterHTML` | `pillar build html` (`PRHtmlOutput`, `PRHtmlDocument`) and `pillar build site` (`PRHtmlBookOutput`, `PRHtmlBookDocument`) |
| `Pillar-Project` | the book: `PRProject`, the archetypes (`PRArchetype`, `PRArchetypeUpdate`), `PRCommandError` |
| `Pillar-Chrysal` | `ConfigurationForPillar`, the reader of `pillar.conf`, generated with Chrysal |
| `Pillar-Cli` | the commands, built with Clap: `ClapPillarCommand` and its subclasses. The `PR...CommandLineHandler` classes are the former command line, not used by the `pillar` script |
| `Pillar-Cli-BookTester` | `pillar check` and `pillar checkers` (`ClapPillarBookTesterCommand`, `ClapPillarCheckersCommand`, `MicAnalysisReportWriter`) |
| `Pillar-Tests-Project`, `Pillar-Tests-Cli`, `Pillar-Tests-Integration` | the tests (see [Tests](#tests)) |

Pillar depends on:

- **Microdown**: parsing, writers, book passes, checkers; `MicMicrodownInputDocument` (package
  `Microdown-Transformer`) is the input document of `.md` files;
- **Mustache**: the templates of `_support/templates`;
- **Containers-PropertyEnvironment**: the nested configurations (`CTEnvironment`), on which `ConfigurationForPillar`
  is built;
- **Chrysal**: the description of `pillar.conf` from which `ConfigurationForPillar` is generated;
- **OSSubprocess**: running `latexmk`;
- **Clap**: the command line, provided by Pharo.

## From the command line to a build

`scripts/build.sh` builds a Pharo image with Pillar and puts next to it the `pillar` script (`scripts/wrappers/pillar`)
and a copy of the `archetypes` folder. The script runs:

```
pharoForPillar Pharo.image --no-default-preferences clap pillar <arguments>
```

Clap finds the root command through the `<commandline>` pragma of `ClapPillarCommand class>>commandSpecification`,
whose subcommands are the `commandSpecification` of the subclasses (`pillarCommandsList`). It creates the command
object of the subcommand and sends it `executeOrPrintHelp`, which runs `execute` and reports its errors
(see [Errors](#errors)). The command works on the folder where `pillar` was run: `PRProject on: FileSystem
workingDirectory`.

## pillar build

```
pillar build <format> [files...]
  ClapPillarBuildCommand>>execute
    outputTarget                    the target class of <format> (builderName): PRPdfOutput, PRHtmlOutput, PRHtmlBookOutput
    buildStrategy:                  which files: PRBuildRootMainStrategy (default), PRBuildListStrategy, PRBuildAllStrategy
    PRProject>>build: target
      prepareForTarget:
        PRWritingTarget>>prepareForExecutionOn:
          checkIsABook                stop when there is no _support
          delete _result/<format>
          copy _support, then _custom over it (copyCustomFilesOf:to:), then the book (except _* and .*)
      PRTarget>>buildOn:
        filesToBuildOn:               the input documents chosen by the strategy
        for each file: (documentFor: file) buildOn: project
          PRAbstractOutputDocument>>buildOn:
            parsedDocumentOf:         parse the file (Microdown), add its metadata and the book structure
            transformDocumentFor:     include the files of <!inputFile!>, apply the transformations
            writeDocument:            Microdown writer + Mustache template -> the output file
            postWriteTransform:       PDF only: run latexmk on the .tex file
```

### The target and the files

A target (subclass of `PRWritingTarget`) is the output format. It knows its output folder (`_result/pdf`,
`_result/html`, `_result/site`), creates the output document for each file (`documentFor:`), and finds the writer
named in `pillar.conf` (`writerFor:`, see below).

The build strategy answers the files to build as input documents (`PRInputDocument class>>forFile:` finds the class
handling the extension: `MicMicrodownInputDocument` for `.md` and `.mic`):

- `PRBuildRootMainStrategy`: the only Microdown file at the root of the book, `README.md` excepted (usually
  `index.md`);
- `PRBuildListStrategy`: the files given on the command line, which must exist and be Microdown files;
- `PRBuildAllStrategy`: every Microdown file of the book (`--all`).

### The output folder

`PRWritingTarget>>prepareForExecutionOn:` prepares `_result/<format>` before any file is written:

1. it deletes `_result/<format>`, and only that folder, so the outputs of the other formats stay;
2. it copies `_support` into `_result/<format>/_support`;
3. it copies the files of `_custom` over that copy, except `_custom/README.md`: a file of `_custom` replaces the file
   of `_support` with the same path;
4. it copies every file and folder of the book whose name does not start with `_` or `.`, so that the figures and the
   chapters are found with the same relative paths.

Everything the build reads afterwards (templates, style sheets, LaTeX classes) comes from this copy, which is why
`_custom` works without the writers knowing it.

### One output document per file

`PRAbstractOutputDocument>>buildOn:` is the heart of the build. Its subclasses are `PRPDFDocument`, `PRHtmlDocument`
and `PRHtmlBookDocument`.

1. **Parse** (`parsedDocumentOf:`): Microdown parses the file. The metadata of the document become a configuration
   whose parent is the configuration of the project, and the document gets the structure of the book declared in
   `pillar.conf` (`bookStructure`: `chapterLevel` and `paragraphLevel`, as a `MicBookStructure`; an invalid structure
   raises `MicInvalidBookStructure`).
2. **Transform** (`MicRootBlock>>transformDocumentFor:` then `transformDocument:`): the files included with
   `<!inputFile!>` are inlined, their paths resolved from the including file, then the transformations of the
   target are applied.
3. **Write** (`writeDocument:`): the writer writes the document; its text is the `content` value of the Mustache
   template, with the metadata and `pillar.conf` values; the result is written in the output folder, at the path of
   the input file with the extension of the format.
4. **Post-write** (`postWriteTransform:`): nothing for HTML. For the PDF, `PRPDFDocument` runs
   `latexmk -pdflatex=lualatex` on the `.tex` file, in the output folder.

### The writer and the template

The writer is named in `pillar.conf`: `htmlWriter` for `html`, `latexWriter` for `pdf`. The `site` always uses the book writer `MicBookHTMLVisitor` (`#michtml`), whatever `htmlWriter` says (`PRHtmlBookOutput>>writerFor:`).
`PRWritingTarget>>writerFor:forConfigurationTag:` answers a new instance of the Microdown writer class whose
`writerName` is that name:

| Name | Class |
| --- | --- |
| `michtml` | `MicBookHTMLVisitor` (numbers, references across pages) |
| `micbasichtml` | `MicHTMLVisitor` |
| `miclatex:sbabook` | `MicSBALaTeXWriter` |
| `miclatex` | `MicLaTeXWriter` |
| `micBeamer` | `MicBeamerWriter` |

The template is `_result/<format>/_support/templates/<folder>/<name>`:

- `<folder>` is the `folderName` of the writer (`html`, `latex`, `beamer`);
- `<name>` is the `template` of `pillar.conf` or of the metadata of the document when there is one, otherwise the
  default of the writer (`templateForConfiguration:`, `main.mustache` for books).

For HTML, `customCss` is set when the book has `_custom/html/css/custom.css`, so that the templates link it after
`book.css`. The LaTeX templates read `_support/latex/custom.tex` when it exists.

### pillar build site

`PRHtmlBookDocument` replaces the writing of one file by the writing of a site. Its `writeDocument:` receives the
whole book (`index.md` with its chapters inlined) and `pagesOf:` runs the Microdown passes, all following the book
structure:

1. `MicPathRelativizer`: the paths of the figures become relative to the folder of the book;
2. `MicHeaderIdentifier`: every header gets an identifier, used for the links;
3. `MicNumberer`: chapters, sections, figures and listings are numbered (unless `"numbering" : false`);
4. `MicTocBuilder`: the table of contents of the whole book;
5. `MicChapterSplitter`: the text before the first chapter, then one document per chapter;
6. `MicPageReferenceResolver`: the references to anchors of other pages get the page.

Each page is written with `site.mustache` (or `main.mustache` when the book has no `site.mustache`) and its own
values: title, book title, previous and next pages, table of contents with the current chapter, generation date
(`generationDate`), on top of the values of `pillar.conf` (`valuesOfPageAt:in:book:`).
The first page is `index.html`, with the text before the first chapter; the site templates of the archetypes show it as a
cover page (the `cover` image of `pillar.conf`, the title, the authors and a link to the first chapter).
A chapter page is named after the title of its chapter (`pageNameForTitle:`): its words in lowercase joined by `-`,
stopping after the word that reaches 20 characters (`A quick tour of Pharo` gives `a-quick-tour-of-pharo.html`);
a second chapter with the same name gets `-2`. The site is always written by `MicBookHTMLVisitor` (`#michtml`),
whatever `htmlWriter` says (`PRHtmlBookOutput>>writerFor:`).

## pillar.conf

`PRProject>>configuration` reads `pillar.conf` (STON) as a `ConfigurationForPillar`, extended with the output
folder. The configurations are nested (`CTEnvironment`): the configuration of a target has the project configuration
as parent (`createConfigurationFrom:`), and the configuration of a document has the project configuration as parent
(`metadataConfigurationForDocument:`). A value is looked up in the configuration and then in its parents. The keys
are described in [the layout of a book](book-layout.md#pillarconf).

## Archetypes

An archetype is a folder of [`archetypes`](../archetypes) with `sample/`, `support/` (with `archetypeID`), `custom/`
and, for some, `support/github/`.

- **Where they are found**: `PRArchetype class>>archetypesDirectory` takes the first existing folder among
  `archetypes` next to the image (a released Pillar, copied there by `build.sh`) and the `archetypes` folder of the
  Pillar repository cloned by Iceberg (a development image).
- **`pillar archetype <name>`** (`PRProject>>installArchetypeNamed:`, `PRArchetype>>installIn:`): checks that the
  archetype exists and that none of its sample or workflow files is already in the folder, then copies `sample/` into
  the book, `support/` as `_support`, `custom/` as `_custom` (when the book has none) and the workflow into
  `.github/workflows`.
- **`pillar updateArchetype [name]`** (`PRProject>>updateArchetype`, `updateArchetypeNamed:`,
  `PRArchetype>>updateIn:`): the archetype is the one of `_support/archetypeID` unless a name is given; `_support`
  is moved to `_support-previous`, the archetype installs a new `_support` and, when the book has none, `_custom`.
  The answer is a `PRArchetypeUpdate`, which lists the files that differ between the two versions.
- **`pillar updateBuild`**: replaces the `archetypes` folder next to the image with the one of the repository, to try
  an archetype being developed.

## Errors

`ClapPillarCommand>>executeOrPrintHelp` catches the errors raised by `execute` and `reportError:` writes one line on
stderr, then the command exits with a failure:

- an error of the author prints `pillar: <message>`: `PRCommandError` (and its subclass `PRMissingArchetypeID`),
  `MicInvalidBookStructure`, `MicResourceReferenceError` (`ClapPillarCommand class>>authorErrorClasses`);
- any other error is a bug of Pillar and prints `pillar: internal error: <class>: <message>` with where to report it.

Pillar signals `PRCommandError` when it checks a request before doing the work: a folder without `_support`
(`PRProject>>checkIsABook`), an invalid `pillar.conf` (`readConfigurationExtendedWith:`), a missing file
(`PRBuildListStrategy`), no or several root files (`PRBuildRootMainStrategy`), a missing or unknown writer
(`writerFor:forConfigurationTag:`), an unknown format (`ClapPillarBuildCommand>>outputTarget`), an unknown archetype
(`PRArchetype>>validateExists`), files in the way of an archetype (`filesInTheWayIn:`), and `latexmk` that cannot run
or fails (`PRPDFDocument`, with the path of the LaTeX log).

## Tests

| Test class | What it covers |
| --- | --- |
| `PRIntegrationTest` | installs each archetype of the repository in a temporary folder and builds it: HTML and site compared with expected parts, LaTeX checked in the `.tex` file (a failing `latexmk` is ignored, the PDF is not compared) |
| `PRHtmlBookOutputTest` | `pillar build site` on a small book in memory: pages, links, numbering, table of contents, book structure |
| `PRCustomSupportTest` | `_custom` applied over `_support`, `custom.css` and `custom.tex` |
| `PRArchetypeTest`, `PRArchetypeUpdateTest` | finding, installing and updating archetypes |
| `PRBuildRootMainStrategyTest` | the root file chosen by `pillar build` |
| `PRCommandErrorTest`, `ClapPillarCommandErrorTest` | the errors of the author and how the commands report them |
| `ClapPillarBuildCommandSpecTest`, `ClapPillarArchetypeCommandSpecTest`, `ClapPillarUpdateArchetypeCommandSpecTest` | how the command lines are read |
| `ConfigurationForPillarTest`, `ChrysalPillarConfigurationTest` | reading `pillar.conf` |
| `MicAnalysisReportWriterTest`, `CheckerConfigurationTest` | `pillar check` and the configuration of the checkers |
