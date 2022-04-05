import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Usuario? user;

  // TODO: Actualizar el usuario del provider

  void updateListener() {
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_validForm()) return false;

    final data = {'nombre': user!.nombre, 'corre': user!.correo};

    try {
      final resp = await CafeApi.put('/usuarios/${user!.uid}', data);
      return true;
    } catch (e) {
      throw e;
      return false;
    }
  }
}
