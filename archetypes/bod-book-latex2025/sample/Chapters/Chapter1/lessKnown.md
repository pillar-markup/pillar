## Less known features

The elements of this chapter are used less often, but a book soon needs one of them.

### Annotated paragraphs

An annotated paragraph is a quote whose first line is `>[! label]`.
It sets apart a note, a warning, or something to do:

```text
>[! note]
> Annotated paragraphs are written like quotes.

>[! important]
> Save your image before you load new code.
```

>[! note]
> Annotated paragraphs are written like quotes.

>[! important]
> Save your image before you load new code.

>[! todo]
> Add an example with a long annotated paragraph.

The labels `note`, `important` and `todo` are predefined.
The web site gives a color to `note`, `important`, `tip` and `warning`; other labels are shown as notes.

### Mathematics
@secMath

Inline mathematics is written between `$`: `$x^2 + 1$`.
An equation is enclosed between two `$$` lines and takes the same arguments as a figure:

```text
$$ % anchor=eqSum&caption=The sum of the first integers.
\sum_{i=1}^{n} i = \frac{n(n+1)}{2}
$$
```

$$ % anchor=eqSum&caption=The sum of the first integers.
\sum_{i=1}^{n} i = \frac{n(n+1)}{2}
$$

The `%` starts the arguments.
With its anchor, the equation is numbered and referred to as Equation *@eqSum@*.

>[! important]
> The PDF shows mathematics. The web site does not show it yet:
> the equation above and inline mathematics are missing from the HTML pages.

### Raw HTML blocks

An HTML element written at the start of a line is copied to the HTML output as is:

```text
<aside>
This aside is only on the web site.
</aside>
```

<aside>
This aside is only on the web site.
</aside>

Other formats ignore it, so keep such blocks for content that only makes sense on the web.

### Raw text

Text between `{{` and `}}` is not read as Microdown:
`{{**not bold**}}` gives {{**not bold**}}.
Use it, like the backslash, to show markup without applying it.
