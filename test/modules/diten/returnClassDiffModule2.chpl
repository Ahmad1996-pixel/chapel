module M1 {
  var a = 1;
  class C {
    var b = 2;
    def foo() {
      return a+b;
    }
  }
}

module M2 {
  def main {
    var c = bar();
    writeln(baz(c));
  }
  def bar() {
    use M1;
    return new C();
  }
  def baz(obj) {
    use M1;
    return obj.foo();
  }
}
