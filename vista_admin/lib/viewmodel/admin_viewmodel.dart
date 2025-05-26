import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_admin/bloc/admin_bloc.dart';
import 'package:vista_admin/doctor.dart';

class AdminViewModel {
  final AdminBloc adminBloc;

  AdminViewModel(this.adminBloc);

  void loadData() {
    adminBloc.add(LoadAdminData());
  }

  void updateRequestStatus(Doctor doctor, bool isAccepted) {
    adminBloc.add(UpdateRequestStatus(doctor, isAccepted));
  }
}