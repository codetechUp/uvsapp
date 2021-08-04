import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 210,
      fadeIn: true,
      slideOffset: Offset(-1, -3),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, 19),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 140,
      fadeIn: true,
      slideOffset: Offset(0, 11.000000000000014),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, 12.999999999999986),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 160,
      fadeIn: true,
      slideOffset: Offset(0, 12.000000000000014),
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      slideOffset: Offset(0, 10.000000000000014),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 120,
      fadeIn: true,
      slideOffset: Offset(-1, 12.999999999999986),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 160,
      fadeIn: true,
      slideOffset: Offset(2, 0),
    ),
  };
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ).animated([animationsMap['containerOnPageLoadAnimation1']])
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                              child: PageView(
                                controller: pageViewController,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Image.asset(
                                              'assets/images/Sans titre (23).png',
                                            ).image,
                                          ),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ).animated([
                                        animationsMap[
                                            'containerOnPageLoadAnimation2']
                                      ]),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                          textAlign: TextAlign.center,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ).animated([
                                          animationsMap[
                                              'textOnPageLoadAnimation1']
                                        ]),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Image.asset(
                                              'assets/images/Sans titre (24).png',
                                            ).image,
                                          ),
                                        ),
                                      ).animated([
                                        animationsMap[
                                            'containerOnPageLoadAnimation3']
                                      ]),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        child: Text(
                                          'Curabitur et mi tincidunt, auctor lectus quis,',
                                          textAlign: TextAlign.center,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ).animated([
                                          animationsMap[
                                              'textOnPageLoadAnimation2']
                                        ]),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Image.asset(
                                              'assets/images/Sans titre (25).png',
                                            ).image,
                                          ),
                                        ),
                                      ).animated([
                                        animationsMap[
                                            'containerOnPageLoadAnimation4']
                                      ]),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 5, 0),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                          textAlign: TextAlign.center,
                                          style:
                                              FlutterFlowTheme.title3.override(
                                            fontFamily: 'Poppins',
                                          ),
                                        ).animated([
                                          animationsMap[
                                              'textOnPageLoadAnimation3']
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 1),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: SmoothPageIndicator(
                                  controller: pageViewController,
                                  count: 3,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) {
                                    pageViewController.animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect: ExpandingDotsEffect(
                                    expansionFactor: 2,
                                    spacing: 8,
                                    radius: 16,
                                    dotWidth: 16,
                                    dotHeight: 16,
                                    dotColor: Color(0xFF9E9E9E),
                                    activeDotColor: Color(0xFF3F51B5),
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: LoginWidget(),
                    ),
                  );
                },
                text: 'Se connecter',
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
              ).animated([animationsMap['buttonOnPageLoadAnimation']])
            ],
          ),
        ),
      ),
    );
  }
}
