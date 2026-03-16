import 'package:adminresume/data/models/admin_user/admin_user.dart';
import 'package:adminresume/ui/user/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({super.key});

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  String _filterStatus = 'All';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserViewModel>().loadUsers();
    });
  }

  List<AdminUser> _applyFilter(List<AdminUser> users) {
    switch (_filterStatus) {
      case 'Active':
        return users.where((u) => !u.isBlocked).toList();
      case 'Blocked':
        return users.where((u) => u.isBlocked).toList();
      default:
        return users;
    }
  }

  void _showResumesDialog(BuildContext context, AdminUser user) async {
    final vm = context.read<UserViewModel>();
    await vm.loadUserResumes(user.uid);

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('${user.name}\'s Resumes'),
        content: SizedBox(
          width: 400,
          child: Consumer<UserViewModel>(
            builder: (context, vm, _) {
              if (vm.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (vm.selectedUserResumes.isEmpty) {
                return const Text('No resumes found.');
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: vm.selectedUserResumes.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final resume = vm.selectedUserResumes[index];
                  return ListTile(
                    leading: const Icon(Icons.description_outlined),
                    title: Text(resume['title'] as String? ?? 'Untitled'),
                    subtitle: Text(resume['createdAt'] as String? ?? ''),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, AdminUser user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete User'),
        content: Text(
          'Are you sure you want to delete "${user.name}"? This will also delete all their resumes.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(ctx);
              await context.read<UserViewModel>().deleteUser(user.uid);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, vm, _) {
        final users = _applyFilter(vm.filtered);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Title ────────────────────────────────────────────────────
            const Text(
              'User Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // ── Search & Filter ──────────────────────────────────────────
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    onChanged: vm.updateSearch,
                    decoration: InputDecoration(
                      hintText: 'Search by name or email...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                DropdownButton<String>(
                  value: _filterStatus,
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All Users')),
                    DropdownMenuItem(value: 'Active', child: Text('Active')),
                    DropdownMenuItem(value: 'Blocked', child: Text('Blocked')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _filterStatus = value);
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            if (vm.errorMessage != null)
              _ErrorBanner(
                message: vm.errorMessage!,
                onRetry: () => vm.loadUsers(),
              ),

            // ── Table ────────────────────────────────────────────────────
            if (vm.isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Resumes')),
                      DataColumn(label: Text('Joined')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: users.map((user) {
                      return DataRow(
                        cells: [
                          DataCell(Text(user.name)),
                          DataCell(Text(user.email)),
                          DataCell(
                            GestureDetector(
                              onTap: () => _showResumesDialog(context, user),
                              child: Text(
                                user.resumeCount.toString(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              DateFormat('dd MMM yyyy').format(user.joinedAt),
                            ),
                          ),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: user.isBlocked
                                    ? Colors.red.shade100
                                    : Colors.green.shade100,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                user.isBlocked ? 'Blocked' : 'Active',
                                style: TextStyle(
                                  color: user.isBlocked
                                      ? Colors.red.shade800
                                      : Colors.green.shade800,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  tooltip: user.isBlocked ? 'Unblock' : 'Block',
                                  icon: Icon(
                                    user.isBlocked
                                        ? Icons.lock_open
                                        : Icons.block,
                                    color: user.isBlocked
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                  onPressed: vm.isActionLoading
                                      ? null
                                      : () => context
                                            .read<UserViewModel>()
                                            .blockUser(
                                              user.uid,
                                              !user.isBlocked,
                                            ),
                                ),
                                IconButton(
                                  tooltip: 'Delete',
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: vm.isActionLoading
                                      ? null
                                      : () => _confirmDelete(context, user),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.error_outline, color: Colors.red),
        const SizedBox(width: 8),
        Expanded(
          child: Text(message, style: const TextStyle(color: Colors.red)),
        ),
        TextButton(onPressed: onRetry, child: const Text('Retry')),
      ],
    );
  }
}
