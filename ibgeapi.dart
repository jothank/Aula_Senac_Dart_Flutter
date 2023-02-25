import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  apiIBGES();
}

apiIBGES() async {
  var name = "Ana";
  var url =
      Uri.parse('https://servicodados.ibge.gov.br/api/v2/censos/nomes/$name');
  var response = await http.get(url);
  var list = jsonDecode(response.body)[0]['res'];
  for (var i = 0; i < list.length; i++) {
    print(
        'Periodo: ${jsonDecode(response.body)[0]['res'][i]['periodo'].toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", " à ")} Frequencia: ${jsonDecode(response.body)[0]['res'][i]['frequencia'].toString()}');
  }
}
