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
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle:  Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        backgroundColor: CupertinoColors.systemGrey3,
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child : Center(
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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
             CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter amount in USD",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(
                    Icons.monetization_on_outlined,
                  ),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
              ),
              //sizedbox only have the width and height property
              const SizedBox(height: 15),

              /// they are two types of button elevated and text button in flutter
              /// elevatedbuttton has shadow while textbutton does not
              ElevatedButton(
                onPressed: () {
                  convert(); // types on mode debug, release, profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
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
