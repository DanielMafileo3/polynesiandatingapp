// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageMaker extends StatefulWidget {
  const ImageMaker({Key? key}) : super(key: key);

  @override
  State<ImageMaker> createState() => _ImageMakerState();
}

class _ImageMakerState extends State<ImageMaker> {
  File? image;

  Future pickImage(ImageSource e) async {
    try {
      final image = await ImagePicker().pickImage(source: e);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Widget camerabutton(String title, Icon i, ImageSource e) {
    return ElevatedButton(
      onPressed: () {
        pickImage(e);
        Navigator.of(context).pop();
      },
      child: Ink(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              i,
              SizedBox(
                width: 10,
              ),
              Text(title)
            ],
          )),
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }

  Future showImageOptions() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Center(
                child: Text("Choose Photo"),
              ),
              content: Container(
                height: 140,
                width: 250,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    camerabutton(
                        "Pick Gallery", Icon(Icons.image), ImageSource.gallery),
                    SizedBox(
                      height: 20,
                    ),
                    camerabutton(
                        "Pick Camera", Icon(Icons.camera), ImageSource.camera),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 244, 54, 241),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 180,
      width: 120,
      //color: Colors.red,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          image != null
              ? Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    splashColor: Colors.purple.withAlpha(30),
                    onTap: () {
                      print("Cardqwdqwwdd tapped");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            width: 200,
                            height: 500,
                            child: Image.file(
                              image!,
                              height: 180,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Image.file(
                      image!,
                      height: 180,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Card(
                  //color: Colors.white.withOpacity(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 15,
                  child: InkWell(
                    splashColor: Colors.purple.withAlpha(30),
                    onTap: () {
                      showImageOptions();
                    },
                    child: Container(
                      height: 180,
                      width: 120,
                    ),
                  ),
                ),
          Positioned(
            height: 50,
            bottom: 2,
            right: 0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                showImageOptions();
              },
              backgroundColor: Colors.purple,
              child: Icon(Icons.add),
              mini: true,
            ),
          )
        ],
      ),
    );
  }
}
