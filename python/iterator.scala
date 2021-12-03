// trait Iterator[A] {
//   def next(): A
//   def hasNext(): Boolean
// }

def unit[A](a: A): Iterator[A] = Iterator(a)
def bind[A, B](m: Iterator[A], f: A => Iterator[B]): Iterator[B] = m.flatMap(f)
def mzero[A](): Iterator[A] = Iterator()
def mplus[A](m1: Iterator[A], m2: Iterator[A]): Iterator[A] = m1 ++ m2

def foo(): Iterator[Int] = mplus(mplus(unit(1), unit(2)), unit(3))

def bar(): Iterator[Int] = mplus(mplus(unit(4), unit(5)), unit(6))

def fooOrBar(): Iterator[Int] = mplus(foo(), bar())

def fooAndBar(): Iterator[(Int, Int)] = {
  // for {
  //   x <- foo()
  //   y <- bar()
  // } yield (x, y)
  foo().flatMap(x =>
    bar().flatMap(y =>
      Iterator((x, y))))
}

def fooAndBar2(): Iterator[(Int, Int)] = {
  // flatMap(Int => Iterator[...]): Iterator[...]
  bind(
    foo(), (x: Int) =>
    bind(
      bar(), (y: Int) =>
      unit((x, y))))
}

@scala.annotation.tailrec
def sum(list: List[Int], accum: Int): Int = {
  list match {
    case head :: tail => sum(tail, head + accum)
    case Nil => 0
  }
}
