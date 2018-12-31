import 'package:flutter/material.dart';
import 'page/audio_screen.dart';
import 'page/documents_screen.dart';
import 'page/photos_screen.dart';
import 'page/video_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Bottom Bar'),
      routes: {
        "/photos": (_) => new PhotosScreen(),
        "/videos": (_) => new VideoScreen(),
        "/audios": (_) => new AudioScreen(),
        "/documents": (_) => new DocumentsScreen(),
      },
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

  @override
  Widget build(BuildContext context) {

    final topMenuBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        PopupMenuButton<String>(
          child: Text("Top Menu Bar", style: TextStyle(color: Colors.white)),
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            const PopupMenuItem<String>(
                value: 'Photos',
                child: Text('Photos')
            ),
            const PopupMenuItem<String>(
                value: 'Videos',
                child: Text('Videos')
            ),
            const PopupMenuItem<String>(
                value: 'Audios',
                child: Text('Audios')
            ),
            const PopupMenuItem<String>(
                value: 'Documents',
                child: Text('Documents')
            )
          ]
        )

      ],
    );

    return Scaffold(
      appBar: topMenuBar,

      backgroundColor: Color.fromRGBO(50, 60, 80, 1.0),
      body: Center(
          child: Container(
            padding: EdgeInsets.only(left: 50.0, right: 50),
            color: Color(0xFFFFFFFF),
            child: Text("This bottom navigation bar sample project.", style: TextStyle(color: Colors.black)),
          )
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 40,
                ),
                tooltip: "Photos",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      "/photos"
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.video_library, color: Colors.white, size: 40),
                tooltip: "Video",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      "/videos"
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.audiotrack, color: Colors.white, size: 40),
                tooltip: "Audio",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      "/audios"
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.attach_file, color: Colors.white, size: 40),
                tooltip: "Documents",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context,
                      "/documents"
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
