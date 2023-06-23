import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodrecipe/Screens/addrecipe.dart';
import 'package:foodrecipe/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomeScreen"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  auth.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FoodRecipe()));
                },
                child: Text("Logout"))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Available Recipe"),
              // ExpansionTile(
              //   title: Text("name"),
              //   children: [Text("recipee")],
              // ),
              Expanded(
                  child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("recipee")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Text(" Looding.... ");
                  }

                  var dataa = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: dataa.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          shape: BeveledRectangleBorder(
                              side: BorderSide(
                                width: 0.5,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          expandedAlignment: Alignment.topLeft,
                          childrenPadding: EdgeInsets.all(5),
                          title: Text(dataa[i]["name"]),
                          trailing: IconButton(
                              onPressed: () {
                                edit(dataa[i].id);
                              },
                              icon: Icon(Icons.delete)),
                          children: [
                            Text("1 : " + dataa[i]["recipe1"]),
                            Text("2 : " + dataa[i]["recipe2"]),
                            Text("3 : " + dataa[i]["recipe3"]),
                          ],
                        ),
                      );
                    },
                  );
                },
              )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRecipee(),
                      )),
                  child: Text("ADD Recipe"))
            ],
          ),
        ));
  }

  edit(idd) async {
    await FirebaseFirestore.instance.collection("recipee").doc(idd).delete();
  }
}
