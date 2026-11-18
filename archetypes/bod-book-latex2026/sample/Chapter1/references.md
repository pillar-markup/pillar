## Anchors, references and numbers
@chapReferences

Books refer to their own parts: _see Section 2.3_, _as shown in Figure 1.1_.
Microdown separates the two sides of such a link.
An **anchor** names an element, and a **reference** points to the anchor.
When the book is built, chapters, sections, figures, listings and equations get numbers,
and each reference shows the number of its target.
You never write a number yourself, so numbers stay right when you move things around.

### Anchors
@secAnchors

There are two ways to define an anchor.

First, a line starting with `@` just after a header anchors the header.
This section starts with:

```text
### Anchors
@secAnchors
```

Second, a figure, a listing or an equation takes an `anchor` argument, as shown in Chapter *@chapSyntax@*:

```text
![The Pillar logo.%anchor=figPillar](figures/pillar.png)

  ```pharo|anchor=lstZinc
  ...
  ```

$$ % anchor=eqSum
...
$$
```

An anchor must be unique in the whole book, not only in its chapter.
Use a prefix that tells the kind of element (`chap`, `sec`, `fig`, `lst`, `eq`): references then read well in the source.

### References
@secReferences

A reference is the anchor name between `*@` and `@*`.
Write the kind of element before it, since a reference shows only the number:

```text
Chapter *@chapSyntax@* shows the syntax; Figure *@figPillar@* is the logo,
Listing *@lstZinc@* loads Zinc, and this section is Section *@secReferences@*.
```

gives:

Chapter *@chapSyntax@* shows the syntax; Figure *@figPillar@* is the logo,
Listing *@lstZinc@* loads Zinc, and this section is Section *@secReferences@*.

A reference works across chapters.
On the web site, each chapter is its own page, so a reference to another chapter links to that page:
the reference to Figure *@figPillar@* above leads to the first chapter.

### How numbers are given

- Chapters are numbered from 1; the text before the first chapter (the introduction of the book) is not numbered.
- Sections are numbered within their chapter: 2.1, 2.2, and subsections within their section: 2.1.1.
- Figures, listings and equations are numbered within their chapter, each kind on its own: Figure 1.1, Listing 1.1.
- A figure, listing or equation gets a number only when it has a caption or an anchor.
  A plain snippet stays unnumbered.
- An anchor after a header takes the number of that header.

Tables cannot have an anchor yet.

### Checking references

A reference to an anchor that does not exist is not an error when the book is built:
it simply shows no number.
The reference checker of Chapter *@chapCheckers@* reports such references, as well as duplicated anchors.
