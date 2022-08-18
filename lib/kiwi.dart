import 'package:admin_pnal/screens/auth/register/bloc/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => RegisterBloc());
}
