import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddRecipee extends StatefulWidget {
  const AddRecipee({super.key});

  @override
  State<AddRecipee> createState() => _AddRecipeeState();
}

class _AddRecipeeState extends State<AddRecipee> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameofrecipe = TextEditingController();
  TextEditingController recipe1 = TextEditingController();
  TextEditingController recipe2 = TextEditingController();
  TextEditingController recipe3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Recipe"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 247, 32, 32))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      hintText: "Enter Recipe Name",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(96, 116, 116, 116)),
                      labelText: "Recipe Name",
                      labelStyle:
                          const TextStyle(fontSize: 23, color: Colors.black)),
                  controller: nameofrecipe,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Recipe name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 247, 32, 32))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      hintText: "Enter Recipe Name1",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(96, 116, 116, 116)),
                      labelText: "Recipe 1",
                      labelStyle:
                          const TextStyle(fontSize: 23, color: Colors.black)),
                  controller: recipe1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Recipe1";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 247, 32, 32))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      hintText: "Enter Recipe Name2",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(96, 116, 116, 116)),
                      labelText: "Recipe 2",
                      labelStyle:
                          const TextStyle(fontSize: 23, color: Colors.black)),
                  controller: recipe2,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Recipe name2";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 247, 32, 32))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      hintText: "Enter Recipe Name3",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(96, 116, 116, 116)),
                      labelText: "Recipe 3",
                      labelStyle:
                          const TextStyle(fontSize: 23, color: Colors.black)),
                  controller: recipe3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a Recipe name3";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        CollectionReference addd = await FirebaseFirestore
                            .instance
                            .collection("recipee");
                        addd.doc().set({
                          "name": nameofrecipe.text,
                          "recipe1": recipe1.text,
                          "recipe2": recipe2.text,
                          "recipe3": recipe3.text
                        });
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Submit"))
              ],
            )),
      ),
    );
  }
}
