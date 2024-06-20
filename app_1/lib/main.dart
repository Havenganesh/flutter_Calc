import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Claculator',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 180, 233)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Claculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  bool _symbol = false;
  bool _dotted = false;
  void _parsing() {
    if (_controller.text.isNotEmpty) {
      String expression = _controller.text;
      expression = expression.replaceAll('x', '*');
      expression = expression.replaceAll('÷', '/');

      Expression? exp = Expression.tryParse(expression);
      ExpressionEvaluator evaluator = const ExpressionEvaluator();
      if (exp != null) {
        dynamic val = evaluator.eval(exp, {});
        _controller.text = val.toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 260,
              height: 40,
              child: TextField(
                enabled: false,
                controller: _controller,
                textAlign: TextAlign.right,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 188,
                      child: FloatingActionButton(
                          onPressed: () {
                            _dotted = false;
                            _controller.text = '';
                          },
                          tooltip: 'Reset',
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          _controller.text = _controller.text
                              .substring(0, _controller.text.length - 1);
                        }
                      },
                      tooltip: 'delete',
                      child: const Icon(Icons.delete),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                        onPressed: () {
                          if (_symbol) {
                            _dotted = false;
                          }
                          _symbol = false;
                          _controller.text += '7';
                        },
                        tooltip: '7',
                        child: const Text(
                          '7',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_symbol) {
                          _dotted = false;
                        }
                        _symbol = false;
                        _controller.text += '8';
                      },
                      tooltip: '8',
                      child: const Text(
                        '8',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_symbol) {
                          _dotted = false;
                        }
                        _symbol = false;
                        _controller.text += '9';
                      },
                      tooltip: '9',
                      child: const Text(
                        '9',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (!_symbol) {
                          if (_controller.text.isNotEmpty) {
                            String lastLetter = _controller.text
                                .substring(_controller.text.length - 1);
                            if (lastLetter != ".") {
                              _symbol = true;
                              _controller.text += '÷';
                            }
                          }
                        }
                      },
                      tooltip: '÷',
                      child: const Text(
                        '÷',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                        onPressed: () {
                          if (_symbol) {
                            _dotted = false;
                          }
                          _symbol = false;
                          _controller.text += '4';
                        },
                        tooltip: '4',
                        child: const Text(
                          '4',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_symbol) {
                          _dotted = false;
                        }
                        _symbol = false;
                        _controller.text += '5';
                      },
                      tooltip: '5',
                      child: const Text(
                        '5',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_symbol) {
                          _dotted = false;
                        }
                        _symbol = false;
                        _controller.text += '6';
                      },
                      tooltip: '6',
                      child: const Text(
                        '6',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (!_symbol) {
                          if (_controller.text.isNotEmpty) {
                            String lastLetter = _controller.text
                                .substring(_controller.text.length - 1);
                            if (lastLetter != ".") {
                              _symbol = true;
                              _controller.text += 'x';
                            }
                          }
                        }
                      },
                      tooltip: 'x',
                      child: const Text(
                        'x',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                        onPressed: () {
                          if (_symbol) {
                            _dotted = false;
                          }
                          _symbol = false;
                          _controller.text += '1';
                        },
                        tooltip: '1',
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_symbol) {
                          _dotted = false;
                        }
                        _symbol = false;
                        _controller.text += '2';
                      },
                      tooltip: '2',
                      child: const Text(
                        '2',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_symbol) {
                          _dotted = false;
                        }
                        _symbol = false;
                        _controller.text += '3';
                      },
                      tooltip: '3',
                      child: const Text(
                        '3',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (!_symbol) {
                          if (_controller.text.isNotEmpty) {
                            String lastLetter = _controller.text
                                .substring(_controller.text.length - 1);
                            if (lastLetter != ".") {
                              _symbol = true;
                              _controller.text += '-';
                            }
                          }
                        }
                      },
                      tooltip: '-',
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                        onPressed: () {
                          if (_symbol) {
                            _dotted = false;
                          }
                          _symbol = false;
                          _controller.text += '0';
                        },
                        tooltip: '0',
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (!_dotted) {
                          if (!_symbol) {
                            if (_controller.text.isNotEmpty) {
                              _dotted = true;
                              _controller.text += '.';
                            }
                          }
                        }
                      },
                      tooltip: '.',
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: _parsing,
                      tooltip: '=',
                      child: const Text(
                        '=',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (!_symbol) {
                          if (_controller.text.isNotEmpty) {
                            String lastLetter = _controller.text
                                .substring(_controller.text.length - 1);
                            if (lastLetter != ".") {
                              _symbol = true;
                              _controller.text += '+';
                            }
                          }
                        }
                      },
                      tooltip: '+',
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
