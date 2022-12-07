import 'dart:io';

import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/screens/Home/widgets/desktop/windows_buttons.dart';
import 'package:admin_panel/screens/Cardápio/widgets/items_list.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

@immutable
class CardapioScreen extends StatelessWidget {
  CardapioScreen({super.key});

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: Center(child: CircularProgressIndicator()),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Platform.isWindows || Platform.isLinux || Platform.isMacOS
                          ? WindowTitleBarBox(
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: SizedBox.shrink(),
                                  ),
                                  WindowButtons()
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                      Padding(
                        padding: Platform.isWindows ||
                                Platform.isMacOS ||
                                Platform.isLinux
                            ? const EdgeInsets.only(
                                left: 50, bottom: 50, top: 20)
                            : const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const Icon(
                              BoxIcons.bx_menu_alt_left,
                              color: Colors.black,
                              size: 28,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Cardápio',
                              style: GoogleFonts.inriaSans(fontSize: 28),
                            ),
                            const Spacer(),
                            Padding(
                              padding: Platform.isWindows ||
                                      Platform.isLinux ||
                                      Platform.isMacOS
                                  ? const EdgeInsets.only(right: 50)
                                  : const EdgeInsets.all(0),
                              child: BlocProvider(
                                create: (context) => AppBloc(),
                                child: Platform.isWindows ||
                                        Platform.isLinux ||
                                        Platform.isMacOS
                                    ? Row(
                                        children: [
                                          TextButton.icon(
                                              onPressed: () {
                                                context.read<AppBloc>().add(
                                                    AppEventGoToCardapioScreen());
                                              },
                                              icon: const Icon(
                                                  Bootstrap.arrow_repeat),
                                              label: const Text(
                                                  'Atualizar Página')),
                                          TextButton.icon(
                                              onPressed: () {
                                                context.read<AppBloc>().add(
                                                    AppEventOpenAddItemsMenu());
                                              },
                                              icon: const Icon(Icons.add),
                                              label:
                                                  const Text('Adicionar Item')),
                                        ],
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          context
                                              .read<AppBloc>()
                                              .add(AppEventOpenAddItemsMenu());
                                        },
                                        icon: const Icon(Icons.add)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Itemslist(),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
