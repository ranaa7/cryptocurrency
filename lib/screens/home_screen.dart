import 'package:cryptocurrency/core/themes.dart';
import 'package:cryptocurrency/screens/detailed_screen.dart';
import 'package:cryptocurrency/view_model/provider/detailed_provider.dart';
import 'package:cryptocurrency/view_model/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
late Color color1;
  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<Detailedprovider>(context,listen: false);
    return Scaffold(
        appBar: AppBar(

          title: Text('crypto currency'),
        ),
        body: Consumer<Homeprovider>(builder: (context, provider, child) {


          return ListView.builder(
              itemCount: provider.homelist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                     provider1.getdetailed(provider.homelist[index].id);
                  },
                  child: Card(

                    color: Themes.isDarkMode(context)?Colors.lightGreen:Colors.pink,
                    child: Row(
                      children: [
                        Text(
                          provider.homelist[index].market_cap_rank.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Image.network(
                          provider.homelist[index].image,
                          width: 7,
                          height: 25,
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Text(provider.homelist[index].name,
                                  style: TextStyle(color: Colors.white)),
                              Text(provider.homelist[index].symbol,
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                    //         Text(
                    //     provider.homelist[index].current_price.toString(),
                    // style: TextStyle(color: Colors.white)
                    //           ),
                //             Text(
                // getColor(double.parse(  provider.homelist[index].price_change_24h
                //     .toString(),)).toString()
                //             ),

                            Text(provider.homelist[index].price_change_24h.toString(),style: TextStyle(
                              color:getColor(provider.homelist[index].price_change_24h)
                //               provider.homelist[index].price_change_24h > 0 ?
                // Colors.red :Colors.green
                            ),),
                            Text(
                                provider
                                    .homelist[index].price_change_percentage_24h
                                    .toString(),
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }));

  }
  Color getColor(double selector) {
    if (selector >=0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
