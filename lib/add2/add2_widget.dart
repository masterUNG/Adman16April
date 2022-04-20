// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:adman/states/add_post_to_firebase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../add3/add3_widget.dart';
import '../addd1/addd1_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';

class Add2Widget extends StatefulWidget {
  final List<File> files;
  const Add2Widget({
    Key key,
    this.files,
  }) : super(key: key);

  @override
  _Add2WidgetState createState() => _Add2WidgetState();
}

class _Add2WidgetState extends State<Add2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0E0303),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addd1Widget(),
              ),
            );
          },
        ),
        title: Text(
          'สร้างฟิลเตอร์',
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
                  // builder: (context) => Add3Widget(files: widget.files,),
                   builder: (context) => AddPostToFirebase(files: widget.files),
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
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xFF0E0303),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.92, 0.46),
                      child: Text(
                        'ฟิลเตอร์1',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.08, -0.98),
                      child: Text(
                        'เลือกฟิลเตอร์',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.25),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                'https://picsum.photos/seed/31/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/31/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/31/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/31/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/139/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.83),
                      child: Image.network(
                        'https://picsum.photos/seed/31/600',
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.29, 0.45),
                      child: Text(
                        'ฟิลเตอร์2',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.39, 0.46),
                      child: Text(
                        'ฟิลเตอร์3',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.96, 0.46),
                      child: Text(
                        'ฟิลเตอร์4',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
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
}
