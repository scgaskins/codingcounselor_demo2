import 'package:codingcounselor/main.dart';

// Lessons must be entered in the order that the user
// should complete them

final Map languageData = {
  Languages.Python : pythonLessons,
  Languages.Java : javaLessons
};

final List pythonLessons = [
  pythonBasicSyntaxLesson,
  pythonStringsLesson,
  pythonControlFlowLesson
];

final List javaLessons = [
  javaBasicSyntaxLesson,
  javaLoopsLesson,
  javaArraysLesson
];

enum LessonPart {
  name,
  desc,
  questions,
  videoLink
}

enum QuestionPart {
  question,
  answers,
  correctAnswer
}

//// Python Lessons //////

final Map pythonBasicSyntaxLesson = {LessonPart.name : 'Python Syntax',
  LessonPart.desc : 'An introduction to the basic syntax of python',
  LessonPart.videoLink : Uri.parse('https://www.youtube.com/watch?v=BY4Xc3VygeU'),
  LessonPart.questions : [
    {
      QuestionPart.question : "How are blocks of code set off in python?",
      QuestionPart.answers : [
        'Using <>',
        'Using []',
        'Using {}',
        'With indentation'
      ],
      QuestionPart.correctAnswer : 3
    },
    {
      QuestionPart.question : "How can you find two squared in python",
      QuestionPart.answers : [
        '2^2',
        '2**2',
        '2 exp 2',
        '2 xx 2'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "You don't need to declare the type of a variable when it is created.",
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How do you print a string in python?",
      QuestionPart.answers : [
        'print("Hello world")',
        'print("Hello world");',
        'System.out.print("Hello world")',
        '"Hello world".print'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : 'What syntax is used to assign a variable?',
      QuestionPart.answers : [
        'x => 5',
        'x = 5',
        'x > 5',
        'x < 5'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "Which saves an float to x rather than an integer?",
      QuestionPart.answers : [
        'float x = 4',
        'float x = 4.0',
        'x = 4.0',
        'x = 4'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : 'When you divide two integers, what is the type of the output?',
      QuestionPart.answers : [
        'a float',
        'an integer'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "What happens if you add a float to an integer?",
      QuestionPart.answers : [
        'You get a syntax error',
        'The result is rounded to the nearest integer',
        'The result is a float'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : "How do you make a multi-line comment?",
      QuestionPart.answers : [
        '/* at the start and */ at the end',
        '#* at the start and *# at the end',
        '""" at the start and end',
        '### at the start and end'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : 'How do you start single line comments in python?',
      QuestionPart.answers : [
        '#',
        '//',
        '<',
        'COMMENT: '
      ],
      QuestionPart.correctAnswer : 0
    }
  ]
};

final Map pythonStringsLesson = {LessonPart.name : "Python Strings",
  LessonPart.desc : 'An introduction to strings',
  LessonPart.videoLink : Uri.parse('https://www.youtube.com/watch?v=aRZnM2dWXVM'),
  LessonPart.questions : [
    {
      QuestionPart.question : "What does 'hello'.title() return?",
      QuestionPart.answers : [
        "hello",
        "HeLlO",
        'HELLO',
        "Hello"
      ],
      QuestionPart.correctAnswer : 3
    },
    {
      QuestionPart.question : "Two strings can be joined using 'String1'.join('String2')",
      QuestionPart.answers : [
        "True",
        "False"
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "What does the statement 'hello' * 3 return?",
      QuestionPart.answers : [
        "'hellohellohello",
        "'hhheeellllllooo'",
        "'hello3'",
        "It causes a syntax error"
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "What does the expression 'Hello world'.split(' ') return?",
      QuestionPart.answers : [
        'A new string with a space between each character',
        'The two words as separate strings',
        'A list of the 2 words',
        'A list of the letters in the string'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : 'How do you designate a string a raw string?',
      QuestionPart.answers : [
        'r"String"',
        '"String".raw()',
        'raw("String")',
        r'"\rString"'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How are new lines indicated in a string?",
      QuestionPart.answers : [
        r'\n',
        "{new line}",
        '/n',
        r"\cr"
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How do you create a multi-line string",
      QuestionPart.answers : [
        'Use triple quotes',
        'Use the .new_line() function'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How do escape characters start in python?",
      QuestionPart.answers : [
        "With {ESC}",
        "With a /",
        r"With a \",
        "With a ?"
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : "What does making a string a raw string do?",
      QuestionPart.answers : [
        "Convert the string to ASCII characters",
        "Ignore any escape characters in the string",
        "Covert the characters into binary",
        "Ignore any numbers in the string"
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "Which answer will join the two strings?",
      QuestionPart.answers : [
        "'Hello ' + 'world'",
        "'Hello ' .. 'world'",
        "'Hello ' * 'world'",
        "'Hello ' to 'world'"
      ],
      QuestionPart.correctAnswer : 0
    }
  ]
};

final Map pythonControlFlowLesson = {LessonPart.name : 'Python Control Flow',
  LessonPart.desc : 'An introduction to for loops, while loops, and conditionals.',
  LessonPart.videoLink : Uri.parse('https://www.youtube.com/watch?v=Jh3CU-ZA9IU'),
  LessonPart.questions : [
    {
      QuestionPart.question : 'Which returns whether the two variables are equal?',
      QuestionPart.answers : [
        'a = b',
        'a.equals(b)',
        'a == b',
        'a EQUALS b'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : 'Which keyword stops a loop when it is called?',
      QuestionPart.answers : [
        'stop',
        'end',
        'continue',
        'break'
      ],
      QuestionPart.correctAnswer : 3
    },
    {
      QuestionPart.question : 'What does the keyword continue do in a loop?',
      QuestionPart.answers : [
        'ends the loop',
        'skips to the next iteration of the loop',
        'restarts the loop',
        'causes the loop to continue iterating after a pause'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'What does a for loop do in python?',
      QuestionPart.answers : [
        'iterate over the elements of a sequence',
        'count up to a given number',
        'both of the above'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : 'How do you set off blocks of code, such as the bodies of loops?',
      QuestionPart.answers : [
        'with indentation',
        'with {}',
        'With keywords start and end',
        'With <>'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : 'When does a while loop stop iterating?',
      QuestionPart.answers : [
        'When its condition is true',
        'When its condition is false'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'What is a boolean?',
      QuestionPart.answers : [
        'a data type that is True or False',
        'an expression that checks if something is true',
        'a comparison such as 2 < 5'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : 'What does the != operator do?',
      QuestionPart.answers : [
        'returns whether one value equals another',
        'returns whether or not a value does not equal another',
        'returns whether two strings are the same length',
        'returns whether one value is less than another'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'pass and continue do the same thing.',
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'When is the code in the body of an else statement called?',
      QuestionPart.answers : [
        'After the code in the if statement',
        "If the if statement's condition is untrue",
        'At the end of a for loop'
      ],
      QuestionPart.correctAnswer : 0
    }
  ]
};

//// Java Lessons //////

final Map javaBasicSyntaxLesson = {
  LessonPart.name : "Java Basic Syntax",
  LessonPart.desc : "An introduction to Java",
  LessonPart.videoLink : Uri.parse("https://www.youtube.com/watch?v=hF8F3wm9DUc"),
  LessonPart.questions : [
    {
      QuestionPart.question : "Statements in java end with _?",
      QuestionPart.answers : [
        '.',
        '/',
        ';',
        ':'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : "What is the first thing in a java program executed by the computer?",
      QuestionPart.answers : [
        "the first function",
        "the main class",
        "the main function",
        "the start function"
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : "What method is used to print to the screen?",
      QuestionPart.answers : [
        'System.out.println()',
        'print()',
        'print',
        'fprint()'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "The type of a variable must be declared when it is assigned.",
      QuestionPart.answers : [
        'True',
        'False'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How are blocks of code set, such as classes or methods, set off?",
      QuestionPart.answers : [
        "With {}",
        "By indentation",
        "With keywords",
        "With ()"
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : 'If x = 2, what would System.out.println("x") output?',
      QuestionPart.answers : [
        '2',
        '"2"',
        'x',
        '"x"'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : "Each statement must be on its own line",
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "All java code must be part of a class",
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How would 2 be assigned to the variable x in Java?",
      QuestionPart.answers : [
        'x = 2',
        'int x = 2;',
        'int x <= 2;',
        'x <= 2;'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "What does 2 + x return?",
      QuestionPart.answers : [
        '2x',
        '2 + whatever int is assigned to x',
        "xx"
      ],
      'answer' : 1
    }
  ]
};

final Map javaLoopsLesson = {LessonPart.name : 'Java Loops',
  LessonPart.desc : 'An introduction to for, while, and do loops',
  LessonPart.videoLink : Uri.parse('https://www.youtube.com/watch?v=6djggrlkHY8'),
  LessonPart.questions : [
    {
      QuestionPart.question : 'When does a while loop end?',
      QuestionPart.answers : [
        'When its condition is true',
        'When its condition is false',
        'At the end keyword',
        'After a preset time'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'Which of these increments the variable x by 1?',
      QuestionPart.answers : [
        'x+1;',
        '1+x;',
        'x+;',
        'x++;'
      ],
      QuestionPart.correctAnswer : 3
    },
    {
      QuestionPart.question : 'How do you increment a variable x by 2?',
      QuestionPart.answers : [
        'x+++;',
        'x += 2;',
        'x + 2;',
        'x++;'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'The condition of a while loop is evaluated before or'
          ' after each iteration of the loop?',
      QuestionPart.answers : [
        'before',
        'after'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "What are the three statements of a for loop, in order?",
      QuestionPart.answers : [
        'declare a variable, increment the variable, end condition',
        'end condition, declare a variable, increment the variable',
        'declare a variable, end condition, increment the variable'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : 'The variable in a for loop can only be incremented by 1.',
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "A for loop's variable is incremented before each iteration.",
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : "How is a do while loop different from a while loop?",
      QuestionPart.answers : [
        'It checks the condition after each iteration instead of before',
        'It checks the condition before each iteration instead of after'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How can you decrement a value by 2",
      QuestionPart.answers : [
        'x - 2;',
        'x -= 2;',
        'x--;',
        'x---;'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'How are the statements of a for loop separated?',
      QuestionPart.answers : [
        'a , between each one',
        'a ; between each one',
        'a : between each one',
        'a > between each one'
      ],
      QuestionPart.correctAnswer : 1
    }
  ]
};

final Map javaArraysLesson = {
  LessonPart.name : "Java Arrays",
  LessonPart.desc : "An introduction to arrays",
  LessonPart.videoLink : Uri.parse('https://www.youtube.com/watch?v=7J_W3Mxid0g&list=PLfdtiltiRHWFhVOs5BFPgRgN3ac1n-XWY&index=8'),
  LessonPart.questions : [
    {
      QuestionPart.question : "How do you initialize a size 5 blank String array named strings?",
      QuestionPart.answers : [
        'String[5] strings = new String[];',
        'String [] strings = new String [5];',
        'String[] strings = new String[5];',
        'String[5] strings = new String[5];'
      ],
      QuestionPart.correctAnswer : 2
    },
    {
      QuestionPart.question : 'You can put more than one data type in a given array.',
      QuestionPart.answers : [
        'true',
        'false'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'How do you initialize a non empty array?',
      QuestionPart.answers : [
        'Put values in {} separated by commas',
        'Put values in {} separated by colons',
        'Put values in {} separated by semicolons',
        'Put values in {} separated by periods'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "how do you index the first value in an array called array?",
      QuestionPart.answers : [
        'array[0]',
        'array[1]'
      ],
      QuestionPart.correctAnswer : 0
    },
    {
      QuestionPart.question : "How would you reassign the value at the 4th spot of the array ints?",
      QuestionPart.answers : [
        'ints[4] = 4;',
        'ints[4][4];',
        'ints[3][4];',
        'ints[3] = 4;'
      ],
      QuestionPart.correctAnswer : 3
    },
    {
      QuestionPart.question : "How do you access the length of the array ints?",
      QuestionPart.answers : [
        'ints.len',
        'ints.length()',
        'len(ints)',
        'ints.length'
      ],
      QuestionPart.correctAnswer : 3
    },
    {
      QuestionPart.question : "When you access the length of the array,"
          " do you get the last index or the number of items in the array?",
      QuestionPart.answers : [
        'last index',
        'number of items'
      ],
      QuestionPart.correctAnswer : 1
    },
    {
      QuestionPart.question : 'What will happen if you index spot 5 in an array of size 5?',
      QuestionPart.answers : [
        'an out of bounds error',
        'you get the last item in the array',
        'You get the first item in the array'
      ],
      QuestionPart.correctAnswer : 0
    }
  ]
};
