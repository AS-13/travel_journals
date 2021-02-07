import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_journals/material/type_journal.dart';

class JournalsScreen extends StatefulWidget {
  JournalsScreen({Key key, this.image1, this.image2, this.image3, this.style, this.journals}) : super(key: key);

  ExactAssetImage image1, image2, image3;
  int style;
  List<TypeJournal> journals;

  @override
  _JournalsScreenState createState() => _JournalsScreenState();
}

class _JournalsScreenState extends State<JournalsScreen> {
  ExactAssetImage circleAvatar = ExactAssetImage("assets/photo-1.jpg");

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(circleAvatar, context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, height*0.1, 0, 0),
            height: height*0.8,
            child: ListView.builder(
              itemCount: widget.journals.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Row(
                  children: <Widget>[
                    SizedBox(
                      width: width*0.05,
                    ),
                    Container(
                      height: height*0.8,
                      width: width*0.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: widget.journals[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, height*0.43, 0, 0),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: width*0.05,),
                                    Text(widget.journals[index].name, style: TextStyle(color: Colors.white, fontSize: 20),),
                                  ],
                                ),
                                Divider(color: Colors.white, endIndent: width*0.4, indent: width*0.05, thickness: 2.5,),
                                SizedBox(
                                  height: height*0.2,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: width*0.05,),
                                      Text(widget.journals[index].text, style: TextStyle(color: Colors.white, fontSize: 15),),
                                    ],
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width*0.05,
                    ),
                  ],
                );
              },
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(width*0.05, height*0.05, 0, 0),
              child: Icon(Icons.close, size: 30, color: Colors.white,),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, height*0.92, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Joan", style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(width: width*0.05,),
                  Container(
                    width: width*0.15,
                    height: width*0.15,
                    child: CircleAvatar(
                      backgroundImage: circleAvatar,
                    ),
                  ),
                  SizedBox(width: width*0.05,),
                ],
              ),
            ),
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}