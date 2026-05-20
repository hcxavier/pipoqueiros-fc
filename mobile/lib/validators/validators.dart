String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'O nome não pode estar vazio.';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'A senha não pode estar vazia.';
  }
  if (value.length < 8) {
    return 'A senha deve ter pelo menos 8 caracteres.';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'A senha deve conter pelo menos um número.';
  }
  if (!RegExp(r'[!@#\$&*~_.,;:<>?%^+=\-]').hasMatch(value)) {
    return 'A senha deve conter pelo menos um caractere especial.';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'O e-mail não pode estar vazio.';
  }
  if (!value.contains('@')) {
    return 'O e-mail deve conter "@"';
  }
  return null;
}

String? nameBettingGroupValidator(String? value) {
  if (value == null || value.trim().isEmpty || value.length < 3) {
    return 'O nome deve ter pelo menos 3 caracteres.';
  }
  return null;
}

String? codeBettingGroupValidator(String? value) {
  if (value == null || value.trim().isEmpty || value.length != 6) {
    return 'O código deve ter exatamente 6 caracteres.';
  }
  return null;
}
