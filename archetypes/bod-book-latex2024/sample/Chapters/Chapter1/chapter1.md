## Microdown syntax
The syntax covers two distinct categories - inline and paragraphs. 
- Inline commands cover things like emphasis and links. The inline syntax is about elements inside paragraphs.
- Paragraphs are commands that span several lines of text (lists, code examples, etc). We often named them Bloc-level elements. 


### Text emphasis
- **bold** is done by `**bold**` (You can get \** by `\**`)  
- _italics_ is done by `_italics_`
- ~strike~ is done by `~strike~`
- `inline code` is done by   \`inline code\`

### Links and Figures

[Link](https://Pharo.org) is done as `[Link](https://Pharo.org)`. 

Figures are supported using the markdown idiomatic syntax: `![A caption](figures/pillar.png)`.  
In books, figures are generally not in paragraphs but by placing them on a line by itself.
Figure *@aFigAnchor@*, in addition, specifies a size and an anchor as explained below.

```
![This is a caption. %width=50&anchor=aFigAnchor](figures/pillar.png)
```

![This is a caption. %width=50&anchor=aFigAnchor](figures/pillar.png)

Any anchor can be referred to using an anchor reference following this syntax: `*@anAnchor@*`.


### Key systematic features

Microdown offers anchors and references. Most of anchors are expressed using bloc parameters. 
So we present this basic feature first then show its usage.

#### Bloc parameters

Microdown has a generic way to manage arguments of elements. The syntax is `tag|key1=value1&key2=value2`. 

### Anchors and References
Microdown supports different anchors: at the heading level, math equations, and figures.

#### Heading anchors
`@anAnchor` starting a new line defines the anchor `anAnchor`. This type of anchor is a bloc-level element.

#### Figures

As explained above we can define width and anchor delimited by `%`. Figure  *@aFigAnchor@* is defined as:

```
![This is a caption. %width=50&anchor=aFigAnchor](figures/pillar.png)
```


#### Equations

Using the same mechanism you can define a caption and an anchor of an equation.

```
$$ %anchor=frac&caption=The crazy equation
\frac{1}{1+2}
$$
```

### Microdown Math 

Microdown supports both inline math using `$` and equation `$$`

- Inline LaTeX is done using `$` as in `$x^2$` to produce $x^2$.

- For equation, you should use `$$` as follows. The expression 

```
$$ %anchor=frac
\frac{1}{1+2}
$$
```

produces a fraction. Notice the use of `%anchor=frac` to define metadata.

$$
\frac{1}{1+2}
$$




### Headers
Headers are done by lines starting with `#`. One `#` is the largest header, six `######` is the smallest header. The header text is written after the `#` signs.`

##### This is a header level 5, done as `##### This is a header level 5` 

### Comments
It is possible to put comments in the Microdown source. Lines starting with `%` create a comment paragraph, but most tools ignore them.

```
% They really are ignored
```

### File-level Metadata

Microdown uses JSON to handle file-header metadata as shown after:

```
{
"author" : "Stéphane Ducasse",
"title" : "a cool documentation"
}
```


### Unordered lists
Unordered list are made by prefixing a line with '-' or `*`.
* item 1
- item 2
* It is possible to make a long item
  with several lines of text by indenting the following lines 
  by 2 spaces (two!, not three or one or tab)

#### Indented lists
* Item 1
  * by prefixing the `-` or `*` by two spaces, one indent the list by one level
    * Item 1.1.1
  * Item 1.2
* Againg, the indentation is two spaces!
    * If you indent by say 4 spaces instead of two, it is just seen as a new line in the preceding bullet point

### Ordered lists
Ordered lists are done by prefixing a line with a digit followed by `.` or `)`.
2. First item
4) The numbers need not be in order, the rendering will start the numbering from one and increment

### Mixed lists
It is possible to mix the two types of lists
1. This is first item, made using `1. This is first item`
   - sub item
   * Indenting sublist is tricky, but the bullet (`*` or '-') must be matched up under the first letter in the line `This is the ...`
      In this case 3 spaces of indentation `1._`
1. Next numbered item

### Horizontal lines
***
Are created by a single line starting with at least three `*` - this works: `***` as well as `*************`
*************

### Code blocks
To show code one use a triple backquote

```text
  ```pharo
	Metacello new
		repository: 'github://svenvc/zinc/repository';
		baseline: 'ZincHTTPComponents';
 		load.
  ```
```

produces:

```pharo
  Metacello new
    repository: 'github://svenvc/zinc/repository';
    baseline: 'ZincHTTPComponents';
    load.
```

#### Predefind language modifiers

