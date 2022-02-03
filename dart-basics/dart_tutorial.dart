import 'dart:math';

// usage of ?, because I forget and get confused afterwards
// int? get launchYear => launchDate?.year;    --> getter
// int? LaunchYear -> variables can't be null unless you declare them as a null type
// =>  -> a shorthand => (arrow) syntax is handy for functions that contain a single statement.
// launchDate?.year -> Use ?. instead of . to avoid an exception when the leftmost operand is null:
// var canVote = (age >= 18) ? true : false;  -> ternary operator, if () then true or false

void main() {
  variables();
  math();
  strings();

  lists();
  sets();
  maps();
  enumeratedTypes();

  conditionals();
  loops();

  // functions
  print(getSum(3, 4));
  print(getSum2(3));
  print(getSum2(3, n2: 4));
  print(getSum3(3, 4));
  print('Sum = ${getSum4([1, 2, 3])}');
  next2(4).forEach((val) => print(val));
  print('3 * 5 = ${multBy(3)(5)}');
  bool Function(int) isEven = (int x) => x % 2 == 0;
  print('Is 202 an even number? : ${isEven(202)}');
  print(fibonacci(4));
  typeDef();

  // classes
  Shape sq1 = new Shape();
  Shape sq2 = new Shape.fromLength(3.0);
  Shape sq3 = new Shape.fromWH(3.0, 4.0);
  print('Square 3 Area: ${sq3.area()}');
  print('Shape height ${sq2.shapeHeight}');
  print('Shape 1 width ${sq1.shapeWidth} & shape 3 width ${sq1.shapeWidth}');

  Circle c1 = new Circle.fromLength(4.0);
  print('Circle area : ${c1.area()}');

  // interfaces
  Print p1 = new Print();
  p1.printInkJet();
  p1.printLaser();

  // exception handling
  exceptionHandling();
}


// variables -------------------------------------------------------------------
void variables() {
  print('hello, world');

  var name = 'Derek'; // dynamic variable
  String name2 = 'Derek'; // explicit variable

  dynamic anything = 20; // create dynamic variables that you can re-asign
  anything = 'String'; // different types to it

  late int var1; // variable that it's being initialized
  // but to be used at a later date

  int age = 45;
  double money = 100.23;

  bool canVote = false;

  print('Is boolean ${canVote is bool}'); // string interpolation

  // variables can't be null unless you declare them as a null type
  int? imNull;
  print('${imNull}');

  // define a constant
  final Pi = 3.14;
  const Pii = 3.14;

  // converting variables
  String sNum = '45';
  int iNum = int.parse(sNum);
  sNum = iNum.toString();
  double? dNum = double.parse(sNum);
  print('${dNum is double}'); // true
  double? dNum2 = double.tryParse('1.2a');
  print('${dNum2 is Null}'); // true
}

// math ------------------------------------------------------------------------
void math() {
  print('5 + 4 = ${5 + 4}');
  print('5 - 4 = ${5 - 4}');
  print('5 * 4 = ${5 * 4}');
  print('5 / 4 = ${5 / 4}');
  print('5 ~/ 4 = ${5 ~/ 4}'); // integer division
  print('5 % 4 = ${5 % 4}'); // modulus

  var n = 5;
  print('n++ = ${n++}'); // 5
  print('++n = ${++n}'); // 7
  // When ++ is used as prefix(like: ++i), ++i will increment the value of i and then return it but,
  //if ++ is used as postfix(like: i++), operator will return the value of operand first and then only increment it.

  // there are a bunch of math methods to try, see online

  Random r1 = new Random();
  print('Random: ${r1.nextInt(100)}'); // a value up to 100
  print('e: ${e}'); // built-in: value of e
  print('Pi: ${pi}'); // built-in: value of pi
}

