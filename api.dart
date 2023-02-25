import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  apiIBGES();
}

getAPI() {
  var url = Uri.https('jsonplaceholder.typicode.com', '/todos/1');
  var response = http.get(url);
  response.then((value) {
    print(jsonDecode(value.body));
    print(jsonDecode(value.body)['title']);
  });
}

getAPIS() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  var response = await http.get(url);
  print(jsonDecode(response.body)['title']);
}

apiIBGES() async {
  var name = "Jonathan";
  var url =
      Uri.parse('https://servicodados.ibge.gov.br/api/v2/censos/nomes/$name');
  var response = await http.get(url);
  var list = jsonDecode(response.body)[0]['res'];
  for (var i = 0; i < list.length; i++) {
    print(
        'Periodo: ${jsonDecode(response.body)[0]['res'][i]['periodo'].toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", " à ")} Frequencia: ${jsonDecode(response.body)[0]['res'][i]['frequencia'].toString()}');
  }
}

apiIBGE() {
  var name = "Jonathan";
  var url = Uri.https('servicodados.ibge.gov.br', '/api/v2/censos/nomes/$name');
  var response = http.get(url);
  response.then((value) {
    var list = jsonDecode(value.body)[0]['res'];
    for (var i = 0; i < list; i++) {
      print(jsonDecode(value.body)[0]['res'][i]);
    }
  });
}



//trazer todos os periodos e frequencia dos nomes