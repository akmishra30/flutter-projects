import 'package:flutter/material.dart';
import 'package:flutter_drawer/model/photo.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';



class PhotosListing extends StatelessWidget{
  List<Photo> photos;

  Future<Directory> _tempDir = getTemporaryDirectory();
  Future<Directory> _appDocDir = getApplicationDocumentsDirectory();
  Future<Directory> _externalDocDir = getExternalStorageDirectory();
  RegExp exp = new RegExp(r"([a-zA-Z0-9\s_\\.\-\(\):])+(gif|jpg|jpeg|tiff|png)$", caseSensitive: false, multiLine: false);

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory> snapshot) {
    Text text = const Text('');
    List files = new List();
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = new Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        snapshot.data.list(recursive: true, followLinks: false)
            .listen((FileSystemEntity entity){
              if(exp.hasMatch(entity.path)) {
                //print(entity.path);
                files.add(entity.path);

              }
        });

        print('## No of images:${files.length}');

    } else {
        text = const Text('path unavailable');
      }
    }
    print('## No of images:${files.length}');
    return new Padding(padding: const EdgeInsets.all(16.0), child: text);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Photos'),
          backgroundColor: Color.fromRGBO(50, 60, 80, 1.0),
        ),
        body: Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text("External Dir", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                  new Expanded(
                        child: new FutureBuilder<Directory>(
                            future: _externalDocDir, builder: _buildDirectory),
                  ),
                  Divider(
                    height: 5.0,
                  ),
//                  new Text("Temp Dir", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
//                  new Expanded(
//                    child: new FutureBuilder<Directory>(
//                        future: _tempDir, builder: _buildDirectory),
//                  ),
//                  Divider(
//                    height: 5.0,
//                  ),
//                  new Text("Document Dir", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
//                  new Expanded(
//                    child: new FutureBuilder<Directory>(
//                        future: _appDocDir, builder: _buildDirectory),
//                  )
                ]
            )
        )
    );
  }
}