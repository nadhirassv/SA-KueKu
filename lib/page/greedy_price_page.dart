import 'package:flutter/material.dart';
import 'package:kue_ku/model/varian_model.dart';
import 'dart:core';

class DessertRecommendationGreedyPrice extends StatefulWidget {
  @override
  _DessertRecommendationState createState() => _DessertRecommendationState();
}

class _DessertRecommendationState
    extends State<DessertRecommendationGreedyPrice> {
  String? selectedFlavor1;
  String? selectedFlavor2;
  String? runTime;
  List<String> flavors = ['coklat', 'vanila', 'strawberry'];
  List<String> recommendations = [];
  Stopwatch stopwatch = Stopwatch();

  void recommendDesserts() {
    stopwatch.start();
    if (selectedFlavor1 != null && selectedFlavor2 != null) {
      recommendations =
          getRekomendasiDessert(desserts, selectedFlavor1!, selectedFlavor2!);
    }
    stopwatch.stop();
    Duration executionTime = stopwatch.elapsed;
    runTime =
        '${executionTime.inSeconds}.${executionTime.inMilliseconds.toString()}.${executionTime.inMicroseconds}s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Greedy Based On Price")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih dua rasa:'),
            DropdownButton<String>(
              hint: const Text('Pilih rasa pertama'),
              value: selectedFlavor1,
              onChanged: (String? newValue) {
                setState(() {
                  selectedFlavor1 = newValue;
                });
              },
              items: flavors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: const Text('Pilih rasa kedua'),
              value: selectedFlavor2,
              onChanged: (String? newValue) {
                setState(() {
                  selectedFlavor2 = newValue;
                });
              },
              items: flavors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  recommendDesserts();
                });
              },
              child: Text(selectedFlavor1 == null || selectedFlavor2 == null
                  ? 'Disable'
                  : 'Rekomendasikan Dessert'),
            ),
            const SizedBox(height: 20),
            const Text('Rekomendasi Paket Dessert:'),
            ...recommendations
                .map((recommendation) => Text(recommendation))
                .toList(),
            const SizedBox(height: 120),
            Center(
              child: Text(
                selectedFlavor1 == null || selectedFlavor2 == null
                    ? "Pilih Rasa Terlebih Dahulu"
                    : "Running Time : ${runTime ?? '0'}",
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> getRekomendasiDessert(
      List<Dessert> desserts, String rasa1, String rasa2) {
    List<String> rekomendasi = [];

    for (Dessert dessert in desserts) {
      VarianModel varianTerbaik = getVarianTerbaik(dessert, rasa1, rasa2);
      rekomendasi.add(
          '${dessert.name} dengan rasa ${varianTerbaik.rasa} (Rating: ${varianTerbaik.rating}, Harga: ${varianTerbaik.harga})');
    }

    return rekomendasi;
  }

  VarianModel getVarianTerbaik(Dessert dessert, String rasa1, String rasa2) {
    VarianModel varian1 = dessert.variants.firstWhere((v) => v.rasa == rasa1);
    VarianModel varian2 = dessert.variants.firstWhere((v) => v.rasa == rasa2);

    return varian1.harga < varian2.harga ? varian1 : varian2;
  }
}