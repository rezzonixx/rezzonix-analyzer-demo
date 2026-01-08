import 'package:flutter/material.dart';

class OrganSelectionScreen extends StatefulWidget {
  const OrganSelectionScreen({Key? key}) : super(key: key);

  @override
  State<OrganSelectionScreen> createState() => _OrganSelectionScreenState();
}

class _OrganSelectionScreenState extends State<OrganSelectionScreen> {
  String? selectedOrgan;

  final List<String> organs = [
    'Sinir Sistemi',
    'Beyin',
    'Solunum',
    'Sindirim',
    'Kas - İskelet',
    'Deri',
    'Üriner',
    'Endokrin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A2B),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Organ Seçimi'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: organs.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.6,
        ),
        itemBuilder: (context, index) {
          final organ = organs[index];
          final isSelected = selectedOrgan == organ;

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              setState(() {
                selectedOrgan = organ;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isSelected
                    ? Colors.cyanAccent.withOpacity(0.25)
                    : Colors.blue.withOpacity(0.15),
                border: Border.all(
                  color: isSelected ? Colors.cyanAccent : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  organ,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
