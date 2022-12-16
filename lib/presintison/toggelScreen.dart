import 'package:flutter/material.dart';
import 'package:payment/presintison/CardScreen.dart';

class ToggellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).
                    pushReplacement(MaterialPageRoute(builder: (_)=>CardScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green)
                      ),
                      height: 300,
                      width: double.infinity,
                      child: const Image(image: AssetImage("assets/visa.png"),fit: BoxFit.fill,),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)
                      ),
                      height: 300,
                      width: double.infinity,
                      child: const Image(image: AssetImage("assets/code.jpg"),fit: BoxFit.fill,),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
