import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/user_view.dart';
import 'package:admin_dashboard/ui/views/users_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.dashboardRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
      }
      return LoginView();
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.iconsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return IconsView();
      }
      return LoginView();
    },
  );

  static Handler blank = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.blankRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return BlankView();
      }
      return LoginView();
    },
  );

  static Handler categories = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.categoriesRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return CategoriesView();
      }
      return LoginView();
    },
  );

  static Handler users = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.usersRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return UsersView();
      }
      return LoginView();
    },
  );

  static Handler user = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SidemenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.userRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        if (params['uid']?.first != null) {
          return UserView(uid: params['uid']!.first);
        }

        return UsersView();
      }
      return LoginView();
    },
  );
}
