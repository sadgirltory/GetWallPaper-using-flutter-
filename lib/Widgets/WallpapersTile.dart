import 'package:flutter/material.dart';
import 'package:wallpaperapp/View/image.dart';
import 'package:wallpaperapp/models/WallpaperModel.dart';

Widget wallpaperList({List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpapers){
        return GridTile(child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageView(
              imageUrl: wallpapers.src.potrait,
            )));
          },
          child: Hero(
            tag: wallpapers.src.potrait,
            child: Container(
              child: GridTile(child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(wallpapers.src.potrait,height:MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,))),
            ),
          ),
        ));
      }).toList(),
    ),

  );
}