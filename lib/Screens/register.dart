import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodrecipe/main.dart';

class Regis extends StatefulWidget {
  const Regis({super.key});

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    width: 500,
                    height: 200,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                    width: 500,
                    height: 180,
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "New Account",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
            const LoginDown(),
          ],
        ),
      ),
    );
  }
}

class LoginDown extends StatefulWidget {
  const LoginDown({super.key});

  @override
  State<LoginDown> createState() => _LoginDownState();
}

class _LoginDownState extends State<LoginDown> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController Email = TextEditingController();

  TextEditingController Pass = TextEditingController();
  TextEditingController Username = TextEditingController();
  bool obsectrue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Form(
        key: _formkey,
        child: Column(children: [
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
                hintText: "Enter Email Or Gmail",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(96, 116, 116, 116)),
                labelText: "Email Address",
                labelStyle: const TextStyle(fontSize: 23, color: Colors.black)),
            controller: Email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter a Email";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            obscureText: obsectrue,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsectrue = !obsectrue;
                      });
                    },
                    icon: Icon(
                        obsectrue ? Icons.visibility : Icons.visibility_off)),
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
                hintText: "Password",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(96, 116, 116, 116)),
                labelText: "Password",
                labelStyle: const TextStyle(fontSize: 23, color: Colors.black)),
            controller: Pass,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter a Password";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
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
                hintText: "Enter UserName",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(96, 116, 116, 116)),
                labelText: "UserName",
                labelStyle: const TextStyle(fontSize: 23, color: Colors.black)),
            controller: Username,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter a UserName";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(207, 207, 10, 76))),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  regi(Email.text, Pass.text, Username.text);
                }
              },
              child: const Text("Register Account")),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "or ",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FoodRecipe()));
                  },
                  child: const Text(
                    "SignIn",
                    // style: TextStyle(color: colourpink),
                  ))
            ],
          )
        ]),
      ),
    );
  }

  void regi(String email, String passs, String username) {
    try {
      FirebaseAuth userrr = FirebaseAuth.instance;
      userrr
          .createUserWithEmailAndPassword(email: email, password: passs)
          .then((value) {
        var user = FirebaseAuth.instance.currentUser;
        CollectionReference ref =
            FirebaseFirestore.instance.collection("foodrecipeapp");
        ref.doc(user!.uid).set({
          "Emailid": email,
          "Password": passs,
          "Username": username,
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Register successful : $email")));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FoodRecipe()));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
