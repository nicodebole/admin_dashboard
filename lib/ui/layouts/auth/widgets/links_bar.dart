import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.07 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: 'About'),
          LinkText(text: 'Help center'),
          LinkText(text: 'Terms of service'),
          LinkText(text: 'Privacy policy'),
          LinkText(text: 'Cookie policy'),
          LinkText(text: 'Ads info'),
          LinkText(text: 'Blog'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Brand resourcer'),
          LinkText(text: 'Advertising'),
          LinkText(text: 'Marketing'),
        ],
      ),
    );
  }
}
