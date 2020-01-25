pinentry-dmenu
==============

This is the program I came up with when I
decided to merge the ideas of pinentry-dmenu [1]
and pinentry-dmenu [2]. Ladies and gentlemen, may
I present you, pinentry-dmenu!

Why?
---

Because pinentry-dmenu is not exactly configurable
as one would like, and pinentry-dmenu assumes you have
password patch enabled, and let's be honest, the dev of
pinentry-dmenu probably receives lots of messages because
of it.

Unnecessary stuff, like stest, has been removed from the
source.

Installation
------------

This build of dmenu, renamed as pinentry-dmenu-core can
be configured from config.h and be recompiled, exactly the
same as the actual dmenu.

To install just do (if necessary, as root)

    make
    make install

You can only install the pinentry-dmenu script, by doing

    make pinentry-install


NOTE:
Doing a `pinentry-install` modifies the script to make it
look for `dmenu` instead of `pinentry-dmenu-core`.


[1]: https://github.com/ritze/pinentry-dmenu
[2]: https://gitlab.com/sebastianrasor/pinentry-dmenu
