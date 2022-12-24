import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';


class Comptabilite extends StatefulWidget {
  @override
  _ComptabiliteState createState() => _ComptabiliteState();
}

class _ComptabiliteState extends State<Comptabilite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
              child: Scaffold(appBar: AppBar(  
         bottom: TabBar(
              indicatorColor: Colors.yellow,
              tabs: <Widget>[
                Tab(text: "Cette Semaine"),
                Tab(text: "Les Mois"),
                Tab(text: "Les Années")
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Week(context) ,
              Mounth(context),
              Year(context),
            ],
          ),
        ),
      ),
     
    );
  }
}


Widget Week(BuildContext context) {
  final fromDate = DateTime(2021, 05, 19);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  return Column(
    children: [
      Divider(),
      Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 5, 8, 10),
          
          child: Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: BezierChart(
              
              fromDate: fromDate,
              bezierChartScale: BezierChartScale.WEEKLY,
              toDate: toDate,
              selectedDate: toDate,
              series: [
                BezierLine(
                  label: "Duty",
                  onMissingValue: (dateTime) {
                    if (dateTime.day.isEven) {
                      return 10.0;
                    }
                    return 5.0;
                  },
                  data: [
                    DataPoint<DateTime>(value: 10, xAxis: date1),
                    DataPoint<DateTime>(value: 50, xAxis: date2),
                  ],
                ),
              ],
              config: BezierChartConfig(
                verticalIndicatorStrokeWidth: 3.0,
                verticalIndicatorColor: Colors.white,
                showVerticalIndicator: true,
                verticalIndicatorFixedPosition: false,
                backgroundColor: Colors.amber,
                footerHeight: 30.0,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}


Widget Mounth(BuildContext context) {
  final fromDate = DateTime(2020, 09, 18);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 35));
  final date4 = DateTime.now().subtract(Duration(days: 36));

  final date5 = DateTime.now().subtract(Duration(days: 65));
  final date6 = DateTime.now().subtract(Duration(days: 64));
  final da5el = [
                        DataPoint<DateTime>(value: 35000, xAxis: date1),
                        DataPoint<DateTime>(value: 12300, xAxis: date2),
                        DataPoint<DateTime>(value: 20000, xAxis: date3),
                        DataPoint<DateTime>(value: 8000, xAxis: date4),
                        DataPoint<DateTime>(value: 10214, xAxis: date5),
                        DataPoint<DateTime>(value: 30000, xAxis: date6),
                      ];
  final wa5e8 = [
                        DataPoint<DateTime>(value: 11000, xAxis: date1),
                        DataPoint<DateTime>(value: 52000, xAxis: date2),
                        DataPoint<DateTime>(value: 20000, xAxis: date3),
                        DataPoint<DateTime>(value: 80000, xAxis: date4),
                        DataPoint<DateTime>(value: 10040, xAxis: date5),
                        DataPoint<DateTime>(value: 30000, xAxis: date6),
                      ];

  return Column(
    children: [
      Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 50, 8, 10),
          
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: BezierChart(
                  bezierChartScale: BezierChartScale.MONTHLY,
                  fromDate: fromDate,
                  toDate: toDate,
                  selectedDate: toDate,
                  series: [
                    BezierLine(
                      label: "Da5el",
                      lineColor: Colors.blue[400],
                      onMissingValue: (dateTime) {
                        if (dateTime.month.isEven) {
                          return 10.0;
                        }
                        return 5.0;
                      },
                      data: da5el
                    ),
                    BezierLine(
                      label: "wa5e8",
                      lineColor: Colors.red[400],
                      onMissingValue: (dateTime) {
                        if (dateTime.month.isEven) {
                          return 5;
                        }
                        return 10;
                      },
                      data: wa5e8
                    ),
                  ],
                  config: BezierChartConfig(
                    verticalIndicatorStrokeWidth: 3.0,
                    verticalIndicatorColor: Colors.black26,
                    showVerticalIndicator: true,
                    verticalIndicatorFixedPosition: false,
                    backgroundColor: Colors.red,
                    backgroundGradient: LinearGradient(
                  colors: [
                    Colors.amber,
                    Colors.orange[100],
                  ],),
                    footerHeight: 40.0,
                  ),
                ),
              ),
               Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Chip(label: Text("Wa5e8"),
          backgroundColor: Colors.red,
          elevation: 25,
          avatar: Icon(Icons.arrow_circle_up),
          ),
          Chip(label: Text("Da5el"),avatar: Icon(Icons.arrow_drop_down_circle),elevation: 25,
      backgroundColor: Colors.blue,),
      Chip(label: Text("reb7"),avatar: Icon(Icons.arrow_forward_ios_rounded),elevation: 25,
      backgroundColor: Colors.green,),
        ],
      ),
            ],
          ),
        ),
      ),
    ],
  );
}