// strings ---------------------------------------------------------------------
void strings() {
  var age = 45;
  var s1 = 'I am ${age}';

  var s2 = ''' I
  am 
  multiline''';

  print(s1[0]); // -> I
  print(s1.indexOf('am'));

  var s3 = ' and I like cats';
  var s4 = s1 + s3; // I am 45 and I like cats

  print('Is s4 empty : ${s4.isEmpty}');
  print('Is s4 not empty : ${s4.isNotEmpty}');
  print('Length : ${s4.length}');

  // escape characters
  //  \n   newline
  //  \t   tab
  //  \"   escape "
  //  \'   escape '
  //  \\   escape backlashes
  print('I\nam\t\tmultiline');
  print(r'\t\n'); // -> raw string, escape ch's are ignored
  print('${s4.toUpperCase()}');
  print('${s4.toLowerCase()}');

  print('I am here'.contains('am'));
  print('I am here'.startsWith('I'));
  print('I am here'.endsWith('here'));

  print(s4.substring(14, 18)); // shows letters from index 13 to 17
  var s5 = 'To know or not to know';
  var s6 = s5.replaceAll(RegExp('know'), 'be'); // RegExp = regular expression
  print(s6);

  var as4 = s4.split(' ');
  print(as4);

  print('   stuff   '.trim()); // remove whitespace

  // string buffer - when you make regular changes to a string use a string buffer
  var buf = StringBuffer();
  for (var i = 0; i < 9; ++i) {
    buf.write('$i');
  }
  print(buf.toString());
  buf.write(9);
  buf.writeAll([10, 11, 12]);
  print(buf.length);
}

// lists -----------------------------------------------------------------------
void lists() {
  // we define that the list is going to only contain strings
  List<String> l2 = ['b', 'a', 'd'];
  var l1 = <String>[];
  var l3 = [123, 'main', bool];
  print('index 1: ${l3[1]}');

  var l4 = List<int>.filled(3, 0, growable: true);
  l2.add('C');
  l2.addAll(['D', 'F']);
  print('length: ${l2.length}');
  print('MAIN: ${l3.contains('main')}');

  // compare each value until all have been sorted
  l2.sort((a, b) => a.compareTo(b));
  // A shorthand => (arrow) syntax is handy for functions that contain a single statement.
  //This syntax is especially useful when passing anonymous functions as arguments
  for (var val in l2) {
    print(val);
  }

  var fIndex = l2.indexOf('F');
  l2.removeAt(fIndex);
  l2.clear();

  Random r2 = new Random();
  var l5 = List<int>.generate(5, (int index) => r2.nextInt(100));
  for (var i in l5) {
    print(i);
  }

  print('1st value : ${l5.first}');
  print('last value : ${l5.last}');

  // create an iterable with a range of different values
  Iterable<int> i1 = l5.getRange(0, 2);
  for (var i in i1) {
    print(i);
  }

  List<String> list2 = ['sg', 'gs', 'ds', 'bds'];
  Iterable<String> i2 = list2.getRange(0, 2);
  for (var i in i2) {
    print(i);
  }

  // convert list into a string
  var s7 = l5.join(' ');
  print(s7);
}


// sets ------------------------------------------------------------------------
void sets() {
  // set = collection of objects, they must be unique (similar to a list)
  Set set1 = new Set();
  set1.add(10);
  set1.add(11);
  set1.add(12);
  set1.add(13);
  Set set2 = new Set.from([1, 2, 3]);

  for (var x in set2) {
    print(x);
  }
}

// maps ------------------------------------------------------------------------
void maps() {
  // a map is a collection of key-value pairs (dictionary in Py)
  Map<String, int> m1 = new Map<String, int>();
  var heroes = {'Superman': 'Clark', 'Batman': 'Bruce Wayne'};

  heroes['Flash'] = 'Barry Allen';

  print('Empty: ${heroes.isEmpty}');
  print('Empty: ${heroes.length}');

  heroes.keys.forEach((key) => print(key));
  heroes.values.forEach((val) => print(val));

  heroes.addAll({'Majestic Man': 'Lex Luther', 'Loki': 'Loki'});
  heroes.remove('Majestic Man');
  heroes.clear();
  print('Empty: ${heroes.isEmpty}');
}


// enumerate -------------------------------------------------------------------
enum Day { Mon, Tue, Wed, Thr, Fri }

void enumeratedTypes() {
  // contain list of constants with an index
  // have to define it outside of main
  // we can guarantee we will only receive one of the specified options
  // elimante very often if statements and other conditionals

  Day favDay = Day.Fri;

  print('Value = ${favDay}');
  print('Index : ${favDay.index}');
}

