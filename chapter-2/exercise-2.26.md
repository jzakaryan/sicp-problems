#### Exercise
Suppose we define `x` and `y` to be two lists:
```scheme
(define x (list 1 2 3))
(define y (list 4 5 6))
```
What result is printed by the interpreter in response to evaluating the following expressions:

```scheme
(append x y)
```
```scheme
(cons x y)
```
```scheme
(list x y)
```
#### Solution
`append`, as explained in section 2.2.1, flattens the input into a single list. It means that, while evaluating `append x y`, the interpreter will print:
```scheme
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 '()))))))
```
`(cons x y)` will evaluate to a pair, where each pair is a list. Since `(list 1 2 3)` is equivalent to `(cons 1 (cons 2 (cons 3 '())))` and `(list 4 5 6)` to `(cons 4 (cons 5 (cons 6 '())))`, `(cons x y)` will be printed as:
```scheme
(cons (cons 1 (cons 2 (cons 3 '()))) (cons 4 (cons 5 (cons 6 '()))))
```
Finally, `(list x y)` will look like:
```scheme
(cons (cons 1 (cons 2 (cons 3 '()))) (cons (cons 4 (cons 5 (cons 6 '()))) '())
```
