An AsciiDoc canvas that facilitates writing AsciiDoc to a stream. The main methods are #surround:with: and #precede:by: that allow you to write something like this:

canvas surround:  [ "some code that generates the string inside the bold" ] with: '*'

canvas precede: [ "some code that generates the string which will be change by the label" ]  by: '[label]' 