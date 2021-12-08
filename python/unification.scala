// Term can be:
//  -Placeholder (which holds a number)
//  -Structure (which has a name and a number of subterms)
//  -Atom

trait Term
case class Placeholder(value: Long) extends Term
case class Structure(name: String, subterms: Seq[Term]) extends Term

//                                                Key          Value
class EquivalenceClasses(private val mapping: Map[Placeholder, Term]) {
  def setRepresentative(t: Term): Term = {
    t match {
      case p: Placeholder if mapping.contains(p) =>
        setRepresentative(mapping(p))
      case _ => t
    }
  }

  def unify(t1: Term, t2: Term): Option[EquivalenceClasses] = {
    val reprT1 = setRepresentative(t1)
    val reprT2 = setRepresentative(t2)
    (reprT1, reprT2) match {
      case (p: Placeholder, _) =>
        Some(new EquivalenceClasses(mapping + (p -> reprT2)))
      case (_, p: Placeholder) =>
        Some(new EquivalenceClasses(mapping + (p -> reprT1)))
      case (Structure(name1, subterms1), Structure(name2, subterms2))
          if name1 == name2 && subterms1.size == subterms2.size =>
        // recursively call unify for each subterm
        subterms1.zip(subterms2).foldLeft(Some(this): Option[EquivalenceClasses])((accum, cur) =>
          accum.flatMap(equiv =>
            equiv.unify(cur._1, cur._2)))
    }
  }
}
