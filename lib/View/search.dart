import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/Data/data.dart';
import 'package:wallpaperapp/Widgets/BrandName.dart';
import 'package:wallpaperapp/Widgets/WallpapersTile.dart';
import 'package:wallpaperapp/models/WallpaperModel.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchQuery;

  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isLoading = true;
  TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> wallpapers = new List();

  getSearchWallpapers(String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=20",
        headers:{
          "Authorization": apikey
        }

    );
    //print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element){
      //print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: brandName(),elevation: 0.0,),
      body: isLoading? Center(child: CircularProgressIndicator()):  SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(30)
                )
                ,
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Card(
                      elevation: 0.6,
                        child: Container(
                          padding: EdgeInsets.all(5),
                            child: Text(searchController.text.toUpperCase(), style: TextStyle(fontSize: 20,  ),)))
                  ],
                ),

              ),
              SizedBox(height: 16,),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
