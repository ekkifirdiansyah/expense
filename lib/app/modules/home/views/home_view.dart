import 'package:expense/app/constant/color.dart';
import 'package:expense/app/modules/widgets/info_balance.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/home_controller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2020), 35),
      SalesData(DateTime(2021), 28),
      SalesData(DateTime(2022), 34),
      SalesData(DateTime(2023), 32),
      SalesData(DateTime(2024), 40)
    ];
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                appYellowSoft,
                appPrimary.withOpacity(0.2),
              ]))),
          //Page View
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(),
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: appPrimary,
                          ),
                          Text("October"),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active,
                          color: appPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text("Account Balance"),
                SizedBox(height: 10),
                Text(
                  "\$9400",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoBalance(isIncome: true, balance: "5000"),
                    InfoBalance(isIncome: false, balance: "1200"),
                  ],
                ),
                SizedBox(height: 20),
                // Bisa Discroll
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Spend Frequency",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 200,
                        child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(),
                          series: <CartesianSeries>[
                            // Renders line chart
                            LineSeries<SalesData, DateTime>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales)
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: appYellowSoft,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "Today",
                              style: TextStyle(
                                color: appYellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Week",
                            style: TextStyle(
                              color: appTextSoft,
                            ),
                          ),
                          Text(
                            "Month",
                            style: TextStyle(
                              color: appTextSoft,
                            ),
                          ),
                          Text(
                            "Year",
                            style: TextStyle(
                              color: appTextSoft,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transaction",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: appVioletSoft,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: appPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    color: appYellowSoft,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset("assets/icons/bag.png"),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Shopping",
                                            style: TextStyle(
                                              color: appText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "-\$120",
                                            style: TextStyle(
                                              color: appRed,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Buy some grocery",
                                            style: TextStyle(
                                              color: appTextSoft,
                                            ),
                                          ),
                                          Text(
                                            "10:00 AM",
                                            style: TextStyle(
                                              color: appTextSoft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: appWhite,
        color: appPrimary,
        activeColor: appPrimary,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Transaction'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Budget'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
