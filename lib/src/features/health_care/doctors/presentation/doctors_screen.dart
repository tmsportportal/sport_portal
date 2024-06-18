import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/health_care/doctors/data/dto/health_care_dto.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';

import '../../../../widgets/custom_expansion_list_tile.dart';
import '../../../../widgets/empty_widget.dart';
import '../../../../widgets/error_widget.dart';
import '../controller/health_care_controller.dart';
import 'local_widgets/doctor_list_tile.dart';

class DoctorsScreen extends StatefulWidget {
  static const route = r'/doctors';

  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final _controller = GetIt.instance<HealthCareController>();

  @override
  void initState() {
    _controller.fetchHealthCare();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      title: context.loc.doctors,
      actions: [
        IconButton(
          onPressed: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, _, __) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              onTap: () async {
                                final path =
                                    await getExternalStorageDirectory();
                                File file = File(
                                    '${path?.path}/medical_certificate.pdf');
                                ByteData bd = await rootBundle.load(
                                    'assets/pdfs/medical_certificate.pdf');
                                file
                                    .writeAsBytes(bd.buffer.asUint8List(),
                                        flush: true)
                                    .then(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${context.loc.successfullySaved}\n${path?.path}/medical_certificate.pdf'),
                                        ),
                                      ),
                                    );
                              },
                              title: Text(
                                  '${context.loc.certificateForAthlete}.pdf'),
                              trailing:
                                  const Icon(Icons.file_download_outlined),
                            ),
                            ListTile(
                              onTap: () async {
                                final path =
                                    await getExternalStorageDirectory();
                                File file =
                                    File('${path?.path}/medical_refferal.pdf');
                                ByteData bd = await rootBundle
                                    .load('assets/pdfs/medical_refferal.pdf');
                                file
                                    .writeAsBytes(bd.buffer.asUint8List(),
                                        flush: true)
                                    .then(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              '${context.loc.successfullySaved}\n${path?.path}/medical_refferal.pdf'),
                                        ),
                                      ),
                                    );
                              },
                              title: Text(
                                  '${context.loc.certificateForCoach}.pdf'),
                              trailing:
                                  const Icon(Icons.file_download_outlined),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.document_scanner_outlined),
        ),
        IconButton(
          onPressed: () {
            showGeneralDialog(
              context: context,
              pageBuilder: (context, _, __) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  'Медицинские осмотры спортсменов, взрослых и детей, проводятся в соответствии с Приказом МЗ РФот 23 октября 2020 г. N 1144н "Об утверждении порядка организации оказания медицинской помощи лицам, занимающимся физической культурой и спортом (в том числе при подготовке и проведении физкультурных мероприятий и спортивных мероприятий), включая порядок медицинского осмотра лиц, желающих пройти спортивную подготовку, заниматься физической культурой и спортом в организациях и (или) выполнить нормативы испытаний (тестов) Всероссийского физкультурно-спортивного комплекса "Готов к труду и обороне" (Г ТО)" и форм медицинских заключений о допуске к участию физкультурных и спортивных мероприятиях" Цены ниже муниципальных.'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.info_outline_rounded),
        ),
      ],
      body: Observer(builder: (context) {
        // if (_controller.healthCareList.value == null) {
        //   return const SizedBox();
        // }
        switch (_controller.healthCareList.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.rejected:
            return CustomErrorWidget(onError: () {
              _controller.fetchHealthCare();
            });
          case FutureStatus.fulfilled:
            if (_controller.healthCareList.value == null ||
                (_controller.healthCareList.value?.isEmpty ?? true)) {
              return const CustomEmptyWidget();
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                final department = _controller.healthCareList.value?[index];
                return CustomExpansionListTile(
                  // department: department,
                  title: department?.name?.toUpperCase() ?? '',
                  // image: department.image,

                  children: [
                    for (var doctor in department?.employees ?? <Employee>[])
                      DoctorListTile(
                        doctor: doctor,
                      ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, DoctorsListScreen.route,
                    //         arguments: {'category_id': department});
                    //   },
                    //   child: Text(context.loc.seeAll),
                    // ),
                  ],
                );
              },
              itemCount: _controller.healthCareList.value?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 15.0);
              },
            );
        }
      }),
    );
  }
}
