def foo(): Iterator[Int] =
  Iterator(1, 2, 3)

def bar(): Iterator[String] =
  Iterator("alpha", "beta")

def fooAndBarPair(): Iterator[(Int, String)] = {
  foo().flatMap(a =>
    bar().flatMap(b =>
      Iterator((a, b))))
}

def fooAndBarPair2(): Iterator[(Int, String)] = {
  for {
    a <- foo()
    b <- bar()
  } yield (a, b)
}

