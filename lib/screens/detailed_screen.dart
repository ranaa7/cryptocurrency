import 'package:cryptocurrency/models/home_model.dart';
import 'package:cryptocurrency/view_model/provider/detailed_provider.dart';
import 'package:cryptocurrency/view_model/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Detailscreen extends StatelessWidget {

  Detailscreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      Chardata("1y", 60),
      Chardata("6m", 200),
      Chardata("2m", 30),
      Chardata("1m", 100),
      Chardata("2w", 40),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(

          title: Text('crypto currency'),
        ),
        body:
        Consumer<Detailedprovider>(builder: (context, provider, child) {
          return Container(
            child: Column(
              children: [
                Expanded(
                    child: Image.network(
                      provider.detail?.imgURL ?? "",
                      width: double.infinity,
                      height: 100,
                    )),
                Expanded(
                  child: Row(
                    children: [
                      Text(provider.detail?.name ?? "",
                          style: TextStyle(color: Colors.white)),
                      Text("Rank",
                          style: TextStyle(color: Colors.white)),
                      Text(provider.detail?.rank.toString() ?? "" ,
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Text(provider.detail?.symbol ?? "",
                    style: TextStyle(color: Colors.white)),
                Text("Price",
                    style: TextStyle(color: Colors.white)),
                // Row(
                //   children: [
                //     Text(provider.detail?.current_price ?? "" ,
                //         style: TextStyle(color: Colors.white)),
                //     Text(provider.detail?.percentChange_24h ?? "",
                //         style: TextStyle(color: Colors.white)),
                //   ],
                // ),
                Expanded(
                  child: Center(child: Container(
                    height: 200,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.grey

                    ),
                    child: Card(color: Colors.greenAccent,
                      child: SfCartesianChart(primaryXAxis: CategoryAxis(
                          isVisible: true),
                          primaryYAxis: CategoryAxis(isVisible: true,majorGridLines: MajorGridLines(width: 1),
                            axisLine: AxisLine(width: 3, color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                            majorTickLines: MajorTickLines(size: 0),),

                          series: <ChartSeries<Chardata, String>>[
                            LineSeries(
                              dataSource: data,
                              dataLabelSettings: DataLabelSettings(isVisible: true),
                              color: Colors.greenAccent,
                              width: 3,
                              xValueMapper: (Chardata sales, _)=>sales.x.toString(),
                              yValueMapper: (Chardata sales, _)=>sales.y,
                          )
                          ]),),
                  )),
                ),
                Text("Description",
                    style: TextStyle(color: Colors.white)),
                Text(provider.detail?.description ?? "",
                    style: TextStyle(color: Colors.white)),

              ],
            ),
          );
        }));
  }
}

class Chardata {
  Chardata(this.x, this.y);

  String x;
  double y;

}

