# The pillar commands

All commands are run from the folder of the book (the folder holding `pillar.conf`):

```
pillar <command> [arguments] [flags]
pillar --help
pillar <command> --help
pillar --version
```

`pillar` is the script installed by `scripts/build.sh` (see the [README](../README.md) of the repository).
It runs a Pharo image in which Pillar is loaded; `--version` prints the version of its virtual machine.

| Command | What it does |
| --- | --- |
| [`archetype`](#pillar-archetype) | creates a new book from an archetype |
| [`build`](#pillar-build) | builds the book as PDF, HTML or web site |
| [`updateArchetype`](#pillar-updatearchetype) | updates the support files of an existing book |
| [`bookTester`](#pillar-booktester) | checks a book: references, anchors, code, typography |
| [`checkers`](#pillar-checkers) | lists the available checkers |
| [`serve`](#pillar-serve) | serves the HTML output on a local web server |
| [`updateBuild`](#pillar-updatebuild) | for the development of archetypes only |

## pillar archetype

```
pillar archetype <name>
```

Creates a book in the current folder from the archetype `<name>`: a sample book to start from and the support files
needed to build it.

```
mkdir MyBook
cd MyBook
pillar archetype bod-book-latex2026
pillar build site
```

The available archetypes are the folders of [`archetypes`](../archetypes):

| Archetype | For |
| --- | --- |
| `bod-book-latex2026` | a book or booklet (PDF with the sbabook class, web site); its sample book is a guide to Microdown |
| `bod-book-latex2025`, `bod-book-latex2024` | earlier versions of the book archetype, kept for existing books |
| `basic-latex-report` | a small report |
| `welcome` | the smallest example: one file |
| `microdown-mooc` | Beamer slides, a slide is `<!slide|title=...` ... `!>` |
| `microdown-headerformat-mooc` | Beamer slides, a slide is a `#` header |

An archetype folder holds:

- `sample/`: copied into the book folder (`pillar.conf`, `index.md`, `Chapters/`…);
- `support/`: copied as `_support/`, the templates, style sheets, fonts and LaTeX classes (see [the layout of a book](book-layout.md));
- `custom/`: copied as `_custom/`, where the book keeps its own changes to the look (next release);
- `support/github/`, when present: copied as `.github/workflows/`, a GitHub workflow that builds the book.

Warning: `archetype` replaces an existing `_support` folder, and overwrites the sample files of the same name.
To update the support files of an existing book, use [`updateArchetype`](#pillar-updatearchetype).

## pillar build

```
pillar build <format> [files...] [--all] [--mainRoot] [--templatable]
```

Builds the book in `<format>`:

| Format | Output | Notes |
| --- | --- | --- |
| `pdf` | `_result/pdf/` | writes a `.tex` file, then runs `latexmk` with LuaLaTeX: a TeX distribution must be installed |
| `html` | `_result/html/` | one HTML page per built file |
| `site` | `_result/site/` | a web site: one page per chapter, a table of contents, previous and next links, numbered sections, figures and listings |

Which files are built:

- with no file and no flag, `index.md`, the root of the book: it includes the chapters with `<!inputFile|path=...!>`;
- `pillar build pdf Lecture1.md Lecture2.md` builds the given files (used for slides: one PDF per lecture);
- `--mainRoot` builds `index.md` (the default);
- `--all` builds every Microdown file of the book.

`--templatable` is accepted but currently has no effect.

Each build first deletes its own output folder only (`_result/pdf` for `pdf`…), so the outputs of the different
formats stay side by side. It then copies `_support` (merged with `_custom`, next release) and every file and folder
of the book whose name does not start with `_` or `.` into the output folder, and writes the result there.

Examples:

```
pillar build pdf                  # _result/pdf/index.pdf
pillar build site                 # open _result/site/index.html
pillar build pdf Lecture1.md      # slides of one lecture
```

The settings of the book (title, writers, chapter level…) come from `pillar.conf`, described in
[the layout of a book](book-layout.md#pillarconf).

## pillar updateArchetype

Next release; it replaces the former `pillar updateTemplate`.

```
pillar updateArchetype [name]
```

Updates the support files of an existing book to the version of the archetype shipped with the installed Pillar.

- Without `name`, the archetype is the one the book was created from (read in `_support/archetypeID`).
  With a `name`, the book switches to that archetype.
- The current `_support` is moved to `_support-previous/`, then the archetype installs a fresh `_support`.
- The command lists the files of `_support-previous` that differ from the new version: if you had changed some of them,
  move your changes into `_custom` (see [customizing the look](book-layout.md#customizing-the-look-_custom)), then delete
  `_support-previous`.
- `_custom` is never modified. It is created, with its README, when the book does not have one.
- The book itself (`pillar.conf`, the chapters) is never modified.

## pillar bookTester

```
pillar bookTester <file>
```

Checks the book starting from `<file>` (usually `index.md`) and the files it includes, and prints the problems found:
references to missing anchors, duplicated anchors, code examples whose result is wrong, typography…
The checkers that run and their settings come from `pillar.conf`:

```
{
  "onlyCheckers" : [ "ReferenceChecks", "EnglishTypography", "LastPeriodInCaption" ],
  "checkerConfigurations" : [
      "HeaderCapitalization" : { "uppercase" : true, "keepAs" : [ "self", "super" ] },
      "Vocabulary" : [ [ "Virtual Machine", "virtual machine" ] ]
  ]
}
```

Checkers that depend on the structure of the book (such as `LastPeriodInParagraphLabel`) use the `chapterLevel` and
`paragraphLevel` of `pillar.conf`.

## pillar checkers

```
pillar checkers
```

Lists the names of the available checkers, to use in `onlyCheckers` and `checkerConfigurations`.


## pillar updateBuild

```
pillar updateBuild
```

Only for people developing archetypes: replaces the `archetypes` folder of the installed Pillar (next to its image)
with the `archetypes` folder of the parent folder, which is the repository when Pillar was built in its `build`
folder by `scripts/build.sh`. Edit an archetype in the repository, run `pillar updateBuild`, then try it with
`pillar archetype`.
