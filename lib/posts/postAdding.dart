import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  Color textColor = Colors.white;
  Color primaryColor = Colors.white54;
  File? _image;
  final picker = ImagePicker();

  Future getImage({required bool inGallery}) async {
    final pickedFile = await picker.pickImage(
      source: inGallery ? ImageSource.gallery : ImageSource.camera,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('images/hero_icon.png'),
                    SizedBox(width: 10,),
                    Text(
                      "Lương Văn Tuấn Kiệt",
                      style: TextStyle(color: textColor),
                    )
                  ],
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 3,
                  color: primaryColor,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: primaryColor,
                      width: 3.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: _image == null
                        ? Text('No image selected.')
                        : Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: ()=> getImage(inGallery: true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(100,50),
                        ),

                        child: Icon(Icons.photo_library)
                    ),
                    ElevatedButton(
                        onPressed: ()=> getImage(inGallery: false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(100,50),
                        ),
                        child: Icon(Icons.camera_alt)
                    )
                  ],
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                    onPressed: ()=> getImage(inGallery: false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(200,70),
                    ),
                    child: Text(
                      "Post",
                      style: TextStyle(color: textColor, fontSize: 28),
                    )
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
