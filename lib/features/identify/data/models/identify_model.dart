class IdentifyModel {
  final double confidence;
  final String predictedClass;

  IdentifyModel({
    required this.confidence,
    required this.predictedClass,
  });

  factory IdentifyModel.fromJson(Map<String, dynamic> json) {
    return IdentifyModel(
      confidence: json['confidence'] ?? 0.0,
      predictedClass: json['predicted_class'] ?? 'Unknown',
    );
  }
}
