import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:taskmanager/platform/login_platform.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import "package:googleapis_auth/auth_io.dart" as auth;
import "package:http/http.dart" as http;

var scopes = [
  calendar.CalendarApi.calendarScope,
  calendar.CalendarApi.calendarEventsScope
];
var googleUser = GoogleSignIn(scopes: [
  calendar.CalendarApi.calendarScope,
  calendar.CalendarApi.calendarEventsScope
]);

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  void signInWithGoogle() async {
    final googleSigninAccount = await googleUser.signIn();

    if (googleUser != null) {
      print('$googleUser');
      print('name = ${googleUser.currentUser!.displayName}');
      print('email = ${googleUser.currentUser!.email}');
      print('id = ${googleUser.authenticatedClient()}');

      setState(() {
        _loginPlatform = LoginPlatform.google;
      });
    } else {
      print("can't login");
    }
    getCalendars(googleSigninAccount);
  }

  void getCalendars(googleSigninAccount) async {
    final GoogleSignInAuthentication googleAuth =
        await googleSigninAccount.authentication;
    auth.AccessToken token = auth.AccessToken("Bearer", googleAuth.accessToken!,
        DateTime.now().add(const Duration(days: 1)).toUtc());
    http.Client client = http.Client();

    calendar.CalendarApi calendarApi;

    // var resp = await client.get(url);
    // print('body : ${resp.body}');
    auth.AuthClient authClient = auth.authenticatedClient(
        client, auth.AccessCredentials(token, googleSigninAccount.id, scopes));
    calendarApi = calendar.CalendarApi(authClient);
    try {
      print(calendar.CalendarListEntry().id);
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.facebook:
        break;
      case LoginPlatform.google:
        await GoogleSignIn().signOut();
        break;
      case LoginPlatform.kakao:
        break;
      case LoginPlatform.naver:
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _loginPlatform != LoginPlatform.none
              ? _logoutButton()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loginButton(
                      'google_logo',
                      signInWithGoogle,
                    )
                  ],
                )),
    );
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('asset/$path.png'),
        width: 60,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}