// conditionals ----------------------------------------------------------------
void conditionals() {
  // conditional operators  ==  != < > >= <=
  // kigucak operators  ! not  && and   || or
  var age = 8;
  if (age < 5) {
    print('home!');
  } else if ((age >= 5) && (age <= 6)) {
    print('kindergarten');
  } else if ((age > 6) && (age <= 17)) {
    print('Grade: ${age - 5}');
  } else {
    print('college');
  }

  // basically switch (if) ingredient == smth (case), do that, if not, proceed
  var ingredient = 'tomatoes';
  switch (ingredient) {
    case 'tomatoes': // or
    case 'pasta':
      print('spaghetti');
      break; // exit conditional and continue
    case 'beans':
      print('burritos');
      break;
    default: // if no case is meet
      print('water');
  }

  // ternary operator
  var canVote = (age >= 18) ? true : false;
  print('can vote? -> ${canVote}');
  // the value of canVote is going to depend upon the age
  // if the age equals or greater than 18 is true, then assign the value of true to this variable, if not, false
  var michael;
  String michaelGender = 'masculin';
  michael = (michaelGender == 'masculin') ? 'man' : 'woman';
  print('Michael is a ${michael}');
}

// loops -----------------------------------------------------------------------
void loops() {
  Random r1 = new Random();
  var l1 = List<int>.generate(5, (int index) => r1.nextInt(100));
  print('ok');

  for (var i = 0; i < 5; i++) {
    print(l1[i]);
  }

  // if you don't care about the index, use forEach
  l1.forEach((val) => print(val * 20));

  // for item in something
  var str1 = 'Bob Sue Tom';
  print(str1.split(' '));
  for (var person in str1.split(' ')) {
    print(person);
  }

  // while: you mainly use while loops when you don't know how many times you want to execute your code
  var i2 = 1;
  while (i2 < 10) {
    if (i2 % 2 == 0) {
      i2 += 1;
      continue;
    } else if (i2 == 7) {
      break;
    }
    print(i2); // 1, 3, 5
    i2 += 1;
  }

  // do while loop: use anytime you want to execute at least once through your code
  Random r2 = new Random();
  var lucky = r2.nextInt(10);
  var guess = -1;
  do {
    guess += 1;
    print('guess: ${guess}');
  } while (lucky != guess);
  // so we're looping until the condition isn't meet
  print('lucky is : ${lucky}');
}

// runes -----------------------------------------------------------------------
void runes() {
  // unicode
  var rune = '\u{0031}'; // -> number 1

  String uc1 = 'Strange';
  print(uc1.codeUnits);
}


// functions -------------------------------------------------------------------

// the type declaring at the beg of the fct is what is expected from the fct to return
// e.g. int getSum(), Function smth(), void halelujah() etc.

int getSum(n1, n2) {
  return n1 + n2;
}

// you can specify the parameter type as well
int getZsum(int n1, int n2) {
  return n1 + n2;
}

// you can give the parameters a default value (that you can't change when calling the function)
// you can only change the default value when calling the function by saying:
// getSum2(3, n2:6) -> otherwise it only takes the default value
int getSum2(n1, {n2: 0}) {
  return n1 + n2;
}

// we can simplify the function using =>
int getSum3(n1, n2) => n1 + n2;

// functions with lists
// pass a list of values to the function
int getSum4(List vals) {
  return vals.reduce((a, b) => a + b);
}

// return multitude values
List next2(n1) {
  return [n1 + 1, n1 + 2];
}

// function that returns a custom function
// this is going to create a custom multiplying function
Function multBy(int n1) {
  int innerFunc(int x) {
    return x * n1;
  }

  return innerFunc;
}
// print('3 * 5 = ${multBy(3)(5)}); -> 3 * 5 = 15

// anonymous functions
bool Function(int) isEven = (int x) => x % 2 == 0;
// you have an anonymous function that returns a boolean value that expects an
// int argument

// recursive function - function that calls itself
int fibonacci(int n1) {
  if (n1 <= 1) {
    return 1;
  } else {
    return fibonacci(n1 - 1) + fibonacci(n1 - 2);
  }
}
// fib(4) -> fib(3) + fib(2) -> [3+2]
// fib(3) -> fib(2) + fib(1) -> [2+1]
// fib(2) -> 1 + 1 -> [2]
// fib(1) -> 1 -> [1]

// type definitions ----------
// it is used to reference a function by defining a signature ( the way the function
// is going to work with specific parameters), & we want functions to match
// you can assign them to a specific type definition
// * basically a function with typedef can only have as many params as the declared typedef

