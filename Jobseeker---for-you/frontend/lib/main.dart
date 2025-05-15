import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_seeker/dashboard.dart';
import 'package:job_seeker/singup.dart';
import 'constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget{
  const Homepage({super.key});
  @override
  State<Homepage> createState()=>_HomepageState();
}
class _HomepageState extends State<Homepage>{
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool showPassword = false;
  Future login() async{
    if (user.text.isEmpty || pass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Username and Password cannot be empty'),
        ),
      );
      return;
    }
    var url = Uri.http(Constants().ip,"/job_seeker_api/login.php",{'q':'{http}'});
    var response = await http.post(url, body: {
      "username" : user.text.toString(),
      "password" : pass.text.toString(),
    });
    print("Response body: ${response.body}");
    var data = json.decode(response.body);
    if(data.toString()=="Success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login Successful'),
        ),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=> const DashBoard())
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          content: Text('Login or Password invalid'),
        ),
      );

    }
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(child:
    Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black87,Colors.black]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text("Job Offer App",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold, fontSize: 60),),
                  ),
                  const SizedBox(width: 20,),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80).copyWith(
                          topRight: const Radius.circular(0),
                          bottomLeft: const Radius.circular(0),
                        ),
                        gradient: const LinearGradient(colors: [Colors.blue,Colors.greenAccent]),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20).copyWith(right: 0,top: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80).copyWith(
                            topRight: const Radius.circular(0),
                            bottomLeft: const Radius.circular(0),
                          ),
                          gradient: const LinearGradient(colors: [Colors.green,Colors.cyanAccent]),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(20).copyWith(right: 0, top: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80).copyWith(
                                  topRight: const Radius.circular(0),
                                  bottomLeft: const Radius.circular(0)
                              ),
                              gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent])
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: 320,
                height: 320,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      TextField(
                        controller: user,
                        style: TextStyle(
                          color: Colors.white, fontSize: 15,
                        ),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            hintText: "Enter Username",
                            hintStyle: TextStyle(
                                color: Colors.white, fontSize: 15
                            ),
                            prefixIconConstraints: BoxConstraints(maxHeight: 10),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.person, color: Colors.white,size: 20,),
                            ),
                            contentPadding: EdgeInsets.only(top: 14,right: 10),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,width: .2
                                )
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,width: .2
                              ),
                            )
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: pass,
                        style: const TextStyle(
                          color: Colors.white, fontSize: 15,
                        ),
                        cursorColor: Colors.white,
                        obscureText: showPassword?false:true,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: const TextStyle(
                                color: Colors.white, fontSize: 15
                            ),
                            contentPadding: EdgeInsets.only(top: 14,right: 10),
                            prefixIconConstraints: const BoxConstraints(
                                maxHeight: 10
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.lock,color: Colors.white,size: 19,),
                            ),
                            suffixIconConstraints: const BoxConstraints(
                                maxHeight: 10
                            ),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(
                                  showPassword
                                      ? Icons.visibility
                                      :Icons.visibility_off,
                                  color: Colors.white70,
                                  size: 20,
                                ),
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,width: .2
                                )
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white,width: .2
                                )
                            )
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.white.withAlpha(204),
                                fontSize: 13
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: login,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50).copyWith(
                                topRight: const Radius.circular(0),
                              ),
                              gradient: const LinearGradient(colors: [
                                Colors.deepPurpleAccent,
                                Colors.greenAccent,
                              ])
                          ),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white.withAlpha(204),
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUppage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50).copyWith(
                                bottomLeft: const Radius.circular(0),
                              ),
                              gradient: const LinearGradient(colors: [
                                Colors.red,
                                Colors.purpleAccent,
                              ])
                          ),
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(
                                color: Colors.white.withAlpha(204),
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    )
    );
  }
}