import 'package:address_book_app/Modalclass.dart';
import 'package:address_book_app/variables.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DataInput extends StatefulWidget {
  const DataInput({Key? key}) : super(key: key);

  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  String path = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Data Input"),
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: txtname,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                       hintText: "Enter Name"
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter Number"
                    ),
                    controller: txtnumber,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                        hintText: "Enter E-Mail"
                    ),
                    controller: txtmail,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "Enter Web-Site"
                    ),
                    controller: txtweb,
                  ),
                ),
                ExpansionTile(title: Text("Image"),children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final ImagePicker Image = ImagePicker();
                            final XFile? photo = await Image.pickImage(source: ImageSource.camera);
                            setState(() {
                              path = photo!.path;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt_outlined,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Camera",style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final ImagePicker Image = ImagePicker();
                            final XFile? photo = await Image.pickImage(source: ImageSource.gallery);
                            setState(() {
                              path = photo!.path;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image,color: Colors.white),
                                SizedBox(width: 10,),
                                Text("Gallery",style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],),
                ElevatedButton(onPressed: () {
                  data d1 = data(name: txtname.text,number: txtnumber.text,pic: path,mail: txtmail.text,web: txtweb.text);
                  setState(() {
                    l1.add(d1);
                  });
                  Navigator.pop(context);
                  txtname.clear();
                  txtnumber.clear();
                  txtweb.clear();
                  txtmail.clear();
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text("Done"))
              ],
            ),
          ),
    ));
  }
}
