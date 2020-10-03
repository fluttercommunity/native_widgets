part of native_widgets;

class NativeTopTabs extends StatelessWidget {
  final bool showMaterial;
  final Color selectedColor, borderColor, pressedColor;
  final ValueChanged<dynamic> onValueChanged;
  final dynamic groupValue;
  final List<Widget> tabs;
  final TabController tabController;

  NativeTopTabs({
    this.showMaterial = false,
    this.selectedColor,
    this.borderColor,
    this.pressedColor,
    this.onValueChanged,
    this.tabs,
    this.groupValue,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final bool _isIos = showCupertino(showMaterial: showMaterial);
    Map<int, Widget> iosTabs = <int, Widget>{};

    int _index = 0;
    for (Widget item in tabs) {
      iosTabs[_index] = item;
      _index++;
    }

    if (_isIos) {
      return CupertinoSegmentedControl<dynamic>(
        selectedColor: selectedColor,
        borderColor: borderColor,
        onValueChanged: onValueChanged,
        pressedColor: pressedColor,
        children: iosTabs,
        groupValue: groupValue,
      );
    }

    if (tabController != null) {
      return TabBar(
        controller: tabController,
        tabs: tabs,
        labelColor: selectedColor,
        onTap: onValueChanged,
      );
    }
    
    return DefaultTabController(
      length: tabs.length,
      child: TabBar(
        tabs: tabs,
        labelColor: selectedColor,
        onTap: onValueChanged,
      ),
    );
  }
}
