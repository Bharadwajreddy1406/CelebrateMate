import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> datahere() async {
  const URL = 'https://amulya.onrender.com';
  final response = await http.get(Uri.parse(URL));

  if (response.statusCode == 200) {
    final Map<String, dynamic> resd = json.decode(response.body);
    return resd;
  } else {
    throw Exception('Failed to load data');
  }
}

class Comet extends StatefulWidget {
  const Comet({super.key});

  @override
  State<Comet> createState() => _CometState();
}

class _CometState extends State<Comet> {

  Map<String, dynamic>? jsonData = {'0':{'name':" ","miss_distance_km":" ",'time':"--"}
    ,'1':{'name':" ","miss_distance_km":" ",'time':"--"},
    '2':{'name':" ","miss_distance_km":" ",'time':"--"},
};

  Future<void> jojo() async {
    // Call the function to get the data
    Map<String, dynamic> fetchedData = await datahere();

    // Update the state with the fetched data
    setState(() {
      jsonData = fetchedData;
    });
    print(jsonData?['0']['name']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA7667D),
        title: Text("Recent comet events"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/static/bg1.png'),
            fit: BoxFit.cover,

          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                SizedBox(height: 10.0,),
                GlassmorphicContainer(
                width: 360,
                height: 620,
                borderRadius: 15,
                blur: 2,
                alignment: Alignment.topCenter,
                border: 2,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF000000).withOpacity(0.1),
                      Color(0xFF000000).withOpacity(0.05),
                    ],
                    stops: [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF000000).withOpacity(0.5),
                    Color((0xFF000000)).withOpacity(0.5),
                  ],
                ),
                child:Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        textContainer(name:"${jsonData?['0']?['name'] ?? ''}",time:"${jsonData?['0']?['time'] ?? ''}",dist:"${jsonData?['0']?['miss_distance_km'] ?? ''}",),
                        textContainer(name:"${jsonData?['1']?['name'] ?? ''}",time:"${jsonData?['1']?['time'] ?? ''}",dist:"${jsonData?['1']?['miss_distance_km'] ?? ''}",),
                      ],
                    ),
                  ),
                ),),
                SizedBox(height: 18.0,),
                Center(
                  child: SizedBox(
                    width: 140.0,
                    child: FloatingActionButton(
                      onPressed: () async {
                        jojo();
                      },
                      child: Text("S E A R C H"),
                      backgroundColor: Color(0xFFE75480),
                      focusColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      elevation: 6.0,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        )
      ),
    );
  }
}

class textContainer extends StatelessWidget {
  final String time;
  final String dist;
  final String name;
  const textContainer({
    required this.time,
    required this.dist,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 350.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2.0),
        child: SingleChildScrollView(child: Text(
          'The Comet $name can be seen at $time . Its currently $dist Km far from Earth',
          style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        scrollDirection: Axis.vertical,),
      ),
    );
  }
}
