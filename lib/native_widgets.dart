library native_widgets;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Native Button
class NativeButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;

  NativeButton({
    this.child,
    this.onPressed,
    this.padding,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: padding == null ? EdgeInsets.all(0.0) : padding,
      child: Platform.isIOS
          ? CupertinoButton(
              padding: padding,
              color: buttonColor,
              child: child,
              onPressed: Feedback.wrapForTap(onPressed, context),
            )
          : FlatButton(
              color: buttonColor,
              padding: padding,
              child: child,
              onPressed: Feedback.wrapForTap(onPressed, context),
            ),
    ));
  }
}

// Native Dialog Action for Native Dialog
class NativeDialogAction {
  final String text;
  final bool isDestructive;
  final VoidCallback onPressed;

  NativeDialogAction(
      {@required this.text, this.isDestructive, @required this.onPressed});
}

// Native Dialog
class NativeDialog extends StatefulWidget {
  final String title;
  final String content;
  final TextStyle textStyle;
  final List<NativeDialogAction> actions;

  NativeDialog(
      {@required this.actions,
      this.title,
      @required this.content,
      this.textStyle});

  @override
  _NativeDialogState createState() => _NativeDialogState();
}

class _NativeDialogState extends State<NativeDialog> {
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS
        ? CupertinoAlertDialog(
            title: widget.title == null
                ? null
                : Text(
                    widget.title,
                    style: widget.textStyle,
                  ),
            content: Text(
              widget.content,
              style: widget.textStyle,
            ),
            actions: widget.actions
                .map((NativeDialogAction item) => CupertinoDialogAction(
                      child: Text(item.text),
                      isDestructiveAction: item.isDestructive,
                      onPressed: Feedback.wrapForTap(item.onPressed, context),
                    ))
                .toList())
        : AlertDialog(
            title: widget.title == null
                ? null
                : Text(
                    widget.title,
                    style: widget.textStyle,
                  ),
            content: Text(
              widget.content,
              style: widget.textStyle,
            ),
            actions: widget.actions
                .map((NativeDialogAction item) => FlatButton(
                      child: Text(
                        item.text,
                        style: TextStyle(
                            color:
                                item.isDestructive ? Colors.redAccent : null),
                      ),
                      onPressed: item.onPressed,
                    ))
                .toList()));
  }
}

// Native Loading Indicator
class NativeLoadingIndicator extends StatelessWidget {
  final Key key;

  NativeLoadingIndicator({this.key});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS
        ? CupertinoActivityIndicator(
            key: key,
            animating: true,
          )
        : CircularProgressIndicator(key: key));
  }
}

// Native Switch
class NativeSwitch extends StatelessWidget {
  final Key key;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  NativeSwitch(
      {this.key,
      @required this.value,
      @required this.onChanged,
      this.activeColor});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS
        ? CupertinoSwitch(
            key: key,
            value: value,
            onChanged: onChanged,
            activeColor:
                activeColor == null ? CupertinoColors.activeGreen : activeColor,
          )
        : Switch(
            key: key,
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
          ));
  }
}

// Native Tab Bar
class NativeBottomTabBar extends StatelessWidget {
  final Key key;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final Color activeColor;
  final double iconSize;
  final int currentIndex;

  NativeBottomTabBar(
      {this.key,
      @required this.items,
      this.onTap,
      this.activeColor,
      this.currentIndex,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS
        ? CupertinoTabBar(
            key: key,
            items: items,
            onTap: onTap,
            currentIndex: currentIndex == null ? 0 : currentIndex,
            activeColor:
                activeColor == null ? CupertinoColors.activeBlue : activeColor,
            backgroundColor: Colors.transparent,
            iconSize: iconSize == null ? 30.0 : iconSize,
          )
        : BottomNavigationBar(
            key: key,
            type: BottomNavigationBarType.fixed,
            onTap: onTap,
            currentIndex: currentIndex == null ? 0 : currentIndex,
            fixedColor: activeColor,
            items: items,
            iconSize: iconSize == null ? 30.0 : iconSize,
          ));
  }
}

// Native Scaffold (Issues with Tabs)
// class NativeAppBar extends StatelessWidget {
//   final Key key;
//   final Color backgroundColor;
//   // final Widget drawer;
//   final Widget title;
//   final List<Widget> actions;

//   // final TabBar bottom;

//   NativeAppBar({
//     this.key,
//     this.backgroundColor,
//     // this.drawer,
//     this.title,
//     this.actions,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return (Platform.isIOS
//         ? CupertinoNavigationBar(
//             middle: title,
//             backgroundColor:
//                 backgroundColor == null ? Colors.transparent : backgroundColor,
//             // leading: drawer,
//             trailing: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: actions.map((Widget item) => item).toList(),
//             ),
//           )
//         : AppBar(
//             backgroundColor: backgroundColor,
//             key: key,
//             title: title,
//             actions: actions,
//             // bottom: bottom,
//           ));
//   }
// }

// // body: Center(
// //   child: Column(
// //     mainAxisAlignment: MainAxisAlignment.center,
// //     mainAxisSize: MainAxisSize.max,
// //     crossAxisAlignment: CrossAxisAlignment.stretch,
// //     children: <Widget>[
// //       TabBar(
// //         tabs: [
// //           Tab(icon: Text('Share')),
// //           Tab(icon: Text('Details')),
// //         ],
// //       ),
// //       Expanded(
// //         child: TabBarView(
// //           children: [
// //             ConstrainedBox(
// //               constraints: const BoxConstraints.expand(),
// //               child: ShareVideoPage(),
// //             ),
// //             ConstrainedBox(
// //               constraints: const BoxConstraints.expand(),
// //               child: VideoDetailsPage(widget.canEdit),
// //             ),
// //           ],
// //         ),
// //       )
// //     ],
// //   ),
// // )
