import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _imageFile;
  final _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image picker page'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        color: Colors.teal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                XFile? selectedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
                                if(selectedImage!= null){
                                  setState(() {
                                    _imageFile = File(selectedImage.path);
                                    Navigator.pop(context);
                                  });
                                }

                              },
                              child: Column(
                                children: [
                                  Icon(Icons.photo),
                                  SizedBox(height: 20,),
                                  Text('Gallery')
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.camera)),
             _imageFile != null? SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Image.file(File(_imageFile!.path,),fit: BoxFit.cover,)
              ):const SizedBox(),
            ],
          ),
        ));
  }
}
