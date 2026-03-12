import 'package:flutter/material.dart';

class ResumePreview extends StatefulWidget {
  const ResumePreview({super.key});

  @override
  State<ResumePreview> createState() => _ResumePreviewState();
}

class _ResumePreviewState extends State<ResumePreview> {
  int _selectedThemeIndex = 0;
  bool _isDownloading = false;

  static const List<Color> _themeColors = [
    Colors.black,
    Colors.indigo,
    Colors.teal,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.brown,
  ];

  Future<void> _downloadPdf() async {
    setState(() => _isDownloading = true);
    await Future.delayed(const Duration(seconds: 2)); // replace with real logic
    if (mounted) setState(() => _isDownloading = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resume downloaded successfully!'),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Preview'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ResumeCanvas(accentColor: _themeColors[_selectedThemeIndex]),
            const SizedBox(height: 16),
            const Text(
              'Resume Preview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Review your resume before downloading or sharing. '
              'Ensure all sections are complete and accurate.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            const Text(
              'Customize Theme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _ThemePicker(
              colors: _themeColors,
              selectedIndex: _selectedThemeIndex,
              onSelected: (i) => setState(() => _selectedThemeIndex = i),
            ),
            const SizedBox(height: 24),
            const Text(
              'Download Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _DownloadButton(isLoading: _isDownloading, onTap: _downloadPdf),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ── Resume Canvas ─────────────────────────────────────────────────────────────

class _ResumeCanvas extends StatelessWidget {
  final Color accentColor;
  const _ResumeCanvas({required this.accentColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 460,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header accent bar
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 52,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Resume preview will appear here',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Theme Picker ──────────────────────────────────────────────────────────────

class _ThemePicker extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _ThemePicker({
    required this.colors,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.black : Colors.transparent,
                  width: 2.5,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: colors[index].withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          );
        },
      ),
    );
  }
}

// ── Download Button ───────────────────────────────────────────────────────────

class _DownloadButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const _DownloadButton({required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: isLoading
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Icon(Icons.picture_as_pdf_outlined),
        label: Text(
          isLoading ? 'Preparing PDF...' : 'Download as PDF',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
