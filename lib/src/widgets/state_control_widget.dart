import 'package:flutter/material.dart';

import 'error_widget.dart';

class StateControlWidget extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final String? title;
  final Widget? titleWidget;
  final List<Widget> slivers;
  final VoidCallback? onErrorTap;
  final List<Widget>? actions;
  final double? toolbarHeight;

  const StateControlWidget(
      {super.key,
      required this.isLoading,
      required this.isError,
      this.title,
      this.titleWidget,
      required this.slivers,
      this.onErrorTap,
      this.actions,
      this.toolbarHeight});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: titleWidget ?? Text(title ?? ''),
          centerTitle: true,
          actions: actions,
          floating: true,
          toolbarHeight: toolbarHeight ?? kToolbarHeight,
        ),
        if (isLoading && !isError)
          const SliverFillRemaining(
            key: Key(r'loading'),
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        if (isError && !isLoading)
          SliverFillRemaining(
              hasScrollBody: false,
              key: const Key(r'error'),
              child: CustomErrorWidget(
                onError: onErrorTap,
              )),
        if (!isError && !isLoading) ...slivers
      ],
    );
  }
}
