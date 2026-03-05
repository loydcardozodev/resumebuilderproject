import 'package:flutter/material.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ===== Title =====
        const Text(
          "User Management",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 20),

        /// ===== Search & Filter =====
        Row(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search by email...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            DropdownButton<String>(
              value: "All",
              items: const [
                DropdownMenuItem(value: "All", child: Text("All Users")),
                DropdownMenuItem(value: "Active", child: Text("Active")),
                DropdownMenuItem(value: "Blocked", child: Text("Blocked")),
              ],
              onChanged: (value) {},
            ),
          ],
        ),

        const SizedBox(height: 30),

        /// ===== Users Table =====
        Expanded(
          child: SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("Resumes")),
                DataColumn(label: Text("Joined")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Actions")),
              ],
              rows: List.generate(5, (index) {
                return DataRow(
                  cells: [
                    DataCell(Text("User $index")),
                    DataCell(Text("user$index@email.com")),
                    DataCell(Text("${index + 1}")),
                    const DataCell(Text("12 Feb 2026")),
                    const DataCell(Text("Active")),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.block),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
