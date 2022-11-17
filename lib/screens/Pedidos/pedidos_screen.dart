import 'dart:io';

import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/screens/Home/widgets/desktop/windows_buttons.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

@immutable
class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Platform.isWindows?
                    WindowTitleBarBox(
                      child: Row(
                        children: const [
                          Expanded(
                            child: SizedBox.shrink(),
                          ),
                          WindowButtons()
                        ],
                      ),
                    ) : SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, bottom: 50, top: 20),
                      child: Row(
                        children:[
                          const Icon(
                            BoxIcons.bx_menu_alt_left,
                            color: Colors.black,
                            size: 28,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Pedidos',
                            style: GoogleFonts.inriaSans(fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
