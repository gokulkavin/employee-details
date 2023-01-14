import 'package:detail/login.dart';
import 'package:detail/employee_provider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text(
          "Employee Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              color: Colors.black,
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Login())),
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Consumer<EmployeProvider>(
        builder: (context, value, child) {
          var data = value.showItems();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final currentItem = data.reversed.toList()[index];
                return Card(
                  color: Colors.lightBlue[300],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Name:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(currentItem['name']),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Email:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(currentItem['email']),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Age:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(currentItem['age'].toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "DOB:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(currentItem['date'].toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Designation:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(currentItem['designation'].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
