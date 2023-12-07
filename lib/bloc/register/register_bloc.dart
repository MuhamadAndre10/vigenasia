import 'package:bloc/bloc.dart';
import 'package:vigenasia/data/datasource/remote/auth_datasource.dart';

import '../../data/model/response/register_response_model.dart';
import '../../data/model/request/register_request_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDataSource _authDatasource;
  RegisterBloc(this._authDatasource) : super(RegisterInitial()) {
    on<DoRegister>((event, emit) async {
      emit(RegisterLoading());
      final result = await _authDatasource.register(event.model);

      result.fold(
        (l) => emit(
          RegisterError(message: l),
        ),
        (r) => emit(
          RegisterSuccess(model: r),
        ),
      );
    });
  }
}
