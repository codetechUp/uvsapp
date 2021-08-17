import '../components/request_form_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequeteWidget extends StatefulWidget {
  RequeteWidget({Key key}) : super(key: key);

  @override
  _RequeteWidgetState createState() => _RequeteWidgetState();
}

class _RequeteWidgetState extends State<RequeteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: RequestFormWidget(),
              );
            },
          );
        },
        backgroundColor: Color(0xFFF7981A),
        elevation: 8,
        child: IconButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return RequestFormWidget();
              },
            );
          },
          icon: Icon(
            Icons.add,
            color: FlutterFlowTheme.tertiaryColor,
            size: 30,
          ),
          iconSize: 30,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.03, -1),
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7981A),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: Alignment(0, 0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: IconButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            size: 33,
                                          ),
                                          iconSize: 33,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(),
                                    child: Align(
                                      alignment: Alignment(0, 0),
                                      child: Text(
                                        'Requete',
                                        style: FlutterFlowTheme.title1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Icon(
                                      Icons.graphic_eq_rounded,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      size: 36,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.15),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 455,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.tertiaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                child: Text(
                                  'Vos Requetes Actuelles',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
