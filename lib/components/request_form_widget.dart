import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'eno_request_widget.dart';
import 'bourse_request_widget.dart';
import 'operateur_request_widget.dart';
import 'program_request_widget.dart';
import 'attrib_request_widget.dart';

class RequestFormWidget extends StatefulWidget {
  RequestFormWidget({Key key}) : super(key: key);

  @override
  _RequestFormWidgetState createState() => _RequestFormWidgetState();
}

class _RequestFormWidgetState extends State<RequestFormWidget> {
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF7981A),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Nouvelle Requete',
            textAlign: TextAlign.justify,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.tertiaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: FlutterFlowDropDown(
                options: ['Type de requete', 'Bourse', 'Changement d\'eno','Changement de cohorte','Changement d\'operateur','Changement de programme','Convention Stage','Forfait non positionné','Lettre de recommandation','Lettre de recupperration SIM','Nouvelle Attribution de cle/Modem'],
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
          getForm(dropDownValue),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Retour',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.tertiaryColor,
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF1E2428),
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Envoyer',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0xFFF7981A),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.tertiaryColor,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
 Widget getForm(dropDownValue){
    if(dropDownValue == 'Changement d\'eno'){
      return EnoRequestWidget();
    }else if(dropDownValue == 'Bourse')
    {
      return BourseRequestWidget();
    }else if(dropDownValue == 'Changement d\'operateur')
    {
      return OperateurRequestWidget();
    }else if(dropDownValue == 'Changement de programme')
    {
      return ProgramRequestWidget();
    }
    else if(dropDownValue == 'Nouvelle Attribution de cle/Modem')
    {
      return AttribRequestWidget();
    }
    
    else{
      return Container();
    }
  }
}
