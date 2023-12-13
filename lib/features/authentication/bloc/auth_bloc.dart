import 'package:bloc/bloc.dart';
import 'package:meetyou/features/authentication/data/data_user_account_local.dart';
import 'package:meetyou/features/authentication/models/user_account_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterAuthEvent) {
        emit(AuthLoading());
        DataUserAccountLocal.setDataUserAccountToStorage(event.userAccount);
        UserAccountRegister.setUserAccountRegister(event.isRegister);
        await Future.delayed(const Duration(seconds: 2));
        emit(
          AuthSuccess(
            userAccount: event.userAccount,
            isRegister: event.isRegister,
          ),
        );
      }
    });
  }
}
