import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:thurisa_labs_task/presentation/base/base.vm.dart';
import 'package:thurisa_labs_task/presentation/bottom_nav/bottom_nav.vm.dart';
import 'package:thurisa_labs_task/presentation/home/home_screen.vm.dart';
import 'data/cache/sharedpreferences.dart';
import 'data/remote/user_remote.dart';
import 'data/remote/user_remote_impl.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/user_repository_impl.dart';
import 'data/services/app_cache.dart';
import 'data/services/navigation_service.dart';
import 'data/services/storage-service.dart';
import 'data/services/user_services.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  setupDio();

  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<SharedPreference>(() => SharedPreference());
  getIt.registerLazySingleton<UserRemoteImpl>(
          () => UserRemoteImpl(getIt<Dio>(), getIt<UserServices>()));
  getIt.registerFactory<UserRemote>(
          () => UserRemoteImpl(getIt<Dio>(), getIt<UserServices>()));
  getIt.registerFactory<UserRepository>(
          () => UserRepositoryImpl(getIt<UserRemote>(), getIt<UserServices>()));
  getIt.registerLazySingleton<AppCache>(() => AppCache());
  getIt.registerLazySingleton<UserServices>(() => UserServices());
  registerViewModel();
}

void setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  });
}

void registerViewModel() {
  //View Model
  getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
  getIt.registerFactory<BottomNavViewModel>(() => BottomNavViewModel());
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
}
