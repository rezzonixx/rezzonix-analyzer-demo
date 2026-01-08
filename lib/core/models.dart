class OrganResult {
  final String organ;
  final int score; // 0–100
  final String status; // Normal, Dikkat, Risk
  final String description;

  OrganResult({
    required this.organ,
    required this.score,
    required this.status,
    required this.description,
  });
}

class DemoAnalyzer {
  static List<OrganResult> analyze() {
    return [
      OrganResult(
        organ: "Beyin",
        score: 78,
        status: "Dikkat",
        description: "Stres ve zihinsel yorgunluk belirtileri.",
      ),
      OrganResult(
        organ: "Kalp",
        score: 85,
        status: "Normal",
        description: "Fonksiyonlar dengeli.",
      ),
      OrganResult(
        organ: "Böbrek",
        score: 62,
        status: "Risk",
        description: "Sıvı dengesi ve filtrasyon zayıf.",
      ),
      OrganResult(
        organ: "Karaciğer",
        score: 70,
        status: "Dikkat",
        description: "Detoks yükü artmış.",
      ),
    ];
  }
}
