An HTML canvas that facilitates writing HTML to a stream. The main method is #tag that allow you to write something like this:

canvas tag
        name: 'a';
        parameterAt: 'href' put: href;
        with: [ "some code that generates the HTML inside the link" ]