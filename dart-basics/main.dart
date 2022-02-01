// imports
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
// import 'package:test/test.dart';

// Importing files
// import 'path/to/my_other_file.dart';


// hello world
void main() {
  print('Hello, World!');
}

// Built-in types - The Dart language has special support for the following:

    // Numbers (int, double)
    // Strings (String)
    // Booleans (bool)
    // Lists
    // Sets A set in Dart is an unordered collection of unique items. {'', ''}
    // Maps (aka dictionary in Python)
    // Runes => expose the Unicode code points of a string
    // Symbols (Symbol)
    // The value null (Null)


// variables
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flyByObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptun'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

String name2 = 'Voyager II';
int year2 = 1988;

var int num3 = 3;

final name3 =
    'Voyager III'; // If you never intend to change a variable, use final or const, either instead of var or in addition to a type.
const int year3 = 1999;

// var name3 = 'Zoyager'; => Error: a final variable can only be set once.


// Control flow statements
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}


// loops
for (final object in flyByObjects) {
  print(object);
}

for (int month = 1; month <=12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}


// functions

main(x) {
  print(x);
}

// We recommend specifying the types of each function’s arguments and return value:

num fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);

// A shorthand => (arrow) syntax is handy for functions that contain a single statement. This syntax is especially useful when passing anonymous functions as arguments:

flyByObjects.where((name) => name.contains('turn')).forEach(print);



// Classes

class Spacecraft {
  String name;
  DateTime? launchDate;   // In a class, Declare instance variable launchDate, initially null.

  // Read-only non-final property
  int? get launchYear => launchDate?.year;   // Use ?. instead of . to avoid an exception when the leftmost operand is null:

   // Constructor, with syntactic sugar for assignment to members.
   Spacecraft(this.name, this.launchDate) {
     // Initialization code goes here.
   }

   // Named constructor that forwards to the default one.
   Spacecraft.unlaunched(String name) : this(name, null);

   // method
   void describe() {
     print('Spacecraft: $name');
     // Type promotion doesn't work on getters.
     var launchDate = this.launchDate;
     if (launchDate != null) {
       int years = DateTime.now().difference(launchDate).inDays ~/ 365;
       print('Launched: $launchYear ($years years ago)');
     } else {
       print('Unlaunched');
     }
   }
}

var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = Spacecraft.unlaunched('Voyager III');
voyager3.describe();

// Use ?. instead of . to avoid an exception when the leftmost operand is null:
var a = p?.y;

 // In a class, Declare instance variable x, initially null.
 class Happy {
   double? x;
 }

// Instance variables can be final, in which case they must be set exactly once.
class UnHappy {
  final String name;

  UnHappy(this.name); // constructor with sintetic sugar
  UnHappy.unnamed() : name = '';
}

// Constructors
// Declare a constructor by creating a function with the same name as its class
// The most common form of constructor, the generative constructor, creates a new instance of a class

class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }
}
// The pattern of assigning a constructor argument to an instance variable is so common, Dart has syntactic sugar to make it easy:

class Point {
  double x = 0;
  double y = 0;

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(double this.x, this.y);   // but we already know that x is a double 
}

// Use a named constructor to implement multiple constructors for a class or to provide extra clarity:
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;
}

// Remember that constructors are not inherited, which means that a superclass’s named constructor is not inherited by a subclass. 

// constant constructors - If your class produces objects that never change, you can make these objects compile-time constants. 

class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}


// TODO 

// methods .... 
// https://dart.dev/guides/language/language-tour#classes



// Inheritance
// ...
// https://dart.dev/samples