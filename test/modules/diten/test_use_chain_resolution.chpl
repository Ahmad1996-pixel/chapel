module M1 {
  var aaa = 321;
}

module M2 {
  use M1;
}

module M3 {
  use M2;
}

module M4 {
  var aaa = 54;
}

module M5 {
  use M4;
}

module M6 {
  var aaa = 6;
  def main() {
    use M3, M5;
    writeln(aaa); // Expect 54
  }
}
