import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../userpage/userpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
//Permet de stocker les infos du token comme localStorage
import 'package:shared_preferences/shared_preferences.dart';

//Permet de decoder le token
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'dart:convert';
//Permet de convertir du json avec decode\encode
import 'package:http_interceptor/http_interceptor.dart';
import '../helpers/interceptor.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
      bool error=false;
      String errors='nothing';
  TextEditingController textController1;
  TextEditingController textController2;
  bool passwordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 210,
      fadeIn: true,
      slideOffset: Offset(-1, 12.999999999999986),
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, 9.000000000000014),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, 20),
    ),
  };

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    textController1 = TextEditingController();
    textController2 = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFCFEFF),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 119,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Image.asset(
                            'assets/images/Logo-uvs.jpg',
                          ).image,
                        ),
                      ),
                    ).animated([animationsMap['containerOnPageLoadAnimation']])
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    'Authentification',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Lato',
                      color: Color(0xE0000000),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animated([animationsMap['textOnPageLoadAnimation']]),
                ),

                error ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    this.errors ,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Lato',
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animated([animationsMap['textOnPageLoadAnimation']]),
                ): Container(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 325,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'votre email',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xE0000000),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.mail_outlined,
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xE0000000),
                                  fontWeight: FontWeight.w500,
                                ),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'email vide';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: TextFormField(
                                controller: textController2,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'votre password',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xE0000000),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.vpn_key_outlined,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xE0000000),
                                  fontWeight: FontWeight.w500,
                                ),
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'password vide';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                login(textController1.text,textController2.text);
                             /*   await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ProfilWidget(),
                                  ),
                                  (r) => false,
                                );*/
                              },
                              text: 'Se Connecter',
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Color(0xFF14181B),
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                elevation: 4,
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
                              text: 'Mot de passe oublié',
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Color(0xFFFCFEFF),
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xE0000000),
                                ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Color(0xFF14181B),
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            )
                          ],
                        ).animated(
                            [animationsMap['columnOnPageLoadAnimation']]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }





   login(username,password) async{

await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: ProfilWidget(user:user),
                                  ),
                                  (r) => false,
                                );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(username);
    print(password);
    String url = "http://fyhoqst6mapi.uvs.sn/api/login";
    var body={ 
      "email": username,
      "password": password
    };


  var res= await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"

        },
        body: json.encode(body)
    );
    print(res.statusCode);
    print(res.body);
  if(res.statusCode>=200 && res.statusCode < 400 ){
        
      var token=json.decode(res.body)['access_token'];
     
      prefs.setString('token', token);
       print(token);
      var etudiantId=json.decode(res.body)['etudiant_id'];
      prefs.setInt('etudiantId', etudiantId);
      //On utilise l interceptor pour ajouter le token et faire la requete
 var result = await InterceptedHttp.build(
        interceptors: [ Interceptor() ])
        .get(Uri.parse("http://fyhoqst6mapi.uvs.sn/api/etudiants/"+etudiantId.toString()));
   var user = json.decode(result.body);

   print(result.body);
     await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: UserPageWidget(user:user),
                                  ),
                                  (r) => false,
                                );




    /*  //DECODAGE DU TOKEN
      final String token =this.token;
      final parts = token.split('.');
      final payload = parts[1];
      final String decoded = B64urlEncRfc7515.decodeUtf8(payload);

      var tok =json.decode(decoded);
      prefs.setString('role', tok["roles"][0]);
      prefs.setInt('id', tok["id"] );*/
      //var id= tok['id'];
    
    }else{
      
      setState((){
        error=true;
        errors=json.decode(res.body)["error"];
      }) ;
      
    }
    
   }
}
