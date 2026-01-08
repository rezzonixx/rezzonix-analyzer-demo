import 'package:flutter/material.dart';

void main() {
  runApp(const RezzonixApp());
}

class RezzonixApp extends StatelessWidget {
  const RezzonixApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF050A14);
    const cyan = Color(0xFF27F3FF);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REZZONIX Analyzer',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          primary: cyan,
          secondary: cyan,
          surface: Color(0xFF0A1226),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF050A14),
          foregroundColor: cyan,
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF0A1226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REZZONIX • Analyzer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _Card(
              title: 'Profesyonel Analiz Paneli',
              subtitle: 'DEMO sürüm – sensörsüz',
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.grid_view_rounded,
              title: 'Organ Seçimi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrganSelectPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.sensors_rounded,
              title: 'Canlı Tarama',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScanPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            _ActionCard(
              icon: Icons.summarize_rounded,
              title: 'Genel Özet / Rapor',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OrganSelectPage extends StatelessWidget {
  const OrganSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    const organs = [
      'Sinir Sistemi',
      'Dolaşım',
      'Solunum',
      'Sindirim',
      'Kas – İskelet',
      'Deri',
      'Üriner',
      'Endokrin',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Organ Seçimi')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: organs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(
                organs[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  double progress = 0.1;
  bool running = false;

  void startScan() async {
    setState(() => running = true);
    while (running && progress < 1.0) {
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        progress += 0.02;
      });
    }
    setState(() => running = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Canlı Tarama')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                LinearProgressIndicator(value: progress),
                const SizedBox(height: 20),
                Text('${(progress * 100).toInt()} %'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: running ? null : startScan,
                  child: const Text('Tarama Başlat'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Genel Özet / Rapor')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: const _Card(
          title: 'Seans Özeti',
          subtitle:
              'Bu demo sürümde raporlar örnek amaçlıdır.\nPDF çıktısı sonraki sürümde.',
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon,
                  size: 32, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String subtitle;

  const _Card({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
