## Extensions

Rather than adding new syntax for each need, Microdown has one generic syntax for extensions,
at the inline level and at the block level.
Each output format decides how to write them.

### Inline extensions
@secInlineExtensions

An inline extension is written `{!name|key1=value1&key2=value2!}`.
An extension may have a default key, so its first value can be written without key.
Two are predefined:

- `{!citation|ref=Duca99a!}`, or `{!citation|Duca99a!}`, cites an entry of the bibliography file named by `bibFile` in `pillar.conf`;
- `{!footnote|note=A note.!}` adds a footnote.

>[! important]
> The PDF shows footnotes. The web site does not show them yet: they are dropped from the HTML pages.

### Block extensions

A block extension is written between `<!name|arguments` and `!>`.
It can span several lines and contain other elements, much like a LaTeX environment.

The most used block extension is `inputFile`, which includes another Microdown file at its place:

```text
<!inputFile|path=Chapters/Chapter1/chapter1.md!>
```

The `index.md` of this book is a list of `inputFile`, one per chapter.
The path is relative to the file that contains the `inputFile`.

### Future changes

The extension syntax may change: its delimiters conflict with other uses of `{` and `<`.
Element-level metadata, as in Kramdown, is also considered, for example to give an HTML class to one element.
