#### Exercise 2.6
In case representing pairs as procedures wasn't mind boggling enough, consider that, in a language that can manipulate procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

```scheme
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
  ```
This representation is known as *Church numerals*, after the inventor, Alonzo Church, the logician who invented the λ calculus.
Define one and two directly (not in terms of zero and add-1. (Hint: Use substitution to evaluate `(add-1 zero)`). Give a direct definition of the addition procedure `+` (not in terms of repeated application of `add-1`).

#### Solution
Let's start by expanding the application `(add-1 zero)` as suggested by the hint in the exercise.

`(lambda (f) (lambda (x) (f ((zero f) x))))`
`(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))`

Now that we can't expand this any further, we can reduce this starting from the innermost application of lambda.

`(lambda (f) (lambda (x) (f ((lambda (x) x) x))))`
`(lambda (f) (lambda (x) (f x)))`

We're there. We can no longer reduce the expression. Therefore we can define `one` directly (without using `zero` or `add-1`).
```scheme
(define one (lambda (f) (lambda (x) (f x))))
  ```
Now we need to apply `one` to `add-1` to get the body for `two`.

`(add-1 one)`
`(lambda (f) (lambda (x) (f ((n f) x))))`
`(lambda (f) (lambda (x) (f (((lambda (x) (f x)) f) x))))`
`(lambda (f) (lambda (x) (f ((f f2) x))))`
`(lambda (f) (lambda (x) (f (f x))))`

Note that in step 4 we substituted variable f with f2 in order to avoid collision of unbound variable names.
```scheme
(define two (lambda (f) (lambda (x) (f (f x)))))
```

> It is hard to show that the "nonnegative numbers" defined in this way adhere to the properties of nonnegative numbers. For example `(add-1 (add-1 zero))` and `(two)` will produce lambdas with "identical behavior". [There's no formal definition of *equality* or *identity* for lambdas](https://stackoverflow.com/questions/33883671/how-to-test-if-two-functions-are-the-same),  so it's impossible to write assertions to test this in the code. `(eq? one (add-1 zero))` will evaluate to *false* because it will simply compare the references to the lambdas, not the lambdas themselves.

Looking at definitions for `one` and `two` we can recognize the pattern - number *n* can be defined similarly - as nested lambdas with n-times repeated application of *f* on the variable *x*.
