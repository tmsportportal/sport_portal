import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_portal/src/features/tv_channel/controller/tv_channel_controller.dart';

class TvChannelScreen extends StatefulWidget {
  const TvChannelScreen({super.key});

  @override
  State<TvChannelScreen> createState() => _TvChannelScreenState();
}

class _TvChannelScreenState extends State<TvChannelScreen> {
  final controller = GetIt.instance<TvChannelController>();

  @override
  void initState() {
    controller.doCalculation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          return ListView(
            children: controller.formattedStreams.entries.map(
              (e) {
                return ListTile(
                  onTap: () {
                    // showDialog(context: context, builder: builder);
                  },
                  title: Text(e.value.name ?? ''),
                  subtitle: Text('${e.value.urls?.length}'),

                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
