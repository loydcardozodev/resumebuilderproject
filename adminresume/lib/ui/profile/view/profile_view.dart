import 'package:adminresume/ui/profile/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminProfileViewModel(),
      child: const _ProfilePageBody(),
    );
  }
}

class _ProfilePageBody extends StatelessWidget {
  const _ProfilePageBody();

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileViewModel>(
      builder: (context, vm, _) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Page header ──────────────────────────────────────────────
                const _PageHeader(),
                const SizedBox(height: 32),

                // ── Content ──────────────────────────────────────────────────
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left column — avatar + quick info
                        SizedBox(width: 240, child: _AvatarCard(vm: vm)),
                        const SizedBox(width: 24),

                        // Right column — details
                        Expanded(
                          child: Column(
                            children: [
                              _AccountDetailsCard(vm: vm),
                              const SizedBox(height: 16),
                              _SecurityCard(vm: vm),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ── Page Header ───────────────────────────────────────────────────────────────

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF4F6AF5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'My Profile',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1D23),
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Manage your account information and settings',
            style: TextStyle(fontSize: 14, color: Color(0xFF8A8FA8)),
          ),
        ),
      ],
    );
  }
}

// ── Avatar Card ───────────────────────────────────────────────────────────────

class _AvatarCard extends StatelessWidget {
  const _AvatarCard({required this.vm});
  final AdminProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEFF5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gradient banner
          Container(
            height: 80,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4F6AF5), Color(0xFF7B5EF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),

          // Avatar overlapping the banner
          Transform.translate(
            offset: const Offset(0, -40),
            child: Column(
              children: [
                _AvatarWithEdit(vm: vm),
                const SizedBox(height: 12),
                Text(
                  vm.displayName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1D23),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  vm.email,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A8FA8),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                _RoleBadge(),
                const SizedBox(height: 20),

                // Divider
                const Divider(height: 1, color: Color(0xFFEEEFF5)),
                const SizedBox(height: 16),

                // Stats row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _MiniStat(label: 'Role', value: 'Admin'),
                      _VerticalDivider(),
                      _MiniStat(label: 'Status', value: 'Active'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Upload state feedback — outside the transform so it stays below
          if (vm.isUploading)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Color(0xFF4F6AF5),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Uploading photo...',
                    style: TextStyle(fontSize: 12, color: Color(0xFF8A8FA8)),
                  ),
                ],
              ),
            ),
          if (vm.errorMessage != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1F1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFFCDD2)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 14,
                      color: Color(0xFFE53935),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        vm.errorMessage!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFFE53935),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Avatar with Edit Button ───────────────────────────────────────────────────

class _AvatarWithEdit extends StatelessWidget {
  const _AvatarWithEdit({required this.vm});
  final AdminProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: _AdminAvatar(vm: vm, radius: 44),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Tooltip(
            message: 'Change photo',
            child: GestureDetector(
              onTap: vm.isUploading ? null : vm.pickAndUploadPhoto,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F6AF5),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Account Details Card ──────────────────────────────────────────────────────

class _AccountDetailsCard extends StatelessWidget {
  const _AccountDetailsCard({required this.vm});
  final AdminProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(
            icon: Icons.person_outline_rounded,
            title: 'Account Details',
          ),
          const SizedBox(height: 20),
          _DetailField(
            label: 'Display Name',
            value: vm.displayName,
            icon: Icons.badge_outlined,
          ),
          const SizedBox(height: 16),
          _DetailField(
            label: 'Email Address',
            value: vm.email,
            icon: Icons.mail_outline_rounded,
          ),
          const SizedBox(height: 16),
          _DetailField(
            label: 'Role',
            value: 'Administrator',
            icon: Icons.shield_outlined,
            isHighlighted: true,
          ),
        ],
      ),
    );
  }
}

// ── Security Card ─────────────────────────────────────────────────────────────

class _SecurityCard extends StatelessWidget {
  const _SecurityCard({required this.vm});
  final AdminProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(icon: Icons.lock_outline_rounded, title: 'Security'),
          const SizedBox(height: 20),
          _SecurityRow(
            icon: Icons.verified_user_outlined,
            label: 'Email verified',
            trailing: _StatusChip(
              label: 'Verified',
              color: const Color(0xFF22C55E),
              bgColor: const Color(0xFFEFFCF3),
            ),
          ),
          const Divider(height: 24, color: Color(0xFFEEEFF5)),
          _SecurityRow(
            icon: Icons.phonelink_lock_outlined,
            label: 'Two-factor authentication',
            trailing: _StatusChip(
              label: 'Not set',
              color: const Color(0xFF8A8FA8),
              bgColor: const Color(0xFFF4F5F9),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reusable Components ───────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  const _Card({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEEFF5), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F2FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: const Color(0xFF4F6AF5)),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1D23),
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}

class _DetailField extends StatelessWidget {
  const _DetailField({
    required this.label,
    required this.value,
    required this.icon,
    this.isHighlighted = false,
  });

  final String label;
  final String value;
  final IconData icon;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEEEFF5)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF8A8FA8)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8A8FA8),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isHighlighted
                        ? const Color(0xFF4F6AF5)
                        : const Color(0xFF1A1D23),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityRow extends StatelessWidget {
  const _SecurityRow({
    required this.icon,
    required this.label,
    required this.trailing,
  });

  final IconData icon;
  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF8A8FA8)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF3D4152),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.color,
    required this.bgColor,
  });

  final String label;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4F6AF5), Color(0xFF7B5EF8)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Administrator',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1D23),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF8A8FA8)),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 28, width: 1, color: const Color(0xFFEEEFF5));
  }
}

// ── Avatar ────────────────────────────────────────────────────────────────────

class _AdminAvatar extends StatelessWidget {
  const _AdminAvatar({required this.vm, required this.radius});

  final AdminProfileViewModel vm;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final url = vm.photoUrl;

    if (url != null && url.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        child: ClipOval(
          child: Image.network(
            url,
            width: radius * 2,
            height: radius * 2,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                _InitialsCircle(vm: vm, radius: radius),
          ),
        ),
      );
    }

    return _InitialsCircle(vm: vm, radius: radius);
  }
}

class _InitialsCircle extends StatelessWidget {
  const _InitialsCircle({required this.vm, required this.radius});

  final AdminProfileViewModel vm;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFFEEF1FF),
      child: Text(
        vm.initials,
        style: TextStyle(
          fontSize: radius * 0.55,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF4F6AF5),
        ),
      ),
    );
  }
}