Widget Year(BuildContext context) {
  final fromDate = DateTime(2017, 07, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 300));
  final date4 = DateTime.now().subtract(Duration(days: 320));
  
  final date5 = DateTime.now().subtract(Duration(days: 650));
  final date6 = DateTime.now().subtract(Duration(days: 652));
  final da5el = [
              DataPoint<DateTime>(value: 100000, xAxis: date1),
              DataPoint<DateTime>(value: 500000, xAxis: date2),
              DataPoint<DateTime>(value: 120000, xAxis: date3),
              DataPoint<DateTime>(value: 100520, xAxis: date4),
              DataPoint<DateTime>(value: 400000, xAxis: date5),
              DataPoint<DateTime>(value: 470000, xAxis: date6),
            ];
  final wa5e8 = [
              DataPoint<DateTime>(value: 27000, xAxis: date1),
              DataPoint<DateTime>(value: 10005, xAxis: date2),
              DataPoint<DateTime>(value: 112202, xAxis: date3),
              DataPoint<DateTime>(value: 20000, xAxis: date4),
              DataPoint<DateTime>(value: 15000, xAxis: date5),
              DataPoint<DateTime>(value: 100000, xAxis: date6),
            ];

  return Column(
    children: [
      Text("Statistique Anuelles"),
      Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 50, 8, 10),
          child: Container(
          
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: BezierChart(
              bezierChartScale: BezierChartScale.YEARLY,
              fromDate: fromDate,
              toDate: toDate,
              selectedDate: toDate,
              series: [
                BezierLine(
                     lineColor: Colors.blue,
                  label: "Da5el",
                  onMissingValue: (dateTime) {
                    if (dateTime.year.isEven) {
                      return 20.0;
                    }
                    return 5.0;
                  },
                  data: da5el,
                ),
                BezierLine(
                  
                  label: "Wa5e8",
                  lineColor: Colors.red[400],
                  onMissingValue: (dateTime) {
                    if (dateTime.month.isEven) {
                      return 10.0;
                    }
                    return 3.0;
                  },
                  data: wa5e8,
                ),
                 BezierLine(
                   lineColor: Colors.green,
                  label: "Difference",
                  onMissingValue: (dateTime) {
                    if (dateTime.year.isEven) {
                      return 20.0;
                    }
                    return 5.0;
                  },
                  data:Dif(da5el,wa5e8),
                ),
              ],
              config: BezierChartConfig(
                verticalIndicatorStrokeWidth: 3.0,
                verticalIndicatorColor: Colors.black26,
                
                showVerticalIndicator: true,
                verticalIndicatorFixedPosition: false,
                backgroundGradient: LinearGradient(
                  colors: [
                    Colors.amber,
                    Colors.orange[100],
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
                footerHeight: 20.0,
              ),
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Chip(label: Text("Wa5e8"),
          backgroundColor: Colors.red,
          elevation: 25,
          avatar: Icon(Icons.arrow_circle_up),
          ),
          Chip(label: Text("Da5el"),avatar: Icon(Icons.arrow_drop_down_circle),elevation: 25,
      backgroundColor: Colors.blue,),
      Chip(label: Text("reb7"),avatar: Icon(Icons.arrow_forward_ios_rounded),elevation: 25,
      backgroundColor: Colors.green,),
        ],
      ),
    ],
  );
}


// Card(
//         elevation:5.5,
//         child: Text("Blue : Da5el"),
//       ),
//       Card(
//         elevation:5.5,
//         child: Text("Red : Wa5e8"),
//       ),
//       Card(
//         elevation:5.5,
//         child: Text("Green : reb7"),
//       )


 List<DataPoint<dynamic>> Dif( List<DataPoint<dynamic>> t1 , List<DataPoint<dynamic>> t2){
 List<DataPoint<dynamic>> l = [] ;
 for(int i =0;i<t1.length;i++){
   l.add(DataPoint<DateTime>(value: t1[i].value - t2[i].value, xAxis:t1[i].xAxis));
  
 }
  return l;
}