import 'dart:io';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:travel_journals/screens/journals.dart';
import 'package:travel_journals/material/type_journal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          display1: TextStyle(color: Colors.white),
          display2: TextStyle(color: Colors.white),
          display3: TextStyle(color: Colors.white),
          display4: TextStyle(color: Colors.white),
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  String name = "mountains";
  ExactAssetImage image1, image2, image3;
  Color active = Color(0xFF666666), noActive = Color(0xFF999999),
      colorMountains, colorSea, colorCities, colorSummer, colorWinter, colorText;
  double fontSize = 30;
  int style = 1;
  List<TypeJournal> journals = [];

  getJournals(){
    journals.clear();
    journals.add(TypeJournal(name:"Traveling", image: image1, text: """Traveling is one of the most beloved 
activities of most people. 
Why do so many love to travel? 
Everything is simple, when a person 
travels, he learns the world around 
him and himself."""));
    journals.add(TypeJournal(name:"Positive emotions", image: image2, text: """During the trip you are filled with 
energy, strength, positive emotions. 
You begin to feel the harmony and 
close connection of man with nature."""));
    journals.add(TypeJournal(name:"Earth", image: image3, text: """There are a lot of unusual corners, 
beautiful places on earth 
that make you experience 
amazing emotions and feelings."""));
  }

  @override
  void initState() {
    super.initState();
    image1 = ExactAssetImage("assets/$name/1.jpg");
    image2 = ExactAssetImage("assets/$name/2.jpg");
    image3 = ExactAssetImage("assets/$name/3.jpg");

    colorMountains = active;
    colorSea = noActive;
    colorCities = noActive;
    colorSummer = noActive;
    colorWinter = noActive;
    getJournals();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(ExactAssetImage("assets/mountains/1.jpg"), context);
    precacheImage(ExactAssetImage("assets/mountains/2.jpg"), context);
    precacheImage(ExactAssetImage("assets/mountains/3.jpg"), context);

    precacheImage(ExactAssetImage("assets/sea/1.jpg"), context);
    precacheImage(ExactAssetImage("assets/sea/2.jpg"), context);
    precacheImage(ExactAssetImage("assets/sea/3.jpg"), context);

    precacheImage(ExactAssetImage("assets/cities/1.jpg"), context);
    precacheImage(ExactAssetImage("assets/cities/2.jpg"), context);
    precacheImage(ExactAssetImage("assets/cities/3.jpg"), context);

    precacheImage(ExactAssetImage("assets/summer/1.jpg"), context);
    precacheImage(ExactAssetImage("assets/summer/2.jpg"), context);
    precacheImage(ExactAssetImage("assets/summer/3.jpg"), context);

    precacheImage(ExactAssetImage("assets/winter/1.jpg"), context);
    precacheImage(ExactAssetImage("assets/winter/2.jpg"), context);
    precacheImage(ExactAssetImage("assets/winter/3.jpg"), context);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(width*0.2, height*.08, 0, 0),
            child: Text(
                "Travel Journals",
                style: TextStyle(
                    fontSize: 40,
                    color: active
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: width*0.05,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        child: Text("Mountains", style: TextStyle(color: colorMountains, fontSize: fontSize),),
                      ),
                      onTap: (){
                        setState(() {
                          name = "mountains";
                          image1 = new ExactAssetImage("assets/$name/1.jpg");
                          image2 = new ExactAssetImage("assets/$name/2.jpg");
                          image3 = new ExactAssetImage("assets/$name/3.jpg");

                          colorMountains = active;
                          colorSea = noActive;
                          colorCities = noActive;
                          colorSummer = noActive;
                          colorWinter = noActive;
                          style = 1;

                          getJournals();
                        });
                      },
                    ),
                    SizedBox(height: height*0.02,),
                    GestureDetector(
                      child: Text("Sea", style: TextStyle(color: colorSea, fontSize: fontSize),),
                      onTap: (){
                        setState(() {
                          name = "sea";
                          image1 = new ExactAssetImage("assets/$name/1.jpg");
                          image2 = new ExactAssetImage("assets/$name/2.jpg");
                          image3 = new ExactAssetImage("assets/$name/3.jpg");

                          colorMountains = noActive;
                          colorSea = active;
                          colorCities = noActive;
                          colorSummer = noActive;
                          colorWinter = noActive;
                          style = 2;

                          getJournals();
                        });
                      },
                    ),
                    SizedBox(height: height*0.02,),
                    GestureDetector(
                      child: Text("Cities", style: TextStyle(color: colorCities, fontSize: fontSize),),
                      onTap: (){
                        setState(() {
                          name = "cities";
                          image1 = new ExactAssetImage("assets/$name/1.jpg");
                          image2 = new ExactAssetImage("assets/$name/2.jpg");
                          image3 = new ExactAssetImage("assets/$name/3.jpg");

                          colorMountains = noActive;
                          colorSea = noActive;
                          colorCities = active;
                          colorSummer = noActive;
                          colorWinter = noActive;

                          style = 3;

                          getJournals();
                        });
                      },
                    ),
                    SizedBox(height: height*0.02,),
                    GestureDetector(
                      child: Text("Summer", style: TextStyle(color: colorSummer, fontSize: fontSize),),
                      onTap: (){
                        setState(() {
                          name = "summer";
                          image1 = new ExactAssetImage("assets/$name/1.jpg");
                          image2 = new ExactAssetImage("assets/$name/2.jpg");
                          image3 = new ExactAssetImage("assets/$name/3.jpg");

                          colorMountains = noActive;
                          colorSea = noActive;
                          colorCities = noActive;
                          colorSummer = active;
                          colorWinter = noActive;

                          style = 4;

                          getJournals();
                        });
                      },
                    ),
                    SizedBox(height: height*0.02,),
                    GestureDetector(
                      child: Text("Winter", style: TextStyle(color: colorWinter, fontSize: fontSize),),
                      onTap: (){
                        setState(() {
                          name = "winter";
                          image1 = new ExactAssetImage("assets/$name/1.jpg");
                          image2 = new ExactAssetImage("assets/$name/2.jpg");
                          image3 = new ExactAssetImage("assets/$name/3.jpg");

                          colorMountains = noActive;
                          colorSea = noActive;
                          colorCities = noActive;
                          colorSummer = noActive;
                          colorWinter = active;
                          style = 5;

                          getJournals();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: height*0.2,
            right: 40,
            child: Container(
              width: width*0.4,
              height: height*0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image3,
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect( // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height*0.18,
            right: 20,
            child: GestureDetector(
              onTap: (){
              },
              child: Container(
                width: width*0.4,
                height: height*0.64,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image2,
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect( // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height*0.16,
            right: 0,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JournalsScreen(image1: image1, image2: image2, image3: image3, style: style, journals: journals)),);
              },
              child: Container(
                width: width*0.4,
                height: height*0.68,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ),
          Positioned(
              bottom: height*0.1,
              right: 20,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JournalsScreen(image1: image1, image2: image2, image3: image3, style: style,journals: journals)),);
                },
                child: Row(
                  children: <Widget>[
                    Text("View", style: TextStyle(fontSize: 20, color: noActive, fontFamily: "Golos"),),
                    Icon(Icons.chevron_right, color: noActive, size: 20,),
                  ],
                )
              )
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
