#### Exercise
Give combination of `car`s and `cdr`s that will pick `7` from each of the following lists:

 1. `(1 3 (5 7) 9)`
 2. `((7))`
 3. `(1 (2 (3 (4 (5 (6 7))))))`

#### Solution
Let us start by `list` representations of the first item.

`(define l (list 1 3 (list 5 7) 9))`

Now, we need to transform this to equivalent `cons` representation in order to understand how we should extract the element `7` from it. For the sake of simplicity, lets substitute the inner `(list 5 7)` with `x`. Then we will have:

`(cons 1 (cons 3 (cons x (cons 9 '()))))`

`x` is `(cons 5 (cons 7 '()))`, so when we put it back in, we will get:

`(cons 1 (cons 3 (cons (cons 5 (cons 7 '())) (cons 9 '()))))`

Now it's much easier to see how the list is represented as nested pairs, and how we can leverage `car` and `cdr` to extract the required element. Keeping in mind that `car` evaluates to the first item in the pair, and `cdr` to the second, we can get to the `7` by:

`(car (cdr (car (cdr (cdr l)))))`.

If you doubt it, you can evaluate `(car l)` and `(cdr l)` in the interpreter to see how it works.

The second one is easier:

`(define m (list (list 7)))`

It's equivalent to:

`(cons (cons 7 '()) '())`

`7` can be extracted from it by the application `(car (car m))`.
We will do similar steps for the third one.

`(define n (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))`

The innermost `(list 6 7)` is equivalent to `(cons 6 (cons 7 '()))`. When wrapped in the list with the `5` it becomes:

`(cons 5 (cons (cons 6 (cons 7 '())) '()))`

Now, adding `4` to the mix:

`(cons 4 (cons (cons 5 (cons (cons 6 (cons 7 '())) '())) '()))`  

And after repeating this for the rest of the elements, we get the long and boring expression:

`(cons 1 (cons (cons 2 (cons (cons 3 (cons (cons 4 (cons (cons 5 (cons (cons 6 (cons 7 '())) '())) '())) '())) '())) '()))`

After rewarding ourselves with a treat for doing this ~~worthless~~ exercise, we can finally extract `7` from this scrambled mess by:

`(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr n))))))))))))`
