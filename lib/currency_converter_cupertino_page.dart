import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
    setState(
      () {
        result = double.parse(textEditingController.text) * 767.45;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        backgroundColor: CupertinoColors.systemGrey3,
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // to convert from int to string you use the value.toString method
              // to convert from string to int or double uses datatype.parse() method
              Text(
                "₦ ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} ", //! this is an if else statement, // .toStringAsFixed(2) method is used to indicate the maximun number of after the decimal dot
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 60),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: CupertinoColors.white,
                ),
                placeholder: "Please enter the amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar_circle),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
              ),
              //sizedbox only have the width and height property
              const SizedBox(height: 15),

              /// they are two types of button elevated and text button in flutter
              /// elevatedbuttton has shadow while textbutton does not
              CupertinoButton(
                onPressed: () {
                  convert(); // types on mode debug, release, profile
                },
                color: CupertinoColors.black,
                child: const Text(
                  "Convert",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
