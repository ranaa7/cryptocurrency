import 'package:cryptocurrency/view_model/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Searchprovider>(builder:(context,provider,child){
    return  Scaffold(
        appBar: AppBar(

        title: TextField(
        onChanged:(value){
      provider.getsearchlist(value);
    },
    decoration:InputDecoration(suffixIcon: Icon(Icons.search,color: Colors.blueAccent,),hintText:"search",),),
    ),body:

     ListView.builder(itemCount: provider.searchlist.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(child: Image.network(provider.searchlist[index].img,width: 7,height: 25,)),
                  Expanded(
                    child: Column(
                      children: [Text(provider.searchlist[index].name,style: TextStyle(color: Colors.white)),Text(provider.searchlist[index].symbol,style: TextStyle(color: Colors.white))],
                    ),
                  ),
                  Column(
                    children: [Text("Rank",style: TextStyle(color: Colors.white)),Text(provider.searchlist[index].cap_rank.toString(),style: TextStyle(color: Colors.white)),],
                  )
                ],
              ),
            );
          }));});

  }
}
