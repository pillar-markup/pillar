## Microdown syntax
@chapSyntax

Microdown is a small, regular variant of Markdown designed for writing books and documentation in Pharo.
Its syntax has two levels:

- **inline elements** live inside a paragraph: emphasis, code, links, references;
- **block elements** span one or more lines: paragraphs, headers, lists, code blocks, tables, figures, quotes.

Block elements can carry **arguments**, written `key=value` and separated by `&`.
The same syntax names a figure, captions a code block or anchors an equation, so once you know it, you know them all.

### Paragraphs and line breaks

A paragraph is a group of consecutive lines.
An empty line ends it.

Inside a paragraph, a new line is not a line break: the lines of a paragraph flow together, on the web site as in the PDF.
So you can write one sentence per line, and version control then shows changes sentence by sentence.

To break a line, write `<br>` where the break goes.
For example, an address:

```text
Inria Lille - Nord Europe <br>
Parc scientifique de la Haute Borne <br>
40, avenue Halley <br>
59650 Villeneuve d'Ascq
```

gives:

Inria Lille - Nord Europe <br>
Parc scientifique de la Haute Borne <br>
40, avenue Halley <br>
59650 Villeneuve d'Ascq

GitHub Markdown gives the same result, but marks a line break with two spaces at the end of the line, which nobody can see in the source.
Microdown makes the line break explicit.

### Text formats

| You write | You get |
| --- | --- |
| `**bold**` | **bold** |
| `_italic_` | _italic_ |
| `~strike~` | ~strike~ |
| `**bold and _italic_**` | **bold and _italic_** |

Formats nest, as the last line shows.
Text between backquotes is inline code: `Object new`.
To write a character that Microdown would read as markup, put a backslash before it: `\*` gives \*, and `\_` gives \_.

### Headers

A header is a line starting with one to six `#`.
In a book, `#` is the title of a part or of the book, `##` starts a chapter, `###` a section and `####` a subsection:

```text
## A chapter
### A section
#### A subsection
```

Do not skip levels (a `####` directly under a `##`): numbering counts the missing level as 0 and shows numbers like 1.0.1.

#### A subsection

This is a subsection, written `#### A subsection`. The web site numbers it as part of its section.

### Lists

An unordered list item starts with `-` or `*`.
An ordered item starts with a number followed by `.` or `)`; the output numbers items from the first number on.

```text
- A first item
- A second item that is long enough
  to continue on a second line indented by two spaces
  - A nested item, indented by two spaces

1. First step
2. Second step
   - A nested bullet, aligned with the text of its item
```

gives:

- A first item
- A second item that is long enough
  to continue on a second line indented by two spaces
  - A nested item, indented by two spaces

1. First step
2. Second step
   - A nested bullet, aligned with the text of its item

Indentation matters: nested items and continuation lines are aligned with the first character of the text of their item.

#### Task lists

An item starting with `[ ]` is a task to do, and one starting with `[x]` a task done, as in GitHub Markdown:

```text
- [x] Write the chapter
- [ ] Add the figures
- [ ] Check the references
```

gives:

- [x] Write the chapter
- [ ] Add the figures
- [ ] Check the references

### Links

`[Pharo](https://pharo.org)` gives [Pharo](https://pharo.org).
A link to another place of the book is not written with a URL but with an anchor reference, presented in Chapter *@chapReferences@*.

### Figures

A figure uses the Markdown image syntax.
Its arguments end the caption, after a `%`:

```text
![The Pillar logo.%width=40&anchor=figPillar](figures/pillar.png)
```

![The Pillar logo.%width=40&anchor=figPillar](figures/pillar.png)

- The text between the brackets and before the `%` is the caption; it may contain inline formats.
- `width` is a percentage of the width of the page.
- `anchor` names the figure, so that the text can refer to it with an anchor reference: the anchor between `*@` and `@*`.
  Writing `Figure *@figPillar@*` gives Figure *@figPillar@*: the reference shows the number of the figure.
  Anchors and references are presented in Chapter *@chapReferences@*.
- The path is relative to the file that contains the figure. Always write the file extension (`.png`, `.jpg`, `.svg`):
  LaTeX finds a file without it, a browser does not.

Place a figure on a line by itself, separated from the text by empty lines.

### Code blocks

A code block is enclosed between two lines of three backquotes.
The first line may name the language and add arguments:

```text
  ```pharo|caption=Loading Zinc HTTP Components&anchor=lstZinc
  Metacello new
      repository: 'github://svenvc/zinc/repository';
      baseline: 'ZincHTTPComponents';
      load.
  ```
```

```pharo|caption=Loading Zinc HTTP Components&anchor=lstZinc
Metacello new
    repository: 'github://svenvc/zinc/repository';
    baseline: 'ZincHTTPComponents';
    load.
```

A code block with a caption or an anchor is a listing: it is numbered, like Listing *@lstZinc@*.

An anchor alone is enough to refer to a code block with an anchor reference (`*@lstFactorial@*`, see Chapter *@chapReferences@*):

```text
  ```pharo|anchor=lstFactorial
  100 factorial printString size
  ```
```

```pharo|anchor=lstFactorial
100 factorial printString size
```

Listing *@lstFactorial@* counts the digits of 100 factorial. It has a number but no caption.

A code block without caption nor anchor is a plain snippet:

```
Transcript show: 'A plain snippet, without number'
```

The language changes the highlighting:

- `pharo` for Pharo expressions;
- `method` for a whole method, whose first line is the method header;
- `text` for text written as is.

```method
accept: aVisitor
	"A method, shown with the method language."

	^ aVisitor visitCode: self
```

### Tables

A table is a sequence of lines starting with `|`.
A line of `---` cells after the first line makes it the header.

```text
| Element | Inline | Numbered |
| --- | --- | --- |
| Figure | no | yes |
| Listing | no | yes |
| Emphasis | yes | no |
```

| Element | Inline | Numbered |
| --- | --- | --- |
| Figure | no | yes |
| Listing | no | yes |
| Emphasis | yes | no |

Without the `---` line, the table has no header:

| first | 1 |
| second | 2 |

Cells hold inline elements only. Keep tables short and narrow: they must fit a printed page.

### Quotes

Lines starting with `>` form a quote:

```text
> Simplicity is prerequisite for reliability.
> Edsger W. Dijkstra
```

> Simplicity is prerequisite for reliability.
> Edsger W. Dijkstra

### Horizontal lines

A line of three or more `*` draws a horizontal line:

```text
***
```

gives:

***

### Comments

A line starting with `%` is a comment: it stays in the source and appears in no output.

```text
% TODO: add a figure of the inspector here.
```

% This comment is in the source of this chapter, but you cannot see it.

### Document metadata

A file may start with metadata written in JSON:

```text
{
  "title" : "A cool documentation",
  "authors" : "S. Ducasse"
}
```

The book-wide settings, such as the title, the writers and numbering, live in `pillar.conf`, presented in Chapter *@chapSite@*.
