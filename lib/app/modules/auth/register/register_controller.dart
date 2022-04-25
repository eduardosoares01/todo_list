import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';
import '../../../core/notifier/default_change_notifier.dart';
import '../../../exception/auth_exception.dart';

class RegisterController extends DefaultChangeNotifier {
  final UserService _userService;

  /*
  String? error;
  bool success = false;
  */

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    /*
    try {
      error = null;
      success = false;
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        success = true;
      } else {
        error = 'Erro ao registrar usuário';
      }
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      notifyListeners();
    }
    */

    try {
      showLoadingAndResetState();
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        // Sucesso
        success();
      } else {
        // Erro
        setError('Erro ao registrar usuário');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
