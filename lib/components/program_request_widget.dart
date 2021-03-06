import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramRequestWidget extends StatefulWidget {
  ProgramRequestWidget({Key key}) : super(key: key);

  @override
  _ProgramRequestWidgetState createState() => _ProgramRequestWidgetState();
}

class _ProgramRequestWidgetState extends State<ProgramRequestWidget> {
  String dropDownValue;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: 'Motifs');
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
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: FlutterFlowTheme.tertiaryColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Programe Actuel',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Licence Maths Appl..',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: FlutterFlowDropDown(
                options: ['Choisir un programme', 'Orange', 'Tigo'],
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
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: TextFormField(
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Motifs',
                labelStyle: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
                hintText: 'Motifs',
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




  getUser() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
   var etudiantId  =prefs.getInt('etudiantId',);
 var result = await InterceptedHttp.build(
        interceptors: [ Interceptor() ])
        .get(Uri.parse("http://fyhoqst6mapi.uvs.sn/api/etudiants/"+etudiantId.toString()));
   var user = json.decode(result.body);
   print(user);
setState((){
  anVal=user['_eno']['id'];
  myEno=user['_eno']['lieu'];
});


  }
   addRequest(type,anVal,newVal,raison) async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
   var etudiantId  =prefs.getInt('etudiantId'); 
    String url = "http://fyhoqst6mapi.uvs.sn/api/etudiants/"+etudiantId.toString()+"/requetes";
    var body={
    "type":type,
    "ancienne_valeur":anVal,
    "nouvelle_valeur":newVal,
    "raisons":raison
};

print(body);

var res=await InterceptedHttp.build(
        interceptors: [ Interceptor() ]).post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"

        },
        body: json.encode(body)
    );
    print(res.statusCode);
    print(res.body);
   
  if(res.statusCode>=200 && res.statusCode < 400 ){
     
 SweetAlert.show(context,
                      subtitle: "Succ??s",
                      style: SweetAlertStyle.success,
                       onPress: (bool isConfirm) {
                    if(isConfirm)  {
                       Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: RequeteWidget(),
                                  ),
                                  (r) => false,
                                );
  
                    // return false to keep dialog
                    return false;
                  }});
    /* await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ProfilWidget(user:user),
                                  ),
                                  (r) => false,
                                );*/
  }else{
   SweetAlert.show(context,subtitle: "Erreurnu", style: SweetAlertStyle.error);

  }
  }
}
