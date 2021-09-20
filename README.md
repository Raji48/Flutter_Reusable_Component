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