typedef DoMath(int n, int n2);

add(int n, int n2) {
  print('${n} + ${n2} = ${n + n2}');
}

sub(int n, int n2) {
  print('${n} - ${n2} = ${n - n2}');
}

mult(int n, int n2, int n3) {
  print('${n} * ${n2} * ${n3} = ${n * n2 * n3}');
}

void typeDef() {
  DoMath mFunc = add;
  mFunc(5, 4);
  mFunc = sub;
  mFunc(5, 4);
  // mFunc = mult; -> A value of type 'dynamic Function(int, int, int)' can't be assigned to a variable of type 'dynamic Function(int, int)'
  // mFunc(5, 4, 3);  -> Too many positional arguments: 2 expected, but 3 found.
}

// classes ---------------------------------------------------------------------
// class = blueprint for creating objects (through instantation)

class Shape {
  double height = 0;
  double width = 0;
  String unit = 'cms';
  static int numShapes = 0;
  // The static keyword is used for a class-level variable and method that is the same for every instance of a class,
  // this means if a data member is static, it can be accessed without creating an object.

  // constructor
  Shape() {
    this.height = 0;
    // this -> is a way for us to refer to the object that we don't have a name for
    this.width = 0;
    Shape
        .numShapes++; // increment it; and we have to refer to the class itself because numShapes is static
  }
  // we use named constructors when we want to set the value for e.g. shapes whenever we create them
  // let's say we receive a length
  Shape.fromLength(double length) {
    this.height = length;
    this.width = length;
    Shape.numShapes++;
  }
  // now we receive a hight and length
  Shape.fromWH(double height, double width) {
    this.height = height;
    this.width = width;
    Shape.numShapes++;
  }

  // Getters -> return data in a descriptive way
  String get shapeHeight {
    return height.toString() + ' ' + unit;
  }

  String get shapeWidth {
    return width.toString() + ' ' + unit;
  }

  // Setter -> use it to protect the data
  // e.g. check if a string is a number
  // anytime you have smth that doesn't directly apply to an obj prob means that it should be static. e.g.:
  static isNumber(String s) {
    return double.tryParse(s) != null; // tryParse throws null if invalid
  }

  void set shapeHeight(String h) {
    if (Shape.isNumber(h)) {
      this.height = double.parse(h);
    }
  }

  void set shapeWidth(String w) {
    if (isNumber(w)) {
      this.width = double.parse(w);
    }
  }

  double area() {
    return width * height;
  }
}

// inheritance -----------------------------------------------------------------

class Circle extends Shape {
  // let's say we want to have a different logic for the area method for our circle than the one inherited from parent class
  @override
  double area() {
    if (this.width != 0) {
      return pi * pow(this.width / 2, 2); // 2, 2 = to the power of 2
    } else if (this.height != 0) {
      return pi * pow(this.height / 2, 2);
    } else {
      return 0;
    }
  }

  // super.area();   --> would go and execute the super version (Shape version) of area

  // super class constructor to set everything
  Circle() : super();
  Circle.fromLength(double l) : super.fromLength(l);
  // this calls the super (Shape version) of our constructor and gets all the benefits
  Circle.fromWH(double h, double w) : super.fromWH(h, w);
}

// interfaces ------------------------------------------------------------------
// you can only extend only one class
// but you can implement multiple different interfaces
// interface = ~contract, if you implement it, you must implement all defined functions in the interface

class PrintLaser {
  void printLaser() {
    print('ola amigos');
  }
}

class PrintInkJet {
  void printInkJet() {
    print('hello world');
  }
}

class Print implements PrintLaser, PrintInkJet {
  void printLaser() {
    print('finish');
  }

  void printInkJet() {}
}

// print1.printLaser() --> finish  not  ola amigos

// exception handling ----------------------------------------------------------

// create our own exception
void checkAge(int a) {
  if (a < 1) {
    throw FormatException;
  }
}

void exceptionHandling() {
  var eNum = 7;
  try {
    print('Zero Divide = ${eNum / 0}');
  } catch (e) {
    print(e);
  } finally {
    print('Finally always executes');
  }

  try {
    int a1 = 0;
    checkAge(a1);
  } catch (e) {
    print('The exception is ${e}');
  }

  // instead of catch e, you can search for it like this
  // on IntegerDivisionByZeroException catch (e);
}
