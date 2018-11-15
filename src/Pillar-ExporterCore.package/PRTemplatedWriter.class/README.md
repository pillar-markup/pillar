I am a pillar document writer that wraps a normal wrapper.
When writing one element, I first check if there is a file in the current template that overrides the default writing. If so, I use that file to template the contents.
Otherwise I simply delegate the writing to the wrapped one.

I am carefully designed so if an element X is delegated to the wrapped writer, it should delegate the writing of X's children back to myself.