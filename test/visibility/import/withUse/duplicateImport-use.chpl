module A {
  var x: int;
}
module B {
  public import A;
}
module C {
  public import A;
}
module D {
  use B, C;
  // The following use should be possible and not problematic due to the
  // multiple public imports of A
  use A;

  proc main() {
    writeln(x);
  }
}
