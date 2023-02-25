import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  pokeAPI();
}

pokeAPI() async {
  var pokemon = "pikachu";
  var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemon');
  var response = await http.get(url);
  print(
      "Nome: ${jsonDecode(response.body)['forms'][0]['name']}\nPeso: ${jsonDecode(response.body)['weight']} \nTipo: ${jsonDecode(response.body)['types'][0]['type']['name']}  ");
}
