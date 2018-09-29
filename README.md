# sicp-problems

I started solving problems in the second edition of "Structure and Interpretation of Computer Programs" by Abelson et al. I will use this repository to post the solutions.

## How to run the Scheme programs?
There are different interpreters available. Here are a couple of them with instructions on how to set them up:

### DrRacket
DrRacket is an extensible IDE with an interpreter for Racket. You can get an installer from [here](https://download.racket-lang.org/). In order to add the Scheme support and run the scripts in this repository, you will also need to install the `sicp` package. To do that, go to *File -> Package Manager* and type `sicp` in the search box.

### Repl.It
[Repl.It](http://repl.it) is a free web-based IDE that lets you write and run code in a plethora of languages, including Scheme. Repl.It uses BiwaScheme - a javascript based interpreter for Scheme. BiwaScheme has a conformance with [R6RS](http://www.r6rs.org/) - the 6th major revision of Scheme language specification. The problem is that some procedures, which were built into R5RS were dropped in R6RS. Most notably, the `remainder` procedure is not included in R6RS because it can be expressed in terms of `mod` and other arithmetic procedures. This is the reason that I don't recommend using Repl.it or BiwaScheme for SICP problems (unless, of course, you're willing to implement missing procedures yourself).
