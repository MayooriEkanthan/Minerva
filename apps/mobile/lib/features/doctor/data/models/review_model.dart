class ReviewModel {
  final String id;
  final String patientName;
  final String date;
  final double rating;
  final String reviewText;
  final String? doctorReply;

  const ReviewModel({
    required this.id,
    required this.patientName,
    required this.date,
    required this.rating,
    required this.reviewText,
    this.doctorReply,
  });
}
