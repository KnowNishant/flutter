import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertino extends StatefulWidget {
  const CurrencyConverterCupertino({super.key});

  @override
  State<CurrencyConverterCupertino> createState() =>_CurrencyConverterCupertino();
      
}

class _CurrencyConverterCupertino extends State<CurrencyConverterCupertino> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final borderprop = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(15),
    );
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(255, 133, 174, 245),
        middle: Text(
          "Currency Converter",
          style: TextStyle(color: CupertinoColors.white, fontSize: 25),
        ),
        
      ),
      backgroundColor: const Color.fromARGB(255, 133, 174, 245),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(234, 255, 255, 255)),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: CupertinoTextField(
                controller: textEditingController,
                style: TextStyle(color: const Color.fromARGB(255, 32, 32, 32)),
                decoration: BoxDecoration(
                  hintText: "Please Enter The Amount in USD",
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 32, 32, 32)),
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: const Color.fromARGB(255, 32, 32, 32),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: borderprop,
                  enabledBorder: borderprop,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = (double.parse(textEditingController.text) * 86);
                  });
                  debugPrint("clicked");
                },
                style: TextButton.styleFrom(
                  elevation: 20,
                  backgroundColor: const Color.fromARGB(255, 32, 32, 32),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 15),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Convert"),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}
