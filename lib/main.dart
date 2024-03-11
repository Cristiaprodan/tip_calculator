import "package:flutter/material.dart";
import "package:tip_calculator/widgets/person_counter.dart";
import "package:tip_calculator/widgets/tip_slider.dart";
import "package:tip_calculator/widgets/bill_amount.dart";
import "package:tip_calculator/widgets/total_per_person.dart";

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

  double _tipPercentege = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return ((_billTotal * _tipPercentege) + (_billTotal)) / _personCount;
  }

  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount = _personCount - 1;
      }
    });
  }

  double totalTip() {
    return ((_billTotal * _tipPercentege));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();

    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(theme: theme, style: style, total: total),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    onChanged: (value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                      // print("Amount is:$value");
                    },
                    billAmount: _billTotal.toString(),
                  ),
                  //Split bill Area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onIncrement: increment,
                    onDecrement: decrement,
                  ),
                  //Tip == Section==
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tip",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        "$totalT",
                        style: theme.textTheme.titleMedium,
                      )
                    ],
                  ),
                  //== Slider text ==
                  Text("${(_tipPercentege * 100).round()}%"),
                  // == Slider ==
                  TipSlider(
                    tipPercentege: _tipPercentege,
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentege = value;
                      });
                    },
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
