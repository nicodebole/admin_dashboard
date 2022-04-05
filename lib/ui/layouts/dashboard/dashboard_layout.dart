import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SidemenuProvider.menuController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) Sidebar(),

              Expanded(
                child: Column(
                  children: [
                    // Navbar
                    Navbar(),

                    // View
                    Expanded(
                      child: Container(child: widget.child),
                    ),
                  ],
                ),
              ),

              //Contenedeor de nuestro view
              //Expanded(child: child),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
                animation: SidemenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        if (SidemenuProvider.isOpened)
                          Opacity(
                            opacity: SidemenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => SidemenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(SidemenuProvider.movement.value, 0),
                          child: Sidebar(),
                        ),
                      ],
                    ))
        ],
      ),
    );
  }
}
