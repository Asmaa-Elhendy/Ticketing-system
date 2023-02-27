import 'package:get_storage/get_storage.dart';

class LocalStorage {
  GetStorage getStorage = GetStorage();

  saveToDisk(name,path,frame_splash) async {

    await getStorage.write('name_theme', name);
    await getStorage.write('path', path);
    await getStorage.write('frame_splash_path', frame_splash);
  }
}