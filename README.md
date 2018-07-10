# Native Widgets
[![pub package](https://img.shields.io/pub/v/native_widgets.svg)](https://pub.dartlang.org/packages/native_widgets)

A Flutter plugin to show the correct widgets for iOS and Android. 

Avoid duplicating code and just write once for supported widgets. 

Android will use Material Design and iOS will use Cupertino style widgets.

## Usage
To use this plugin, add `native_widgets` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Make sure you add the following permissions to your Android Manifest

## Usage
``` dart
// Import package
import 'package:native_widgets/native_widgets.dart';
```

### Button
``` dart
NativeButton(
    child: Text(
      'BUTTON TEXT HERE',
      textScaleFactor: 1.0,
    ),
    buttonColor: Colors.blue,
    padding: const EdgeInsets.all(10.0), // Add Padding (Optional)
    onPressed: () {
       // BUTTON PRESS ACTION HERE
    },
),
```

### Switch
``` dart
bool switchValue = false; // Set Inital Value
void handelChanged(bool value) {
 setState(() {
   switchValue = value; // Update the UI
 });
}
  
NativeSwitch(
    onChanged: handelChanged,
    value: switchValue,
),
```

### Native Dialog
``` dart
// Function used to generate the dialog
void showNativeDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    );
}

// Show the Pop Up
void showNativePopUp(BuildContext context) {
showNativeDialog<null>(
  context: context,
  child: NativeDialog(
    title: "TITLE HERE",
    content:
        'DETAIL HERE',
    actions: <NativeDialogAction>[
      NativeDialogAction(
          text: 'BUTTON 1 TEXT',
          isDestructive: false, // Set True to indicate with red accent
          onPressed: () {
            Navigator.pop(context);
            // BUTTON 1 ACTION
          }),
      NativeDialogAction(
          text: 'BUTTON 2 TEXT',
          isDestructive: false,  // Set True to indicate with red accent
          onPressed: () {
            Navigator.pop(context);
            // BUTTON 2 ACTION
          }),
    ],
  ));
}
```