class DisputeReason {
  final String label;
  late bool selected;

  DisputeReason(this.label, this.selected);

  DisputeReason.fromJson(Map<String, dynamic> json)
      : label = json['label'],
        selected = json['selected'];

  Map<String, dynamic> toJson() => {
        'label': label,
        'selected': selected,
      };
}
