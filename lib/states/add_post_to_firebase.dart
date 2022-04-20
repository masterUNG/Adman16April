// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:adman/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddPostToFirebase extends StatefulWidget {
  final List<File> files;
  const AddPostToFirebase({
    Key key,
    @required this.files,
  }) : super(key: key);

  @override
  State<AddPostToFirebase> createState() => _AddPostToFirebaseState();
}

class _AddPostToFirebaseState extends State<AddPostToFirebase> {
  var user = FirebaseAuth.instance.currentUser;

  String article, link, nameButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('uid ===> ${user.uid}'),
            SizedBox(
              width: 250,
              child: TextFormField(
                onChanged: (value) => article = value.trim(),
                decoration: InputDecoration(
                  label: Text('ข้อความ'),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                onChanged: (value) => link = value.trim(),
                decoration: InputDecoration(
                  label: Text('Link'),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                onChanged: (value) => nameButton = value.trim(),
                decoration: InputDecoration(
                  label: Text('ชื่อปุ่ม'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                processAddPost();
              },
              child: Text('Add Post'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> processAddPost() async {
    var urlPaths = <String>[];

    for (var item in widget.files) {
      String nameImage = '${Random().nextInt(100000)}.jpg';
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      Reference reference = firebaseStorage.ref().child('post/$nameImage');
      UploadTask uploadTask = reference.putFile(item);
      await uploadTask.whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          urlPaths.add(value);
        });
      });
    }

    print('urlPaths ==> $urlPaths');

    PostModel postModel = PostModel(
        uidPost: user.uid,
        urlPaths: urlPaths,
        article: article,
        link: link,
        nameButton: nameButton);

    await FirebaseFirestore.instance
        .collection('post')
        .doc()
        .set(postModel.toMap())
        .then((value) {
      print('Post Success');
    });
  }
}
