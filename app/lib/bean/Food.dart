class Food {
  int ?id;
  String ?name;
  String ?username;
  DateTime ?bestBefore;
  int ?isUsed;
  DateTime ?openTime;

  Food({
    this.id,
    this.name,
    this.username,
    this.bestBefore,
    this.isUsed = 0, // 设置默认值为0
  });

  Food.fromMap(Map map) {
    id = map["foodId"];
    name = map["foodName"];
    username = map["ownerName"];
    bestBefore = DateTime.parse(map["qualityTime"]) ;
    isUsed = map["isUsed"];
    openTime = map["openTime"] == null ? null : DateTime.parse(map["openTime"]);
  }}