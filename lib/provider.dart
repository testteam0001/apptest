import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';



class BussProviders{
  Uri uri = Uri.parse('https://apis.data.go.kr/1613000/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=E3Y7xHw5cZzrfuo1DOoeS%2BXG2uKHR0A%2FJJvXeLBhDhh8nSeSsUASRn5L%2BoOJp3UwWuHX0SIB%2FvaCUjp00OEhdA%3D%3D&pageNo=1&numOfRows=10&_type=json&cityCode=25&nodeId=DJB8001793');
  //Uri uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=kr&apiKey=b526c8b83fb34be89a54447881072c1c");
  Future<List<BUSS>> getBuss() async {
    List<BUSS> buss = [];

    final response = await http.get(uri);

    if (response.statusCode == 200){
      buss = jsonDecode(response.body)['items'][0].map<BUSS>( (item){
            return BUSS.fromMap(item);
          }).toList();
    }
    print('res : ${response.statusCode}');

    return buss;
  }
}