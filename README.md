# mnemnion.core/emojure

A Clojure library for using emoji in Clojure code. Yes, this works. The challenge is editing and viewing the resulting code. 

##Usage

```clojure
(🌍 #(+ (🎲 6) %1) [3 3 3])
(3 7 8) ;sample output
```

While "slurp" and "spit" are certainly descriptive, why not say

```clojure
(💾 (do-something (📂 "example.file")))
```

##Philosophy

Emojure is a whimsical demonstration of something I'm convinced has a future in coding: the use of literal icons within a textual codebase.

Emoji is the camel's nose into allowing iconography, complete with color, into Unicode. This should be embraced and extended. The tendency within Web design to embed icons into a custom font can be normalized through the usual process and extended to give our large and expanding collection of widely-understood icons a place in Unicode.

This will allow for code which is literally homoiconic, using glyphic representations of UI elements, for example. Why shouldn't your share handler have the same visual shape as the button on the user interface? Arguably, it should. 

Plus: hey, it works! With some caveats:

## Compatibility

As far as I know, Emojure is compatible with Clojure generally. That is, code will execute correctly, provided some intermediate representation doesn't munge it. Whether you can meaningfully edit it is a different story. 

Emojure is visible in Sublime Text 2 running Mac OS X. It is also tested (and works) on Catnip IDE running on the latest build of Firefox. This is, to my knowledge, the only way to edit Emojure code with REPL, making Catnip the most compliant Clojure environment in existence. 

Catnip has a bug under Safari where the buffer won't scroll down; this is unrelated to emojure, and Safari is not a supported platform for Catnip.

Emoji are displayed as the box character under Chrome, and until the buggy UCS-16 of the underlying Javascript engine gets patched or replaced, that's just how it is. This is also true of Light Table, most unfortunately, and for the same reason.

Emojure causes the lein repl to immediately explode and exit. This cannot be considered correct behavior. 

MacVim shows a missing character icon, which is better than nothing:

Important note: The Mac version of Emacs does not show anything at all for emoji, at the present time. This is an unfortunate state of affairs and a potential security risk. At minimum, a code editor should display the 'character not found' box when it is unable to render a printing character, or indeed, one may argue, a non-printing one. 

If your environment doesn't support Emojure, encourage them to fix this. Emoji is in the Unicode standard now, like it or not, and needs to be supported.

Think of emojure as a spice that you add at the end of cooking your code; it adds piquancy and a hint of color. 



## License

Copyright © 2013 Sam Putman.

Distributed under the BSD 2 Clause License. 
