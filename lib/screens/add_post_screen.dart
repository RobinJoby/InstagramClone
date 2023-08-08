// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/model/user_model.dart';
import 'package:instagram_clone/provider/file_user_provider.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  void postImage(
    String uid,
    String username,
    String profileImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profileImage,
      );

      if (res == 'Success') {
        setState(() {
          _isLoading = false;
        });
        showSnackBar('Posted', context);
        clearImage();
      }
      else{
        setState(() {
          _isLoading = false;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      setState(() {
          _isLoading = false;
        });
      showSnackBar(e.toString(), context);
    }

  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: const Text('Select Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(ctx).pop();
                  Uint8List im = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = im;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Chose from galary'),
                onPressed: () async {
                  Navigator.of(ctx).pop();
                  Uint8List im = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = im;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          );
        });
  }

  void clearImage()
  {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () async {
                  await _selectImage(context);
                },
                icon: const Icon(Icons.upload_file)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading:  IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: () => clearImage(),),
              title: const Text('Post To'),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () {
                      postImage(
                        user.uid,
                        user.username,
                        user.photoUrl,
                      );
                    },
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: blueColor,
                      ),
                    ))
              ],
            ),
            body: Column(children: [
              _isLoading ? const LinearProgressIndicator() : Container(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: 8,
                      decoration:const InputDecoration(
                          hintText: "Write a caption",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: AspectRatio(
                      aspectRatio: 487 / 451,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
          );
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }
}
