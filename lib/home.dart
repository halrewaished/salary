import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;
import 'package:expense_project/models/transaction.dart';

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  String name;
  String income;
  HomePage({Key? key ,required this.name, required this.income}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.Colors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: color.Colors.deepGreenColor,

        onPressed: () {
          //code to execute on button press
        },
        child: Icon(Icons.add,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: color.Colors.greenColor,
             unselectedItemColor: color.Colors.disableColor,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Chart'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [
              TopSection(
                  name: widget.name, income: widget.income,
              ),
              // ContactSection(),
              SizedBox(
                height: 30,
              ),
              // ActionSection(),
              SizedBox(
                height: 30,
              ),
              TransactionSection()
            ],
          ),
        ),
      ),
    );
  }

}



class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: textStyle.bodyText1,
              ),
              Text(
                'See all',
                style: textStyle.subtitle2,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 345,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: transactions().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                             color: transactions()[index].color.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child:
                          Icon(
                            transactions()[index].iconData, color: transactions()[index].color, size: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                                     Text(transactions()[index].title, style: textStyle.bodyText1,),
                                                     Text(transactions()[index].date, style: textStyle.subtitle1,),
                            ],
                          ),
                        ),
                                        Text(transactions()[index].amount, style: textStyle.bodyText2,),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  String name;
  String income;

  TopSection({Key? key, required this.name, required this.income}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          color: color.Colors.backgroundColor,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 340,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topCenter,
          height: 240,
          width: 414,
          decoration: BoxDecoration(
              color: color.Colors.greenColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
                width: 120,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('Good Morning', style: textStyle.headline1),
                  ),
                  Image.asset(
                    'assets/images/bell.png',
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('$name', style: textStyle.headline1),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 120,
          left: 10,
          width: 400,
          height: 180,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: color.Colors.deepGreenColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Balance',
                            style: textStyle.headline1,
                          ),
                          Text(
                            '$income',
                            style: textStyle.headline4,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Expenses',
                            style: textStyle.headline1,
                          ),
                          Text(
                            '\$284.00',
                            style: textStyle.headline4,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Saving',
                            style: textStyle.headline1,
                          ),
                          Text(
                            "\$10%",
                            style: textStyle.headline4,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
