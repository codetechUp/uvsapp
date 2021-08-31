import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:page_transition/page_transition.dart';

//Permet de stocker les infos du token comme localStorage
import 'package:shared_preferences/shared_preferences.dart';

//Permet de decoder le token
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'dart:convert';
//Permet de convertir du json avec decode\encode
import 'package:http_interceptor/http_interceptor.dart';
import '../helpers/interceptor.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import '../classes/eno.dart';
import '../requete/requete_widget.dart';
import 'package:sweetalert/sweetalert.dart';

class EnoRequestWidget extends StatefulWidget {
  
  int id;
  EnoRequestWidget({this.id}) ;

  @override
  _EnoRequestWidgetState createState() => _EnoRequestWidgetState();
}

class _EnoRequestWidgetState extends State<EnoRequestWidget> {
  int anVal=0;
  String dropDownValue;
  TextEditingController textController;
List data = List();
    String _mySelection;
    String myEno="...";

  
  @override
  void initState()  { 
    super.initState();
    this.getAllRequest();
    textController = TextEditingController(text: 'Motifs');
    this.getUser();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:MediaQuery.of(context).size.height * 0.4,
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
                    'ENO Actuel',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    myEno,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
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
              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
              child:new DropdownButton(
                hint: Text(
                    'Selectionner',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                value:_mySelection,
              items: data.map((item) {
            return DropdownMenuItem(
              child: Text(item['lieu']),
              value: item['id'].toString(),
            );
          }).toList(),
          onChanged: (newVal) {
            
            setState(() {
              _mySelection = newVal;
              dropDownValue=newVal;
            });
          },
          
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
          ),
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
                    if(anVal==0 || dropDownValue==null){
                      //SweetAlert.show(context,subtitle: "Success!", style: SweetAlertStyle.success);
                       SweetAlert.show(context,subtitle: "Veuillez remplir tous les champs!", style: SweetAlertStyle.error);
                      }else{
                          addRequest(widget.id,anVal,dropDownValue,textController.text);
                      }

}
                 
                   
                    //SweetAlert.show(context,subtitle: "Success!", style: SweetAlertStyle.success);
                  ,
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

  getAllRequest() async {
var res= await http.get(Uri.parse("http://fyhoqst6mapi.uvs.sn/api/enos"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"

        }
      
    );
    var jsonData= json.decode(res.body);
    setState((){ data= jsonData; });
    print(data);
  /* var jsonData= json.decode(res.body);
    List<Eno> Request = [];

 for (var u in jsonData) {
   Eno eno = Eno(u["type"],u["id"]);
   Request.add(eno);
 }
 print(Request);*/
 
    
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
                      subtitle: "Succés",
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
   SweetAlert.show(context,subtitle: "Erreur", style: SweetAlertStyle.error);

  }
  }
}
