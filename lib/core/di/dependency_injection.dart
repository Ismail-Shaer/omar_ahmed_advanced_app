import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:omar_ahmed_advanced_app/core/networking/api_service.dart';
import 'package:omar_ahmed_advanced_app/core/networking/dio_factory.dart';
import 'package:omar_ahmed_advanced_app/features/login/data/repos/login_repo.dart';
import 'package:omar_ahmed_advanced_app/features/login/logic/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

}
