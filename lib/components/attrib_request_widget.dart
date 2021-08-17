import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttribRequestWidget extends StatefulWidget {
  AttribRequestWidget({Key key}) : super(key: key);

  @override
  _AttribRequestWidgetState createState() => _AttribRequestWidgetState();
}

class _AttribRequestWidgetState extends State<AttribRequestWidget> {
  String dropDownValue;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'Commentaires');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Color(0xFFF7981A),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: FlutterFlowDropDown(
                  options: [
                    'Choisir un type',
                    'Clé/Modem Perdu',
                    'Clé/Modem Deffectueux\\n'
                  ],
                  onChanged: (value) {
                    setState(() => dropDownValue = value);
                  },
                  width: 130,
                  height: 40,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: FlutterFlowTheme.tertiaryColor,
                    size: 30,
                  ),
                  fillColor: Color(0xFFF7981A),
                  elevation: 2,
                  borderColor: FlutterFlowTheme.tertiaryColor,
                  borderWidth: 2,
                  borderRadius: 0,
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  hidesUnderline: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: TextFormField(
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Commentaires',
                labelStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
                hintText: 'Commentaires',
                hintStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.tertiaryColor,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.tertiaryColor,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                filled: true,
              ),
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.tertiaryColor,
              ),
              keyboardType: TextInputType.multiline,
            ),
          )
        ],
      ),
    );
  }
}
