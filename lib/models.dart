class BUSS{
  late String arrtime;
  late String busnum;
  late String title;
  late String content;

  BUSS({
    required this.arrtime,
    required this.busnum,
    required this.title,
    required this.content
});

  BUSS.fromMap(Map<String, dynamic>? map){
    arrtime = map?['arrtime'] ?? '';
    busnum = map?['routeno'] ?? '';
    //title = map?['title'] ?? '';
    //content = map?['content'] ?? '';
  }
}