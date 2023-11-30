import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';


class info extends StatefulWidget {
  const info({super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A small Gift from K.U.K.S. ',
        style: TextStyle(
          color: Color(0xFF2A302A),
          fontSize: 20.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
        backgroundColor: Color(0xFF93C895),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
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
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10.0),
              child: Text('❤️',
                style: TextStyle(
                  color: Color(0xFF632162),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: GlassmorphicContainer(
                  width: 370,
                  height: 630,
                  borderRadius: 10,
                  blur: 3,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child:
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img1.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img2.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img3.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img4.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img5.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img6.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img7.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img8.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img9.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img10.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img11.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img12.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img13.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img14.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img15.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img16.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img17.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img18.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image(image: AssetImage("assets/images/img19.png"),
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 30.0,),
                        ],
                      ),
                    ),
                  ) ,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}