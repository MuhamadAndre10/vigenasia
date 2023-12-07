import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vigenasia/data/datasource/remote/auth_datasource.dart';
import 'package:vigenasia/data/model/request/logn_request_model.dart';
import 'package:vigenasia/data/model/response/login_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDataSource _authDatasource;
  LoginBloc(this._authDatasource) : super(LoginInitial()) {
    on<DoLogin>((event, emit) async {
      emit(LoginLoading());
      final res = await _authDatasource.login(event.model);
      res.fold(
        (l) => emit(LoginError(message: l)),
        (r) => emit(
          LoginSuccess(model: r),
        ),
      );
    });
  }
}
