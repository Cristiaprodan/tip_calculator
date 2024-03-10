import "package:flutter/material.dart";
import "package:tip_calculator/widgets/person_counter.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tip Calculator",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 142, 208)),
        useMaterial3: true,
      ),
      home: const Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {
  int _personCount = 1;

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    setState(() {
      _personCount = _personCount - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text('Total per Person', style: style),
                  Text(
                    '\$23.99',
                    style: style.copyWith(
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: "Bill Amount"),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {},
                  ),
                  //Split bill Area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onIncrement: increment,
                    onDecrement: decrement,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
