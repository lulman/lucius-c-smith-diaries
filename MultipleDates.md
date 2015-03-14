# Introduction #

Smith's "daily" diary entries sometimes span multiple days, in which case the simple @when attribute isn't sufficient. Below, I cover the encoding for two other situations you may encounter.


# Details #

If you encounter an entry that spans multiple, clearly identifiable dates, you should use @from and @to attributes with the `<date>` element:

`<date from="1862-08-04" to="1862-08-05">Monday 4th <lb/> and Tues 5th Aug 1862</date>`

If you encounter an entry that spans multiple dates that you can't identify with certainty but can determine "bounding" dates from internal or external evidence, you can use the @notBefore and @notAfter attributes:

`<date notBefore="1862-08-04" notAfter="1862-08-05">Morning</date>`