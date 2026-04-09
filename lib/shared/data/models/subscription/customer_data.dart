/// Customer data for creating Stripe customer
class CustomerData {
  final String email;
  final String name;
  final String? phone;

  const CustomerData({
    required this.email,
    required this.name,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        if (phone != null) 'phone': phone,
      };
}
