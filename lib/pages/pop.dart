import 'package:flutter/material.dart';
import 'package:_AMULYA_/pages/home.dart';

class popUP extends StatefulWidget {
  const popUP({super.key});

  @override
  State<popUP> createState() => _popUPState();
}

class _popUPState extends State<popUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(

          children: <Widget>[
            SizedBox(height: 18.0,),
            Container(height: 310.0,
            width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Sbg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 450.0,),
            Center(
              child: SizedBox(
                height: 58.0,
                width: 180.0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text("WE ❤️ LOVE YOU.."),
                  backgroundColor: Color(0xFFDA9387),
                  focusColor: Color(0xFFB9715E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  elevation: 6.0,
                  foregroundColor: Colors.white,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
