import 'package:covid19/utils/imports.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      moveToNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 48,
            ),
            Text(
              Strings.appName,
              style: CustomStyle.styleBold
                  .copyWith(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  moveToNext() {
    Timer(Duration(seconds: 3), () async {
      navigatorPush(scaffoldKey.currentContext, OnBoarding(), isReplaced: true);
    });
  }
}
