class BUSS{
  late String arrtime;
  late String busnum;

  BUSS({
    required this.arrtime,
    required this.busnum
});

  BUSS.fromMap(Map<String, dynamic>? map){
    arrtime = map?['arrtime'] ?? '';
    busnum = map?['routeno'] ?? '';
  }
}