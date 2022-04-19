import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../add2/add2_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class Addd1Widget extends StatefulWidget {
  const Addd1Widget({Key key}) : super(key: key);

  @override
  _Addd1WidgetState createState() => _Addd1WidgetState();
}

class _Addd1WidgetState extends State<Addd1Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  File file;
  var files = <File>[];
  int indexFile = 0;

  var imageWidgets = <Widget>[];
  var chooses = <bool>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF050317),
        automaticallyImplyLeading: false,
        title: Text(
          'โพสต์ใหม่',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_right_alt_outlined,
              color: FlutterFlowTheme.of(context).primaryBtnText,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add2Widget(files: files,),
                ),
              );
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF0E0303),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              file == null ? showDemyImage() : Image.file(file),
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFF0E0303),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF0E0303),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.99, -0.92),
                      child: TextButton(
                          onPressed: () {
                            processTakePhoto(ImageSource.gallery);
                          },
                          child: Text(
                            'แกลเลอรี่',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                          )),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.33, -0.96),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'เลือกหลายรายการ',
                        icon: Icon(
                          Icons.content_copy,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 180,
                          height: 40,
                          color: Color(0xFF0E0303),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 10,
                              ),
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        // child: showImageGrid(),
                        child: imageWidgets.isEmpty
                            ? SizedBox()
                            : myShowImageGrid(),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.99, -1),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 30,
                        ),
                        onPressed: () {
                          processTakePhoto(ImageSource.camera);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container showDemyImage() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Image.network(
        'https://picsum.photos/seed/31/600',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  GridView myShowImageGrid() {
    return GridView.builder(
        itemCount: imageWidgets.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) => imageWidgets[index]);
  }

  GridView showImageGrid() {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      scrollDirection: Axis.vertical,
      children: imageWidgets,
    );
  }

  void createImageWidgets(File file) {
    var widget = SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          Image.file(
            file,
            fit: BoxFit.cover,
          ),
          Checkbox(
              value: chooses[indexFile],
              onChanged: (value) {
                print('onChabged Work at indexFlle ==>> $indexFile, value --> $value');
                 
                setState(() {
                 chooses[indexFile] = value;
                });
              }),
        ],
      ),
    );
    setState(() {
      imageWidgets.add(widget);
    });
  }

  Future<void> processTakePhoto(ImageSource source) async {
    var result = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (result != null) {
      setState(() {
        file = File(result.path);
        files.add(file);
        chooses.add(false);
        print('choose ==> $chooses');
        createImageWidgets(file);
      });
    }
  }
}
