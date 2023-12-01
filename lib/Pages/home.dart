import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class home extends StatelessWidget {
    const home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Uni Funds",
              style: GoogleFonts.rocknRollOne(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: "My project",
                ),
                Tab(
                  text: "All project",
                ),
              ],
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 15.0),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("It's cloudy here"),
              ),
              Center(
                child: Text("It's rainy here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
