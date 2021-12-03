// Monad
// Design pattern for functional programming
//
// Design patterns
// -Object-oriented

// M[A] is a monad.
//   M is the monad.
//   M is parameterized by A.
//   M is some type (under designer control).
//   A is some type (under user control).
// Two related operations:
//
// def unit[A](a: A): M[A] = ...
// def bind[A, B](m: M[A], f: A => M[B]): M[B] = ...
//
// List[A] is a monad.
//
// def unit[A](a: A): List[A] = List(a)
//
// // bind gives you and
// def bind[A, B](m: List[A], f: A => List[B]): List[B] = 
//
// Additive monad.
//   It's a monad, but with two additional operations:
//
// def mzero[A](): M[A] = ...
// def mplus[A](m1: M[A], m2: M[A]): M[A] = ...
//
// List[A] is an additive monad.
//
// // failure
// def mzero[A](): List[A] = List()
//
// // mplus gives you OR
// def mplus[A](m1: List[A], m2: List[A]): List[A] = m1.append(m2)
