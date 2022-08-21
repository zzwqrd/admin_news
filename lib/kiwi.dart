import 'package:admin_pnal/screens/auth/login/bloc/bloc.dart';
import 'package:admin_pnal/screens/auth/register/bloc/bloc.dart';
import 'package:admin_pnal/screens/news/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => RegisterBloc());
  container.registerFactory((c) => LoginBloc());
  container.registerFactory((c) => ShowNewsBloc());
  container.registerFactory((c) => DeleteNewsBloc());
  container.registerFactory((c) => AddNewsBloc());
}
