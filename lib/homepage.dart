import 'dart:convert';

import 'package:MeetingsManager/main.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import 'drink_detail.dart';
import 'main.dart';

//since project doesn't have a structure yet, we create a stl widget
//We'll convert later
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks; //res is null

  //first thing called in this class will be initstate
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api); //wait till data is fetched
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        myColor,
        Colors.orange,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Text("Cocktail App")),
          elevation: 0.0,
        ),
        body: Center(
            child: res != null
                ? ListView.builder(
                    itemCount: drinks.length,
                    itemBuilder: (context, index) {
                      var cur_drink = drinks[index];
                      return ListTile(
                        leading: Hero(
                          tag: cur_drink["idDrink"],
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(cur_drink[
                                    "strDrinkThumb"] ??
                                "https://1m19tt3pztls474q6z46fnk9-wpengine.netdna-ssl.com/wp-content/themes/unbound/images/No-Image-Found-400x264.png"),
                          ),
                        ),
                        title: Text(
                          "${cur_drink["strDrink"]}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "${cur_drink["idDrink"]}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DrinkDetail(drink: cur_drink)));
                        },
                      );
                    },
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
      ),
    );
  }
}
