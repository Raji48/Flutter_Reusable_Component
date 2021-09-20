# socialauthapp

## **Flutter Social_Login**


![sociallogin](https://user-images.githubusercontent.com/75483357/133731467-ba093044-dc53-4806-9011-f2fdc89ed77b.gif)

```
Dependencies:
flutter_facebook_auth: ^3.5.1
firebase_auth: ^3.0.2
google_sign_in: ^5.0.7
twitter_login: ^4.0.1
auth_buttons: ^1.0.1+4
simple_auth: ^2.0.10
dio: ^4.0.0
simple_auth_flutter: ^2.0.11
```

 To get started with Firebase Auth for Flutter and Flutter Firebase configuration.
 
 To learn more about Firebase, please visit the "Firebase website".
 
 To complete Firebase configuration for both Android and IOS.Then enable twitter ,Facebook, Google Sign-in providers in authentication.

# Twitter Configuration 
## Android Integration 
 
 Add the intent filters in  android/app/src/main/AndroidManifest.xml
 
 ```
 <intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https"
        android:host="soucialauthapp.firebaseapp.com" />
</intent-filter>
```
## IOS Integration 
Add URLScheme with this example in  ios/Runner/Info.plist
```
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
```
### Example code
```
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
    apiKey: 'eA71Q6zMCA923p3TCueR3yij5', // Generated api key
    apiSecretKey: 'WSdEyx3480Rc3RZGn4cgoBUMjW2FQASaLZlxFUr6MBE7moLzNX', //Generated secretkey
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
```
# Facebook Configuration 

 Edit Your Resources and Manifest add this config in your android project.
 Open your /android/app/src/main/res/values/strings.xml file, or create one if it doesn't exists.
 Add the Following code to strings.xml.
 
## Android Integration 
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
  <string name="app_name">Flutter Facebook Auth Example</string>
  <string name="facebook_app_id">1365719610250300</string>
  <string name="fb_login_protocol_scheme">fb1365719610250300</string>
</resources>
```

Add the following uses-permission element after the application element in /android/app/src/main/AndroidManifest.xml file.
```
<uses-permission android:name="android.permission.INTERNET"/>
```
Add the following meta-data element, an activity for Facebook, and an activity and intent filter for Chrome Custom Tabs inside your application element

<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
```
 <activity android:name="com.facebook.FacebookActivity"
     android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation"
     android:label="@string/app_name" />
 <activity
     android:name="com.facebook.CustomTabActivity"
     android:exported="true">
     <intent-filter>
         <action android:name="android.intent.action.VIEW" />
         <category android:name="android.intent.category.DEFAULT" />
         <category android:name="android.intent.category.BROWSABLE" />
         <data android:scheme="@string/fb_login_protocol_scheme" />
     </intent-filter>
 </activity>
```
## IOS Integration 
