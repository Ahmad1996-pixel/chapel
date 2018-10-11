// This version is perhaps the most obvious / easiest to parallelize

use FileHashing;
use FileSystem;
use Sort;
use Time;

config const timing = false;

proc main(args: [] string) {
  var clock:Timer;
  var paths:domain(string);

  if timing {
    writeln("Gathering files");
  }
  clock.start();
  for arg in args[1..] {
    if isFile(arg) {
      paths += relativeRealPath(arg);
    } else if isDir(arg) {
      for path in findfiles(arg, recursive=true) {
        paths += relativeRealPath(path);
      }
    } else {
      writeln("Error: argument not handled ", arg);
    }
  }
  clock.stop();
  if timing {
    writeln("Gathering ", paths.size, " files took ", clock.elapsed(), " seconds");
  }

  // call computeFileHash to gather the hashes
  // computeFileHash is declared like this:
  //   computeFileHash(path: string): SHA256Hash throws
  // so it accepts a string argument and returns a SHA256Hash

  // stumbling block: tuples

  // hashAndPath is an array of tuples
  var hashAndPath:[1..paths.size] (SHA256Hash, string);

  // Set the path component in the array
  // stumbling block: can't forall over domain and convert to array
  for (tup, path) in zip(hashAndPath, paths) {
    tup(2) = path;
  }

  if timing {
    writeln("Reading and hashing files");
  }
  clock.clear();
  clock.start();
  forall (hash, path) in hashAndPath {
    hash = computeFileHash(path);
  }
  clock.stop();
  if timing {
    writeln("Reading and hashing files took ", clock.elapsed(), " seconds");
  }

  if timing {
    writeln("Sorting by hash");
  }
  clock.clear();
  clock.start();

  // stumbling block: need to know sort exists
  sort(hashAndPath);

  clock.stop();
  if timing {
    writeln("Sorting by hash took ", clock.elapsed(), " seconds");
  }

  // stumbling block: this look is kindof hard
  var i = 1;
  while i < paths.size {
    // Look for the group matching
    var next = i + 1;
    while next <= paths.size && hashAndPath[i](1) == hashAndPath[next](1) {
      next += 1;
    }
    // Now i..next-1 is the group matching
    if i < next-1 {
      writeln(hashAndPath[i](1));
      for j in i..next-1 {
        assert(hashAndPath[i](1) == hashAndPath[j](1));
        writeln("  ", hashAndPath[j](2));
      }
    }
    i = next;
  }
}
