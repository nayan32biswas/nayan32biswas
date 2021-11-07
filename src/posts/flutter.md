# Flutter

## Install in Linux

- `sudo snap install flutter --classic`
- `flutter doctor` test flutter envioroment.
- `flutter doctor -v` find flutter location info

## Project setup

- Add Flutter plugin
- Then Create new project with flutter.

### VSCode

- `flutter create <<app_name>>`
- `Run => Run Without Debuging`

## [Build .apk](https://flutter.dev/docs/deployment/android)

- `keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key` If you don't have any.
- Inside <<app_dir>>/android/key.properties
    ```properties
    storePassword=password
    keyPassword=password
    keyAlias=key
    storeFile=<full_path>/key.jks
    ```
- Inside <<app_dir>>/android/app/build.gradle
   1. Add code before **android** block:
   ```gradle
      def keystoreProperties = new Properties()
      def keystorePropertiesFile = rootProject.file('key.properties')
      if (keystorePropertiesFile.exists()) {
          keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
      }
   android {
       ...
   }
   ```
   2. Add code before **buildTypes** block:
   ```gradle
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }
   ```
- Reviewing the app manifest.
  1. Open `<app_dir>/android/app/src/main/AndroidManifest.xml`
  2. Change label as **app name**
  3. Add `<uses-permission android:name="android.permission.INTERNET"/>` before <application>...</application>If Internet access need.
  4. Also change other permission if needed.
- `flutter build apk` Build app.
- `flutter install` Install app in virtual device.
- Find apk file at <</<<project_full_path>>/build/app/outputs/apk/release/>>
