String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Retorna a string original se estiver vazia
  }
  return input[0].toUpperCase() + input.substring(1);
}
