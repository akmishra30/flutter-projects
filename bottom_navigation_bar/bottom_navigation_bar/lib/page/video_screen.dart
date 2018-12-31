import 'package:flutter/material.dart';


class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Videos"),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Center(
          child: Container(
            padding: EdgeInsets.only(left: 50.0, right: 50),
            color: Color(0xFFFFFFFF),
            child: Text("This is videos screen", style: TextStyle(color: Colors.black)),
          )),
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