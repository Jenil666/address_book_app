import 'dart:io';

import 'package:address_book_app/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(onPressed: () {
            Navigator.pushNamed(context, 'input').then((value) => setState(() {}));
          }, child:  Text("+",style: TextStyle(fontSize: 35),)),
        ),
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: Colors.black26,),
          actions: [
            Icon(Icons.more_vert,color: Colors.black26,),
            SizedBox(width: 10,),
          ],
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text(
                  "My Contact",
                  style: TextStyle(color: Colors.black45,fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Text(
                    "Type Name or Number",
                    style: TextStyle(color: Colors.black45),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.search,color: Colors.black45,),
                  SizedBox(width: 20,),
                ],
              ),
              margin: EdgeInsets.all(20),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(1, 7)),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Text(
                  "A",
                  style: TextStyle(color: Colors.blue,fontSize: 30,),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: l1.length,
                itemBuilder: (context, index) {
                  return ui(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ui(int inde) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 39,
            width: 39,
            child: Image.file(File("${l1[inde].pic}"),fit: BoxFit.fill,),
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${l1[inde].name}",style: TextStyle(fontSize: 20),),
              Text("${l1[inde].number}"),
            ],
          ),
          Expanded(child: SizedBox()),
          IconButton(onPressed: () async{
            await launchUrl(Uri(scheme: 'tel',path: '${l1[inde].number}'));
          }, icon: Icon(Icons.call,size: 20,),),
          //SizedBox(width: 20,),
          IconButton(onPressed: () async {
            await launchUrl(Uri(scheme: 'sms',path: '${l1[inde].number}'));
          }, icon:Icon(Icons.message,size: 20,),),
         // SizedBox(width: 20,),
          IconButton(onPressed: () async {
            await launchUrl(Uri(scheme: 'https',path: '${l1[inde].number}'));
          }, icon: Icon(Icons.public,size: 20,),),
         // SizedBox(width: 20,),
          IconButton(onPressed: () async {
            await launchUrl(Uri(scheme: 'mailto',path: '${l1[inde].number}'));
          }, icon: Icon(Icons.email_outlined,size: 20,),),
         // SizedBox(width: 20,),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black45)
        )
      ),
    );
  }
}

// ListTile(
//   leading: Container(
//
//     color: Colors.green,
//   ),
//   title: Text("Jenil"),
//   subtitle: Text("1234567891"),
//   trailing: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       Icon(Icons.message),
//       Icon(Icons.call),
//     ],
//   ),
// );
