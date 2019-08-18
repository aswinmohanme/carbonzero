class ActionFootprint {
  String datakey;
  String label;
  String fact;
  dynamic footprint_reduction_potential;

  ActionFootprint(
      this.label, this.fact, this.datakey, this.footprint_reduction_potential);

  ActionFootprint.fromJson(Map<String, dynamic> json) {
    datakey = json["key"];
    label = json["label"];
    fact = json["fact"];
    footprint_reduction_potential = json["footprint_reduction_potential"];
  }
}
