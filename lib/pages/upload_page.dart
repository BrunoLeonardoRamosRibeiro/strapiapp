import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File _image;

  bool upload;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      upload = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Imagem'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 500,
                  width: 300,
                  child: _image == null
                      ? Image.asset(
                    "assets/images/camera.png",
                    width: 140,
                  )
                      : Image.file(_image),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Tirar Foto',
        child: Icon(Icons.camera),
      ),
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      // Upload da imagem
    });

    await uploadImage(image.path, image.readAsBytesSync());
  }

  Future uploadImage(String imageFilePath,
      Uint8List imageBytes,) async {
    String url = "https://superfan-strapi-api.herokuapp.com" + "/upload";
    PickedFile imageFile = PickedFile(imageFilePath);
    var stream =
    new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

    var uri = Uri.parse(url);
    int length = imageBytes.length;
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('files', stream, length,
        filename: basename(imageFile.path),
        contentType: MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}