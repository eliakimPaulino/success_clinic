class KValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório.';
    }

    // Expressão regular para validação de email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Endereço de email inválido.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória.';
    }

    // Verifica o tamanho mínimo da senha
    if (value.length < 6) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }

    // Verifica se há letras maiúsculas
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A senha deve conter pelo menos uma letra maiúscula.';
    }

    // Verifica se há números
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'A senha deve conter pelo menos um número.';
    }

    // Verifica se há caracteres especiais
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'A senha deve conter pelo menos um caractere especial.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Número de telefone é obrigatório.';
    }

    // Expressão regular para validação de número de telefone (assumindo formato de 10 dígitos dos EUA)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Formato de número de telefone inválido (são necessários 10 dígitos).';
    }

    return null;
  }

  // Adicionar conforme necessário para requisitos específicos.
}
