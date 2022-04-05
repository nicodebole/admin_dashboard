import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersDataSource extends DataTableSource {
  final List<Usuario> users;
  //final BuildContext context;

  UsersDataSource(this.users);

  @override
  DataRow getRow(int index) {
    final Usuario user = users[index];

    final image = Image(
      image: AssetImage('no-image.jpg'),
      width: 35,
      height: 35,
    );

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          ClipOval(
            child: image,
          ),
        ),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(IconButton(
          onPressed: () {
            // TODO: navegar a una nueva pantalla con el /UID
            NavigationService.replaceTo('/dashboard/users/${user.uid}');
          },
          icon: Icon(Icons.edit_outlined),
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
