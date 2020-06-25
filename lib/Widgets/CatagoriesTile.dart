import 'package:flutter/material.dart';
import 'package:wallpaperapp/View/Catagory.dart';

class CategoriesTile extends StatelessWidget {
  final String imgUrl,title;

  CategoriesTile({@required this.imgUrl,@required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> Category(
              CatagoryName: title.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover,)),

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.black26,
                height: 50, width: 100,
                alignment: Alignment.center,
                child:Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            )
          ],
        ),
      ),
    );
  }
}