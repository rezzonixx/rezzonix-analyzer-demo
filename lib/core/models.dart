import 'dart:math';

enum OrganStatus { balanced, mild, attention, priority }

class OrganResult {
  final String name;
  final int score;
  final int load;
  final int balance;
  final int priority;
  final OrganStatus status;

  const OrganResult({
    required this.name,
    required this.score,
    required this.load,
    required this.balance,
    required this.priority,
    required this.status,
  });
}

List<OrganResult> demoOrganResults() {
  final rnd = Random(20260108);

  final organs = <String>[
    'Beyin',
    'Kalp',
    'Akciğer',
    'Karaciğer',
    'Mide',
    'Böbrek',
    'Bağırsak',
    'Pankreas'
  ];

  return organs.map((o) {
    int score = 35 + rnd.nextInt(55);
    int load = 20 + rnd.nextInt(70);
    int balance = 30 + rnd.nextInt(60);

    double pressure = (100 - score) * 0.6 + load * 0.4;
    int priority = (pressure / 20).ceil().clamp(1, 5);

    OrganStatus status;
    if (pressure < 35) {
      status = OrganStatus.balanced;
    } else if (pressure < 55) {
      status = OrganStatus.mild;
    } else if (pressure < 70) {
      status = OrganStatus.attention;
    } else {
      status = OrganStatus.priority;
    }

    return OrganResult(
      name: o,
      score: score,
      load: load,
      balance: balance,
      priority: priority,
      status: status,
    );
  }).toList();
}
