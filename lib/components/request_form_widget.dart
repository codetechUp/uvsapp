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

class RequestFormWidget extends StatefulWidget {
  RequestFormWidget({Key key}) : super(key: key);

  @override
  _RequestFormWidgetState createState() => _RequestFormWidgetState();
}

class _RequestFormWidgetState extends State<RequestFormWidget> {
  String dropDownValue;
  int id;
    List data = List();
    String _mySelection;

   
  @override
  void initState()  { 
    super.initState();
    this.getAllRequest();
   
  }

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
              padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
              child:new DropdownButton(
                hint: Text("Select"),
                value:_mySelection,
              items: data.map((item) {
            return DropdownMenuItem(
              child: Text(item['type']),
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
          getForm(dropDownValue),
         
        ],
      ),
    );
  }
 Widget getForm(dropDownValue){
   for(var item in data){
    
     if(item["id"].toString() == dropDownValue){
       print('true');
       dropDownValue=item['type'];
       id=item['id'];
     }
   }
    if(dropDownValue == 'Changement d\'ENO'){
      return EnoRequestWidget(id:id);
    }else if(dropDownValue == 'Bourse')
    {
      return BourseRequestWidget();
    }else if(dropDownValue == 'Changement d\'opérateur')
    {
      return OperateurRequestWidget();
    }else if(dropDownValue == 'Changement de filière')
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
getAllRequest() async {
var res= await http.get(Uri.parse("http://fyhoqst6mapi.uvs.sn/api/types-requetes"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"

        }
      
    );
    var jsonData= json.decode(res.body);
    setState((){ data= jsonData; });

  /* var jsonData= json.decode(res.body);
    List<Eno> Request = [];

 for (var u in jsonData) {
   Eno eno = Eno(u["type"],u["id"]);
   Request.add(eno);
 }
 print(Request);*/
 
    
  }
}
