import 'package:flutter/material.dart';
import 'package:vista_admin/doctor.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B7280),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6B7280),
        title: Text(
          "${doctor.name.toUpperCase()}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "${doctor.category}, ${doctor.company}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.age,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            doctor.dateOfBirth,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            doctor.email,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            doctor.gender,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${doctor.experience} Experience",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            doctor.availability,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            doctor.fees,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            doctor.department,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: Text("Photo")),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Photo",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: Text("Certificate")),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Certificate",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}