import 'package:flutter/material.dart';
import 'package:flutter_drawer/screens/photos_list.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Drawer Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File selectedImage;

  void selectImage() async{
    File selImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('selePath ------ :  ${selImg.path}');
    selectedImage = selImg;
    setState(() {
    });
  }

  showCapturedImage() async{
    File selImg = await ImagePicker.pickImage(source: ImageSource.camera);
    print('selePath :  ${selImg.path}');
    selectedImage = selImg;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //backgroundColor: Color.fromRGBO(50, 60, 80, 1.0),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage != null ? new Image.file(selectedImage, fit: BoxFit.fill,) : new Text("No image selected.")
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          padding: EdgeInsets.only(bottom: 5.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ashish Mishra', style: TextStyle(fontWeight: FontWeight.bold),),
              accountEmail: Text('akmishra30@hotmail.com'),
              currentAccountPicture: Image.asset('images/profile.jpg'),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Photos'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PhotosListing()));
                  //ImagePicker.pickImage(source: ImageSource.gallery);
                  //selectImage();
                }
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Videos'),
                onTap: () {
                  Navigator.pop(context);
                },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text('Audios'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.attachment),
              title: Text('Documents'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  showCapturedImage();
                }
            ),
            Divider(
              height: 2.0,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
                onTap: () {
                  Navigator.pop(context);
                  selectImage();
                }
            ),
            Divider(
              height: 2.0,
            ),
          ]
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
