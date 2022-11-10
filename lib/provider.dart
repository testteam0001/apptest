import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';

class BussProviders{
  Uri uri = Uri.parse('https://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=cUI0v7qNq%2BI2lb7JS7tm%2F94jx1qU8OVMW6tgz9ZO9b%2FGdZUxTzPmTqsBV6KYlC8NsMxzZBxFAlwrUtELLQRNhA%3D%3D&pageNo=1&numOfRows=10&_type=json');

  Future<List<BUSS>> getBuss() async {
    List<BUSS> buss = [];

    final response = await http.get(uri);

    if (response.statusCode == 200){
      buss = jsonDecode(response.body)['item'].map<BUSS>(
          (item){
            return BUSS.fromMap(item);
          }
      ).toList();
    }
    print('res : ${response.statusCode}');

    return buss;
  }
}