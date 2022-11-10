import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models.dart';
import 'provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { //MyApp 클래스 선언
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //오른쪽위 debugBanner 없애기
      title: 'BUSS',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<BUSS> buss = [];
  bool isLoading = true;
  BussProviders bussProvider = BussProviders();

  Future initBuss() async {
    buss = await bussProvider.getBuss();
  }

  @override
  void initState(){
    super.initState();
    initBuss().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('테스트 중입니다.'),
        centerTitle: true, // 중앙 정렬
      ),
      body: isLoading ? Center(child: const CircularProgressIndicator(),) :
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
          itemCount: buss.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(buss[index].arrtime),
                  Text(buss[index].busnum),
                ],
              ),
            );
          }),
    );
  }
}
