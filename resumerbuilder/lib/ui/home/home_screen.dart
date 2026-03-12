import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/config/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Swap with real data later
  static const int _resumeCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => context.push(Routes.profile),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(Assets.cvmaker),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CreateResumeCard(onTap: () => context.push(Routes.createtemp)),
            const SizedBox(height: 24),
            const Text(
              'My Resumes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _resumeCount == 0
                ? const _EmptyResumes()
                : _ResumeGrid(count: _resumeCount),
          ],
        ),
      ),
    );
  }
}

// ── Create Resume Card ────────────────────────────────────────────────────────

class _CreateResumeCard extends StatelessWidget {
  final VoidCallback onTap;
  const _CreateResumeCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Assets.cvmaker,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create CV',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Step-by-step CV creation',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Resume Grid ───────────────────────────────────────────────────────────────

class _ResumeGrid extends StatelessWidget {
  final int count;
  const _ResumeGrid({required this.count});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.72, // portrait ratio, like a real resume page
      ),
      itemBuilder: (context, index) => _ResumeGridItem(index: index),
    );
  }
}

class _ResumeGridItem extends StatelessWidget {
  final int index;
  const _ResumeGridItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push(Routes.preview, extra: index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            const Icon(
              Icons.description_outlined,
              size: 32,
              color: Colors.grey,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Text(
                'Resume ${index + 1}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Empty State ───────────────────────────────────────────────────────────────

class _EmptyResumes extends StatelessWidget {
  const _EmptyResumes();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.description_outlined, size: 52, color: Colors.grey),
            SizedBox(height: 12),
            Text(
              'No resumes yet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Tap "Create CV" to get started',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
