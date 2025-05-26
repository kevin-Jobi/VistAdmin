import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_admin/doctor.dart';
import 'package:vista_admin/request_status.dart';


abstract class AdminEvent extends Equatable {
  const AdminEvent();
  @override
  List<Object> get props => [];
}

class LoadAdminData extends AdminEvent {}

class UpdateRequestStatus extends AdminEvent {
  final Doctor doctor;
  final bool isAccepted;

  const UpdateRequestStatus(this.doctor, this.isAccepted);

  @override
  List<Object> get props => [doctor, isAccepted];
}

class AdminState extends Equatable {
  final List<Doctor> doctors;
  final RequestStatus currentTab;

  const AdminState({
    required this.doctors,
    this.currentTab = RequestStatus.pending,
  });

  AdminState copyWith({
    List<Doctor>? doctors,
    RequestStatus? currentTab,
  }) {
    return AdminState(
      doctors: doctors ?? this.doctors,
      currentTab: currentTab ?? this.currentTab,
    );
  }

  @override
  List<Object> get props => [doctors, currentTab];
}

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc()
      : super(AdminState(doctors: [
          Doctor(
            name: "Akhil",
            category: "Tax Consultant",
            company: "Grow",
            experience: "12 years",
            photoUrl: "placeholder",
            age: "24 Year old",
            dateOfBirth: "26/03/2000",
            email: "akhil123@gmail.com",
            availability: "9:30 AM to 12:30 PM",
            fees: "500 RS",
            gender: "Male",
            department: "General",
            certificateUrl: "placeholder",
          ),
          Doctor(
            name: "Akhil",
            category: "Budget Advisor",
            company: "Grow",
            experience: "12 years",
            photoUrl: "placeholder",
            age: "24 Year old",
            dateOfBirth: "26/03/2000",
            email: "akhil123@gmail.com",
            availability: "9:30 AM to 12:30 PM",
            fees: "500 RS",
            gender: "Male",
            department: "General",
            certificateUrl: "placeholder",
          ),
          Doctor(
            name: "Najin",
            category: "Tax Consultant",
            company: "Grow",
            experience: "12 years",
            photoUrl: "placeholder",
            age: "24 Year old",
            dateOfBirth: "26/03/2000",
            email: "najin123@gmail.com",
            availability: "9:30 AM to 12:30 PM",
            fees: "500 RS",
            gender: "Male",
            department: "General",
            certificateUrl: "placeholder",
          ),
          Doctor(
            name: "Akshay",
            category: "Budget Advisor",
            company: "Market Feed",
            experience: "12 years",
            photoUrl: "placeholder",
            age: "24 Year old",
            dateOfBirth: "26/03/2000",
            email: "akshay123@gmail.com",
            availability: "9:30 AM to 12:30 PM",
            fees: "500 RS",
            gender: "Male",
            department: "General",
            certificateUrl: "placeholder",
          ),
          Doctor(
            name: "Sahad",
            category: "Tax Consultant",
            company: "Grow",
            experience: "12 years",
            photoUrl: "placeholder",
            age: "24 Year old",
            dateOfBirth: "26/03/2000",
            email: "sahad123@gmail.com",
            availability: "9:30 AM to 12:30 PM",
            fees: "500 RS",
            gender: "Male",
            department: "General",
            certificateUrl: "placeholder",
          ),
        ])) {
    on<LoadAdminData>((event, emit) {
      emit(state.copyWith());
    });

    on<UpdateRequestStatus>((event, emit) {
      final updatedDoctors = List<Doctor>.from(state.doctors);
      emit(state.copyWith(doctors: updatedDoctors));
    });
  }
}