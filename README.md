[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Q4DjR98Q)
# Task: Convolution in Parallel (OpenMP/C version)

You must implement a discrete 1D convolution of a data array A and a filter array F.
Both sequential and parallel programs must be provided. Both programs must be based
on the same algorithm, i.e. the parallel program must only make necessary changes to
parallelize the program, not rewrite the sequential algorithm.

Input consists of the following:

* First line: integer 100 <= NA <= {100, 1000000, 10000000} and integer 2 <= NF <= NA-1
  separated by space. NA values depend on test case difficulty (Easy, Medium, Hard).
* Next NA lines, each line contains one integer 0 <= i <= 255
* Next NF lines, each line contains one integer 0 <= i <= 255

For brevity, discrete 1D convolution in this problem refers only to the same operation
as in the following Python/numpy code:

```
numpy.convolve(A, F, mode='valid')
```

You must use only basic commands and no external libraries. The point of this assignment
is to practice basic parallelization and not rely on too much abstracting libraries.

## Starter Code

See the file [conv\_template.c]. Use of this code is optional.

## Performance

For a basic parallelization work, aim for speedup >= 2 with up to 4 threads/cores, and
speedup >= 3 when using up to 8 threads/cores. Of course, we expect you to be anything
but basic!

When calculating speedup, for the purposes of this work we will eliminate the I/O part
because frankly the competitive programming format like this isn't very realistic or
optimized IRL. Therefore, just use the user + sys part, not the real part.

Students will get zero points if performance fudging or cheating is detected by
deliberately slowing down the sequential program. Don't.

## Test Cases

See the `input_*` files and `output_*` files.

The test case generator [gen\_case.py] is provided as-is. The cases generated are to
be considered correct (as it merely punches out numbers and processes them using the
reference program code). However, the error checking, etc., requires user vigilance
as well, especially when attempting to use arguments outside the recommended ranges.
Also, no further documentation is provided at this time.

## Instant Autograding (GitHub Classroom)

Instant Autograding in GitHub Classroom is used only for sequential programming and
only for easy cases.

The demo case is also autograded but no score is given.

## Submission

Depends on your channel. For students coming here through 01204332 OS at KU in 2024,
I expect you to submit using Github Classroom. See the full task file in the LMS for
more details.

For general public who wishes to receive guidance, please contact me through email.
Note that this is a courtesy and cannot be guaranteed, nor does it create any sort of
professional or client relationship between us.

## Problem Authors

* Chawanat Nakasan

High-Performance Computing and Networking Center,
Department of Computer Engineering, Kasetsart University

If you found this as a forked repository, any further work is not done by the original
problem author.

This is intended to be an easy and introductory task. Have fun!

