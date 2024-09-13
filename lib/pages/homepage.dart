import 'package:flutter/material.dart';
import"package:google_fonts/google_fonts.dart";
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeApi",style:TextStyle(fontSize: 29)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10), // Adjust this value as needed
          child: Image.asset("assets/images/img_1.png"),
        ),

      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: MediaQuery.of(context).size.height*0.40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: Colors.blueGrey
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Container(
                height: MediaQuery.of(context).size.height*0.60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: Colors.green
                ),
              ),
            )

          ],
        ),
      )
      )

    );
  }
}
