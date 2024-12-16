enum Gender { male, female, other }

class SignUpUser {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final Gender gender;
  final DateTime dateOfBirth;

  SignUpUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
  });
}
