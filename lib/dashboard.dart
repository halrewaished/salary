import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Charts/linechart.dart';
import 'Charts/barchart.dart';

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
                  height: 146,
                  width: 99,
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
                  width: 62,
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
                  width: 62,
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
                  width: 62,
                ),
              ],
            ),
            SizedBox(
              height: 313,
              width: 382,
              child: Card(
                child: LineChart(mainData()),
              ),
            ),
            SizedBox(
              height: 86,
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
                      height: 194,
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
    );
  }
}
