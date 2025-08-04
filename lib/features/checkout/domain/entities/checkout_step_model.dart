class CheckoutStepModel {
  final String stepTitle;
  final String stepIcon;
  final bool isChecked;

  CheckoutStepModel({
    required this.stepTitle,
    required this.stepIcon,
    required this.isChecked,
  });

  CheckoutStepModel copyWith({
    String? stepTitle,
    String? stepIcon,
    bool? isChecked,
  }) {
    return CheckoutStepModel(
      stepTitle: stepTitle ?? this.stepTitle,
      stepIcon: stepIcon ?? this.stepIcon,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
