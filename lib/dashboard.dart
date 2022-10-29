import 'package:expense_project/home.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Charts/linechart.dart';
import 'Charts/barchart.dart';
import 'colors.dart' as color;

var items = [1, 2, 3, 4];

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(labelColor: Colors.black, tabs: [
          Tab(
            text: "Expenses",
          ),
          Tab(
            text: "Savings",
          ),
        ]),
      ),
      body: TabBarView(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 40,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)))),
                    onPressed: null,
                    child: Text("Day")),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)))),
                    onPressed: null,
                    child: Text("Week")),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)))),
                    onPressed: null,
                    child: Text("Month")),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 313,
              width: 383,
              child: Card(
                child: LineChart(mainData()),
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Most Spend",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(items[index].toString()),
                        ),
                      )
                    ],
                  );
                }),
                itemCount: items.length,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Total Savings",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 113,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "122K",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 88),
                    SizedBox(
                      width: 194,
                      child: BarChart(
                        bar(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 57),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  "Your savings During the year",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(items[index].toString()),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color.Colors.deepGreenColor,
        onPressed: () {
          //code to execute on button press
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: color.Colors.greenColor,
        unselectedItemColor: color.Colors.disableColor,
        showUnselectedLabels: true,
        onTap: ((value) {
          switch (value) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
              break;
          }
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
        ],
      ),
    );
  }
}
