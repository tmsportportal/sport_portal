class LoginDto {
  final String email;
  final String password;

  const LoginDto(this.email, this.password);

  Map<String, String> toJson() => {
        'email': email,
        'plainPassword': password,
      };
}
