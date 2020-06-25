import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/Data/data.dart';
import 'package:wallpaperapp/Widgets/BrandName.dart';
import 'package:wallpaperapp/Widgets/WallpapersTile.dart';
import 'package:wallpaperapp/models/WallpaperModel.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  final String CatagoryName;


  Category({this.CatagoryName});

  @override
  _CategoriesState createState() => _CategoriesState();
}


class _CategoriesState extends State<Category> {
  bool isLoading = true;
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
    getSearchWallpapers(widget.CatagoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: brandName(),elevation: 0.0,),
      body: isLoading?Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[

              SizedBox(height: 16,),
              wallpaperList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
