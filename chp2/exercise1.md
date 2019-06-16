### Exercise 1
* a) `^c*(ab+)+(a|b|c)*$`
  * Strings over the alphabet `{a, b, c}` where the first `a` precedes the first `b`.
* b) `^(aa|b|c)*$`
  * Strings over the alphabet `{a, b, c}` with an even number of `a`'s consecutively.
* b) `^((b|c)*a(b|c)*a(b|c)*)*$`
  * Strings over the alphabet `{a, b, c}` with an even number of `a`'s. 
* c) `^(0|(1|0)*(00)+)$`
  * Binary numbers that are multiples of 4.
* d) `^(1(0|1){6})|1(0|1)1(0|1)1(0|1)$`
  * Binary numbers that are greater than `101001`.
* e) `^((a|c)*|(ba(b|c)+)*|(bc)*)*$`
  * Strings over the alphabet `{a, b, c}` with no `baa` contained.
  * However I have a problem strings ending in `ba`, do not match.
