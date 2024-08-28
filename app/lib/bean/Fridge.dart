class Fridge {
  int ?id;
  String ?name;

  Fridge({
    this.id,
    this.name,
  });

  Fridge.fromMap(Map map) {
    id = map["fridgeId"];
    name = map["fridgeName"];
  }
}