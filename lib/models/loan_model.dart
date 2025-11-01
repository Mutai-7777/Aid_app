class MicroLoan {
  final String id;
  final String requesterName;
  final double amount;
  final String purpose;
  double repaid;

  MicroLoan({
    required this.id,
    required this.requesterName,
    required this.amount,
    required this.purpose,
    this.repaid = 0,
  });
}
