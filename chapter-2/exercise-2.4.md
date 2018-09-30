#### Exercise 2.4
Here is an alternative procedural representation of pairs. For this representation, verify that `(car (cons x y))` yields x for any objects `x` and `y`.

```scheme
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
  ```
What is the corresponding definition of `cdr`? (Hint: To verify that this works make use of the substitution model in section 1.1.5.)

#### Solution
Using the substitution model in section 1.1.5, we can expand the application `(car (cons x y))` to the following:

 `((cons x y) (lambda (p q) p))` 
 `((lambda (m) (m x y)) (lambda (p q) p))`

It's now easier to see that this reduces to p.  `cdr` can be implemented like this:

```scheme
(define (cdr z)
  (z (lambda (p q) q)))
  ```
  We can make sure it reduces to `q` by performing substitutions similar to the ones we did for `car`.
 
