# The layout of a book

A book created with `pillar archetype bod-book-latex2026` looks like this:

```
MyBook/
  pillar.conf            settings of the book
  index.md               root of the book: front text and the chapters it includes
  Chapters/
    Chapter1/
      chapter1.md
      figures/pillar.png
    ...
  _support/              files of Pillar: templates, style sheets, fonts, LaTeX classes
  _custom/               your changes to the look of the book (next release)
  _result/               what pillar build writes: pdf/, html/, site/
  .github/workflows/     a GitHub workflow building the book (when the archetype has one)
```

Folders whose name starts with `_` or `.` are not part of the text: `pillar build` does not copy them as such into
the output. Keep `_result` out of version control; keep everything else in it.

## The text

`index.md` is what `pillar build` builds by default. It holds the text before the first chapter and includes each
chapter file:

```
<!inputFile|path=Chapters/Chapter1/chapter1.md!>
```

A path in a chapter (a figure, an included file) is relative to that chapter file.
By default a part is a `#` header, a chapter a `##` header, a section `###`, a subsection `####`, and from `#####`
a header is a paragraph label (see `chapterLevel` and `paragraphLevel` below).

## pillar.conf

`pillar.conf` is a STON dictionary. A line `#'any text': #comment` is a comment.

| Key | Used by | Meaning |
| --- | --- | --- |
| `title`, `attribution`, `series`, `keywords` | all | title, authors, collection and keywords of the book |
| `language` | all | for example `"en-UK"` |
| `latexWriter` | pdf | `#'miclatex:sbabook'` for books, `#micBeamer` for slides |
| `htmlWriter` | html, site | `#michtml`: numbers and cross-page references; `#micbasichtml`: plain HTML |
| `template` | pdf | the template file to use, for example `"slides.pharobeamer.template"` for slides |
| `bibFile` | pdf | the BibTeX file of the citations |
| `chapterLevel` | all, checkers | header level of the chapters: `2` (`##`, default) or `1` for a book whose chapters are `#` headers |
| `paragraphLevel` | all, checkers | header level from which headers are paragraph labels; at most four levels below `chapterLevel` |
| `numbering` | site | `false` removes the numbers of chapters, sections, figures and listings |
| `site_name` | html, site | name shown in the header of the pages |
| `palette` | site, html | colors: `sky` (default), `sunset` or `classic` |
| `theme` | site, html | `light` or `dark`; by default the pages follow the reader's system |
| `onlyCheckers`, `checkerConfigurations` | check | see [the commands](commands.md#pillar-check) |

## _support: the files of Pillar

`_support` is installed by `pillar archetype` and replaced by `pillar updateArchetype`. It belongs to Pillar:
**do not edit it**, your changes would be lost at the next update. Change the look in `_custom` instead.

```
_support/
  archetypeID                 the archetype the book comes from
  templates/html/             main.mustache (pillar build html), site.mustache (pillar build site)
  templates/latex/            main.mustache and the other LaTeX templates
  templates/beamer/           the slide templates (moocs)
  html/css/book.css           the style sheet of the HTML pages and of the web site
  html/fonts/                 the fonts used by book.css
  latex/                      the LaTeX classes and packages (sbabook, common.tex)
  beamer/                     the Beamer theme and its images (moocs)
```

## Customizing the look: _custom

Next release.

`_custom` has the same layout as `_support`. When the book is built, Pillar copies `_support` into the output, then
copies `_custom` over it (except `_custom/README.md`). So a file of `_custom` wins over the file of `_support` with
the same path, and templates, style sheets and LaTeX keep naming their files `_support/...`.
`pillar updateArchetype` never touches `_custom`.

There are two ways to change the look.

### Add to the style: custom.css and custom.tex (preferred)

- `_custom/html/css/custom.css` is loaded by the HTML pages after `book.css`. Write only the rules you change:

  ```
  :root { --measure: 80ch; }          /* wider text column */
  h2 { text-transform: uppercase; }
  ```

  The colors are variables (`--accent`, `--background`…) defined for each palette and for the dark mode at the top
  of `book.css`: to change one, repeat the selector that defines it there.

- `_custom/latex/custom.tex` is read at the end of the LaTeX preamble (books and slides). Put your macros and
  package options there:

  ```
  \renewcommand{\familydefault}{\sfdefault}
  ```

Since the files of Pillar stay in place, the book still gets their fixes at each update.

### Replace a file

Copy a file of `_support` to the same path in `_custom` and change the copy, for example
`_custom/templates/html/site.mustache` to change the structure of the pages, or a LaTeX template.
The copy replaces the file of Pillar at every build, including after an update: compare it with the new
`_support` version from time to time. Use this only when an addition is not enough.

## Updating the support files

```
pillar updateArchetype
```

1. moves the current `_support` to `_support-previous/`;
2. installs the `_support` of the archetype of the book, from the installed Pillar;
3. creates `_custom` with its README if the book has none;
4. lists the files of `_support-previous` that differ from the new `_support`.

### Moving a book whose _support was edited by hand

Books made before `_custom` existed may have edited files in `_support`. After the first `pillar updateArchetype`:

1. look at the files the command listed as different;
2. for each change that was yours (not just an older version of Pillar), put it in `_custom`:
   a few CSS rules in `custom.css`, LaTeX settings in `custom.tex`, or a copy of the whole file;
3. build the book and check it;
4. delete `_support-previous`.

## _result

`pillar build <format>` writes into `_result/<format>` (`pdf`, `html`, `site`) and deletes only that folder first.
Each output folder holds its own copy of `_support` (merged with `_custom`), the chapters and their figures.
`_result/site` can be copied as is to any web server.
