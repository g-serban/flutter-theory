import 'dart:math';

void main() {
  variables();
  math();
  conditionals();
  strings();
  lists();
  loops();
  map();
}

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

void map() {
  // a map is a collection of key-value pairs (dictionary in Py)
}
