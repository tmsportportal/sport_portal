import 'package:flutter/material.dart';
import 'package:sport_portal/src/core/l10n/app_localizations_context.dart';
import 'package:sport_portal/src/features/health_care/models/health_departments_list_model.dart';
import 'package:sport_portal/src/widgets/custom_scaffold_with_button.dart';
import 'package:sport_portal/src/widgets/state_control_widget.dart';

class DoctorsListScreen extends StatefulWidget {
  final int id;
  static const route = '/doctors_list';

  const DoctorsListScreen({super.key, required this.id});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  late HealthDepartmentsListModel departmentListModel;

  @override
  void initState() {
    // departmentListModel =
    //     healthDepartmentsList.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithButton(
      body: StateControlWidget(
        isLoading: false,
        isError: false,
        title: context.loc.doctors,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      if (departmentListModel.image != null)
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset(
                            "assets/images/sport_category/${departmentListModel.image}",
                          ),
                        ),
                      const SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          context.loc
                              .departmentName(departmentListModel.title)
                              .toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Theme.of(context).dividerColor),
                // for (var doctor in doctorsList) DoctorListTile(doctor: doctor),
              ],
            ),
          )
        ],
      ),
    );
  }
}
