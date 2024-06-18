import 'package:flutter/material.dart';

class CustomScaffoldWithButton extends StatelessWidget {
  final Widget? titleWidget;
  final String? title;
  final List<Widget>? actions;
  final Widget body;
  final Widget? endDrawer;
  final PreferredSizeWidget? appBar;
  final List<Widget>? floatingButtons;

  const CustomScaffoldWithButton({
    super.key,
    required this.body,
    this.titleWidget,
    this.title,
    this.actions,
    this.endDrawer,
    this.appBar,
    this.floatingButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          (title != null
              ? AppBar(
                  title: Text(title ?? ''),
                  actions: actions,
                )
              : null),
      body: body,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...?floatingButtons,
          FloatingActionButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Icon(Icons.home),
          ),
        ],
      ),
      endDrawer: endDrawer,
    );
  }
}
