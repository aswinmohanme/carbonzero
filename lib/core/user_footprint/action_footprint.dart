class ActionFootprint {
  String datakey;
  String label;
  String fact;

  ActionFootprint(this.label, this.fact, this.datakey);

  ActionFootprint.fromJson(Map<String, dynamic> json) {
    datakey = json["key"];
    label = json["label"];
    fact = json["fact"];
  }
}
