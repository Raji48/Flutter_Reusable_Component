# socialauthapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
![sociallogin](https://user-images.githubusercontent.com/75483357/133731467-ba093044-dc53-4806-9011-f2fdc89ed77b.gif)

Dependencies:

flutter_facebook_auth: ^3.5.1
firebase_auth: ^3.0.2
google_sign_in: ^5.0.7
twitter_login: ^4.0.1
auth_buttons: ^1.0.1+4
simple_auth: ^2.0.10
dio: ^4.0.0
simple_auth_flutter: ^2.0.11

To get started with Firebase Auth for Flutter, please see the documentation.
To learn more about Firebase, please visit the Firebase website
To complete Firebase configuration for both Android and IOS.Then enable twitter ,Facebook, Google Sign-in providers in authentication.

Twitter Configuration #

Android Integration #
Add intent filters in  android/app/src/main/AndroidManifest.xml


<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https"
        android:host="soucialauthapp.firebaseapp.com" />
</intent-filter>

iOS Integration#

Add URLScheme with this example in  ios/Runner/Info.plist

<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLName</key>
    <string></string>
    <key>CFBundleURLSchemes</key>
    <array>
      <!-- Registered Callback URLs in TwitterApp -->
      <string>'soucialauthapp://'</string>
    </array>
  </dict>
</array>

Example #

//Twitter login
Container(
  child: twitterlog?Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
       Text("Username: "+twitterusername),
        TextButton(onPressed: (){
          setState(() {
            twitterlog=false;
          });
          signOuttwitter();
        },child:
        Text("Logout"))
      ]
  ):
      Center(
      child:
    TwitterAuthButton(
      onPressed: () async {
        await twitterlogin();
      },
      darkMode: false,
      //isLoading: false,
      style: const AuthButtonStyle(
        buttonType: AuthButtonType.secondary,
        iconType: AuthIconType.outlined,
      ),
    ))),

//Twitter login Method

Future twitterlogin() async {
  final twitterLogin = TwitterLogin(
    apiKey: 'eA71Q6zMCA923p3TCueR3yij5',
    apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX',
    redirectURI: 'https://soucialauthapp.firebaseapp.com/__/auth/handler', //'soucialauthapp://'  for ios redirectURI
  );
  final authResult = await twitterLogin.login();
  switch (authResult.status) {
    case TwitterLoginStatus.loggedIn:
    // success
      print('====== Login success ======');
      twitterusername=authResult.user!.name.toString();
      print(authResult.user!.email.toString());
      setState(() {
        twitterlog=true;
      });
      break;
    case TwitterLoginStatus.cancelledByUser:
    // cancel
      print('====== Login cancel ======');
      break;
    case TwitterLoginStatus.error:
    case null:
    // error
      print('====== Login error ======');
      break;
  }
}

