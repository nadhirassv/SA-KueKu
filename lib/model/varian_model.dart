class VarianModel {
  String rasa;
  int rating;
  int harga;

  VarianModel({
    required this.rasa,
    required this.rating,
    required this.harga,
  });
}

class Dessert {
  String name;
  List<VarianModel> variants;

  Dessert(this.name, this.variants);
}

List<Dessert> desserts = [
  Dessert('Kue Bolu', [
    VarianModel(rasa: 'coklat', rating: 5, harga: 15000),
    VarianModel(rasa: 'vanila', rating: 7, harga: 14000),
    VarianModel(rasa: 'strawberry', rating: 4, harga: 16000),
  ]),
  Dessert('Minuman', [
    VarianModel(rasa: 'coklat', rating: 6, harga: 8000),
    VarianModel(rasa: 'vanila', rating: 5, harga: 7500),
    VarianModel(rasa: 'strawberry', rating: 3, harga: 9000),
  ]),
  Dessert('Ice Cream', [
    VarianModel(rasa: 'coklat', rating: 9, harga: 20000),
    VarianModel(rasa: 'vanila', rating: 8, harga: 19000),
    VarianModel(rasa: 'strawberry', rating: 7, harga: 18000),
  ]),
];
