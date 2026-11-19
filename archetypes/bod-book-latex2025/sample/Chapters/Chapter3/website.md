## Publishing a book as a web site
@chapSite

Pillar builds this book as a web site with one page per chapter.
The page you read now was built that way.

```text|caption=Building the web site of a book&anchor=lstBuildSite
cd MyBook
pillar build site
```

Listing *@lstBuildSite@* writes the site in `_result/site`: open `_result/site/index.html` in a browser,
or copy the folder to any web server. The site needs no server-side program.

### The pages

- `index.html` holds the text before the first chapter, usually the introduction.
- Each chapter (each `##` header, unless `pillar.conf` declares another level) becomes its own page, named after the anchor of its header,
  (`chapSyntax.html` for Chapter *@chapSyntax@*), or after its title when it has no anchor (`extensions.html`).
  A part (`#`) also gets a page, with its title and the text before its first chapter; the table of contents shows it as a heading over its chapters.
- Every page shows the table of contents with the chapters and their sections,
  and links to the previous and next chapters.

### Configuration

The book is configured in `pillar.conf`:

```text|caption=The settings used by the web site&anchor=lstConf
{
  "title" : "The title of the book",
  "attribution" : "The authors",
  "htmlWriter" : #michtml,
  "numbering" : true,
  "chapterLevel" : 2,
  "paragraphLevel" : 5,
  "palette" : "sky",
  "theme" : "dark"
}
```

- `htmlWriter` must be `michtml`, the writer that numbers headers, figures and listings and links references across pages.
  The writer named `micbasichtml` writes plain HTML, without numbers.
- `numbering` is true by default; set it to false to remove all numbers.
- `chapterLevel` is the level of the chapter headers: 2 (`##`) by default. A book written with `#` chapters sets it to 1
  and keeps its sources as they are; the web site and the PDF both follow it.
- `paragraphLevel` is the level from which headers are paragraph labels: three levels below the chapters on the web
  site (`#####` by default). The PDF keeps `#####` as a subsubsection unless this setting is given, so that existing
  books print as before. Set it to apply the same level to the web site and to the PDF.
- The two levels must leave at most three section levels between them (section, subsection, subsubsection):
  the build stops with a message otherwise.
- `title` is the title of the home page, and `attribution` appears in the footer.
- `palette` chooses the colors: `sky` (light blue with orange highlights, the default), `sunset` (orange with blue
  highlights) or `classic`.
- `theme` forces `light` or `dark`. Without it, the site follows the light or dark mode of the reader's system.

### Style

Two files of `_support` give the site its look; change them to change it.

- `_support/templates/html/site.mustache` is the template of every page: the table of contents, the pager and the footer.
  It receives the values `content`, `title`, `bookTitle`, `toc`, `previous` and `next`, and the settings of `pillar.conf`.
- `_support/html/css/book.css` is the style sheet. It uses local fonts only, has a light and a dark variant of each palette,
  and has a print layout without navigation.

### What the site does not show yet

- Mathematics (Section *@secMath@*) and footnotes (Section *@secInlineExtensions@*).
- Anchors on tables.
