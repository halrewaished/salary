import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: color.Colors.deepGreenColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
                height: 389,
                width: 382,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text('Manage Your Expense', style: textStyle.subtitle2),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /4,
                        child: TextFormField(
                          initialValue: 'Input text',
                          decoration: InputDecoration(
                            labelText: 'Label text',
                            errorText: 'Error message',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.error,
                            ),
                          ),
                        ),
                      )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
