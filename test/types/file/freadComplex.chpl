var complexNumber: complex = 1.2 + 3.4i;
var f: file = new file(filename = "freadComplex.txt", mode = FileAccessMode.read);
var i: int = 0;
var numTestCases: int = 8;

f.open();

while (i <= numTestCases) {
  f.read(complexNumber);         
  writeln(complexNumber);
}	
