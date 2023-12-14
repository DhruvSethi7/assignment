import 'package:assignment/Authentication/data/data_provider/auth_caller.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Authenticate authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    _initialize();
    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      if (event.displayName==null) {
        emit(AuthFailure('Empty Name'));
        return;
      }
      if(!event.email.endsWith('@gmail.com')){
        emit(AuthFailure('Invalid email'));
        return;
      }
      if (event.password.length<8) {
        emit(AuthFailure('Short Password'));
      }
      UserCredential? user = await authRepository.signUpWithEmailAndPassword(
          event.email, event.password, event.displayName);
      if (user != null) {
        emit(Authenticated());
      } else {
        emit(AuthFailure('Something went wrong'));
      }
    });

    on<LoginEvent>((event, emit) async {
       if(!event.email.endsWith('@gmail.com')){
        emit(AuthFailure('Invalid email'));
        return;
      }
      if (event.password.length<8) {
        emit(AuthFailure('Short Password'));
        return;
      }
      UserCredential? user = await authRepository.signInWithEmailAndPassword(
          event.email, event.password);
      if (user != null) {
        emit(Authenticated());
      } else {
        emit(AuthFailure('Wrong email and password'));
      }
    });
    on<LogoutEvent>((event, emit) {
      authRepository.signOut();
      emit(NotAuthenticated());
    });
  }

  void _initialize() async {
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(Authenticated());
    } else {
      emit(NotAuthenticated());
    }
  }
}