The `pharo` modifier used above is good for pharo expressions. Often one will show a full method,  and should use `method` to get a better highlighting and coloring of the method header.

```text
  ```method
    accept: aVisitor
           ^ aVisitor visitCode: self
  ```
```

produces:

```method
accept: aVisitor
 	^ aVisitor visitCode: self
```

Plain unformatted text is made by using the `text` modifier, which will just print the body as is.

```text
  ```text
    accept: aVisitor
           ^ aVisitor visitCode: self
  ```
```
produces:

```text
accept: aVisitor
 	^ aVisitor visitCode: self
```

### Tables

It is possible to write tables in markup. These tables are intended to be short and not too wide. The cells of the tables can only be marked up with inline markup.
```text
| Header1 | Header2 | Header 3 |
| --- | ---- | --- |
| cell 1 1 | cell 1 2 | cell 1 3 |
| cell 2 1 | cell 2 2 | cell 2 3 |
```
produces:
| Header1 | Header2 | Header 3 |
| --- | ---- | --- |
| cell 1 1 | cell 1 2 | cell 1 3 |
| cell 2 1 | cell 2 2 | cell 2 3 |

**Notice**, unlike some other markdowns, Microdown requires lines to start with `|`. 
There has to be at least the `---` in the line after the header. 
Leaving out the second line merely produces a table without header highlighting.

| Header1 | Header2 | Header 3 |
| cell 1 1 | cell 1 2 | cell 1 3 |
| cell 2 1 | cell 2 2 | cell 2 3 |





## Less known features

Microdown offers less used but sometimes important features.


### Quote blocks

> Lines starting with `>` are rendered in an indented manner.
> At present the in-image rendering leaves something to be desired
> But it works for now
Each source line, which is part of the quote block, needs to start with a `>`.

```
> This is a quote block
> written on multiple lines
```

> This is a quote block
> written on multiple lines

The book style may redefine the quote environment to provide different visual feedback.

### Annotated paragraphs

Microdown supports annotated paragraphs using `>[!` as follows:

```
>[! Important]
> La libre communication des pensées et des opinions est un des droits les plus précieux de l'homme ; 
> tout citoyen peut donc parler, écrire, imprimer librement, sauf à répondre de l'abus de cette liberté dans les cas déterminés par la loi.
```

>[! Important]
> La libre communication des pensées et des opinions est un des droits les plus précieux de l'homme ; 
> tout citoyen peut donc parler, écrire, imprimer librement, sauf à répondre de l'abus de cette liberté dans les cas déterminés par la loi.

Three labels are defined by default: important, todo, and note. Anything else produces a note.


>[! Article 4. ]
> La liberté consiste à pouvoir faire tout ce qui ne nuit pas à autrui : 
> ainsi, l'exercice des droits naturels de chaque homme n'a de bornes que celles 
> qui assurent aux autres membres de la société la jouissance de ces mêmes droits. 
>  bornes ne peuvent être déterminées que par la loi.


>[! todo]
> In the future we may introduce a parametrizable version of annotated paragraphs


### Raw HTML paragraphs

With recent versions of Microdown, you can embed top-level HTML blocks.

```
<address>
kjlkjljlkj
hkjhkjh
<\address>
```


### Raw 

Microdown also supports the possibility to express raw text using `{{{` and `}}}`.

```
{{{**bold**}}}
```

With raw, Microdown emits the text untouched so pay attention.



## Extensions

Microdown proposes two kinds of extensions: inline and paragraph-level ones. 

### Microdown inline extensions

There are potentially endless extensions one would like to add to Microdown. Rather than keep inventing new syntax, the generic syntax for inline syntax is:
`{!extension|par1=value1&par2=value2&par3=value3!}`. What the extension does will typically depend on the visitor (LaTeX generation, Text generation, HTML generation, etc)

Some extensions are already defined in the Microdown library:
- **footnote|note=some note which goes to the foot**  - adds a footnote the the generated document
- **citation|ref=somewhere so others can find it** - adds a reference to the generated document

Note that each extension can define a default first key. 
So `{!citation|ref=Duca99a}` can be expressed as `{!citation|Duca99a}`.


### Microdown paragraph extensions

Microdown offers a generic way to create new bloc-level elements. These can also be nested
and are close to LaTeX environments. 
There are defined using `<!tag|key1=value1&key2=value2!>`

The most common use is the inputFile one: `<!inputFile|path=uri!>` inserts the contents of the microdown document at uri at this place.

### Possible changes in future versions

We are about to revise the syntax of the extension because it conflicts with the introduction of raw paragraphs. We are also considering adding element level meta data as in Kramdown. This should let users define HTML class at the node level.
