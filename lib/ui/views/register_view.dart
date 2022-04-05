import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterProvider(),
        child: Builder(builder: (context) {
          final registerProvider =
              Provider.of<RegisterProvider>(context, listen: false);

          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  key: registerProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => registerProvider.nombre = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Ingresar nombre';
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_sharp,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) => registerProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no válido';
                          }

                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) => registerProvider.password = value,
                        validator: (value) {
                          if (value == null) return 'Ingrese contraseña';
                          if (value.length < 6) return 'Minimo 6 caracteres';

                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomOutlinedButton(
                          onPressed: () {
                            final validForm = registerProvider.validateForm();
                            if (!validForm) return;

                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);
                            authProvider.register(
                                registerProvider.email,
                                registerProvider.password,
                                registerProvider.nombre);
                          },
                          text: 'Crear cuenta'),
                      SizedBox(height: 20),
                      LinkText(
                        text: 'Ir al login',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Flurorouter.loginRoute);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
