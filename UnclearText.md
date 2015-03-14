# Introduction #

Torsa and Emily have successfully completed their first runs at our workflow, and they asked some questions about text they can't read and encoding line breaks. Because most of you will probably wonder about the same issues, I've posted answers here so that everyone can refer to them.


# Details #

## Unclear or Illegible Text ##

You can use the `<unclear>` element liberally if you can't decipher some text in the diary (e.g., `<unclear>Your best guess</unclear>`). If you can't make heads or tails of something, you can use `<gap reason="illegible"/>` -- note that `<gap>` is an "empty" element (it contains only one tag, rather than enclosing text and/or other elements with opening and closing tags). Later you can scan or search for `"<unclear" and "<gap"` to revisit those tough cases. I've provided several help pages (see below), but sometimes you just have to come back later. Also, we will spend studio time in class trying to resolve those tough cases

### Help Pages for Deciphering Unclear Text ###

On our Carmen Content page, check the following pages under the "Transcribing The Lucius Clark Smith Diaries" module:

  * Guide to ms Hand
  * Transcribing Ambiguous Text

### Page Breaks ###

When you encode a page break with `<pb/>`, oXygen will add a @facs attribute because our schema requires one, but it won't supply a value for the attribute. You will end up with the following `<pb facs=""/>`, which will generate an error. As I said in class, you need to put something in there for now. I suggest "9999." We will resolve those phony values during our in-class studio time on Sept. 10.

Don't forget to commit your work regularly to the SVN repository - at least after every work session - and add a brief "commit" message.