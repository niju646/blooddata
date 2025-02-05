import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key,String value)async{
    await storage.write(key: key, value: value);
    // ignore: avoid_print
    print("data has stored");
  }

  readSecureData(String key)async{
     String value =  await storage.read(key: key) ?? 'no data found';
     // ignore: avoid_print
     print("data read from storage: $value");
  }

  deleteSecureData(String key) async{
    await storage.delete(key: key);
  }



}