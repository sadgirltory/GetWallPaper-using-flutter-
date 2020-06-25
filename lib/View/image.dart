


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' show get;
import 'package:image_downloader/image_downloader.dart';
import 'package:toast/toast.dart';





class ImageView extends StatefulWidget {
  final String imageUrl;

  ImageView({@required this.imageUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}



class _ImageViewState extends State<ImageView> {

  var showdownloading = false;
  var _progress;

  @override
  void initState() {
    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child:Image.network(widget.imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height
                  , fit: BoxFit.cover,)
                ),
          ),
          SafeArea(
            child: Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                   Stack(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
                                Navigator.of(context).pop();
                              }),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[

                                    IconButton(icon: Icon(Icons.save_alt, color: Colors.white,), onPressed: (){
                                      _downloadandSaveImage();

                                    }),
                                    showdownloading?Text("$_progress", style: TextStyle(color: Colors.white)): SizedBox(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 60,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),


                        ),
                      ],
                    ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _downloadandSaveImage() async {
    try {
      showdownloading = true;

      // Saved with this method.
      //var imageId = await ImageDownloader.downloadImage(widget.imageUrl);
     var imageId = await ImageDownloader.downloadImage(widget.imageUrl,
        destination: AndroidDestinationType.directoryDCIM
      );
      if (imageId == null) {
        return;
      }
      Toast.show("Saved!", context, duration:  Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    } on PlatformException catch (error) {
      print(error);
    }
  }


}




