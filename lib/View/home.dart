import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:wallpaperapp/Data/data.dart';
import 'package:wallpaperapp/View/search.dart';
import 'package:wallpaperapp/Widgets/BrandName.dart';
import 'package:wallpaperapp/Widgets/CatagoriesTile.dart';
import 'package:wallpaperapp/Widgets/WallpapersTile.dart';
import 'package:wallpaperapp/models/CatatoriesModel.dart';
import 'package:wallpaperapp/models/WallpaperModel.dart';
import 'package:http/http.dart' as http;



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List<CategoriesModel> catagories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();
  @override
  getTrendingWallpapers() async{
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=20",
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
    getTrendingWallpapers();
    catagories = getCatagories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: brandName(),elevation: 0.0,),
      body: isLoading? Center(child: CircularProgressIndicator()): SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)
                )
                ,
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "search"
                      ),
                    )),
                    InkWell(
                      onTap:(){
                        searchController.text== ""? Container() : Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Search(

                            searchQuery: searchController.text,
                          ),
                        ));
                      } ,
                      child: Container(
                          child: Icon(Icons.search)),
                    ),
                  ],
                ),

              ),

              SizedBox(height: 16,),
              Container(
                height: 80,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index ) =>  CategoriesTile(imgUrl: catagories[index].imageUrl,
                      title: catagories[index].catagoriesName),
                  itemCount: catagories.length,),
              ),
              SizedBox(height: 16,),
              wallpaperList(wallpapers: wallpapers, context: context),

            ],
          ),
        ),
      ),

    );
  }

  searchQuery(){
    if(searchController.text==null){

    }
  }
}
