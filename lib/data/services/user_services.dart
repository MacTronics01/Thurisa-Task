
import 'package:thurisa_labs_task/data/services/storage-service.dart';
import '../../locator.dart';
import 'app_cache.dart';

class UserServices{
  StorageService storageService =  getIt<StorageService>();
  AppCache cache = getIt<AppCache>();


}