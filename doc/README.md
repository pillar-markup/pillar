# Pillar documentation

Pillar turns books, booklets and slides written in [Microdown](https://github.com/pillar-markup/Microdown)
into PDF (through LaTeX), a single HTML page, or a web site with one page per chapter.

- [The pillar commands](commands.md): create a book, build it, check it, update its support files.
- [The layout of a book](book-layout.md): `pillar.conf`, the chapters, `_support`, `_custom`, `_result`,
  and how to customize the look of a book without losing the changes at the next update.

To write the text of a book, read the Microdown syntax: the archetype `bod-book-latex2026` installs a sample book
that is itself a guide to Microdown, the web site and the checkers (`pillar archetype bod-book-latex2026`, then
`pillar build site`).

## Older documents

- The booklet [Publishing a Pillar Booklet](https://github.com/SquareBracketAssociates/Booklet-PublishingAPillarBooklet).
- The folder [`documentation`](../documentation) keeps older material (PDFs from 2020).
