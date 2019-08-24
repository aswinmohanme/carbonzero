class ActionFootprint {
  String datakey;
  String label;
  String fact;
  double footprintReductionPotential;

  ActionFootprint(
      this.label, this.fact, this.datakey, this.footprintReductionPotential);

  ActionFootprint.fromJson(Map<String, dynamic> json) {
    datakey = json["key"];
    label = json["label"];
    fact = json["fact"] ?? "";
    footprintReductionPotential =
        json["footprint_reduction_potential"].toDouble() ?? 0.0;
  }
}
