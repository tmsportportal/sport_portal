class RegisterDto {
  final String name;
  final String surname;
  final String email;
  final String password;

  RegisterDto(this.name, this.surname, this.email, this.password);

  Map<String, String> toJson() => {
        'name': name,
        'surname': surname,
        'email': email,
        'plainPassword': password,
      };
}
