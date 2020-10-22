
import 'package:http/http.dart' as http;
//with get header
class CountryApi {
  Future<void> getCountry() async {
    try {
      print('into api');
      http.Response res = await http.get(
         'https://restcountries-v1.p.rapidapi.com/all',
          headers: {
            'x-rapidapi-host': 'restcountries-v1.p.rapidapi.com',
            'x-rapidapi-key':'2f9019c3f3msh3f84e87a73799dap1739e7jsna2fa48633ab3'
          });
     // Map country=jsonDecode(res.body);
print(res.body);

    } catch (e) {
      print(e);
    }
  }
}
