import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_admin/bloc/admin_bloc.dart';
import 'package:vista_admin/viewmodel/admin_viewmodel.dart';

import 'doctor_details_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});

  final List<String> tabs = ["PENDING", "APPROVED", "REJECTED"];

  @override
  Widget build(BuildContext context) {
    final adminViewModel = AdminViewModel(BlocProvider.of<AdminBloc>(context));
    adminViewModel.loadData();

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B7280),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.trending_up,
                size: 20,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "ZESTORA",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              "Admin Module",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      body: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          return Row(
            children: [
              Container(
                width: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ...tabs.map((tab) => GestureDetector(
                          onTap: () {
                            adminViewModel.adminBloc.add(LoadAdminData());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            color: tab == tabs[state.currentTab.index]
                                ? Colors.blue.withOpacity(0.1)
                                : Colors.transparent,
                            child: Text(
                              tab,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: state.doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = state?.doctors[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(radius: 30),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor?.name ?? 'Unknown',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("Category: ${doctor?.category ?? 'Unknown'}"),
                                      Text("Company: ${doctor?.company ?? 'Unknown'}"),
                                      Text("Experience: ${doctor?.experience ?? 'Unknown'}"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (doctor != null) {
                                      adminViewModel.updateRequestStatus(doctor, true);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  child: const Text("Accept"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (doctor != null) {
                                      adminViewModel.updateRequestStatus(doctor, false);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text("Decline"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DoctorDetailsScreen(doctor: doctor!),
                                      ),
                                    );
                                  },
                                  child: const Text("Profile"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}