import 'package:flutter/material.dart';

//! 1. create a variable that stores the converted currency value
//! 2. create a function that multiplys the value given in the text fieild by the exchange rate
//! 3. store the value in the variable that we created
//! 4. display the variable

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  void convert() {
    setState(
      () {
        result = double.parse(textEditingController.text) * 767.45;
      },
    );
  }
  // this id used to prevent memory leak
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

// note only use the build function for designing the app do not put any heavy load in the build function
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

    //
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // to convert from int to string you use the value.toString method
              // to convert from string to int or double uses datatype.parse() method
              Text(
                "₦ ${ result != 0 ? result.toStringAsFixed(2):  result.toStringAsFixed(0) } ", //! this is an if else statement, // .toStringAsFixed(2) method is used to indicate the maximun number of after the decimal dot 
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
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

class CurrencyConverterMaterialPagee extends StatelessWidget {
  const CurrencyConverterMaterialPagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
