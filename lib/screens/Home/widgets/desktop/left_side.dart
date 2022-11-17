import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:admin_panel/models/store_status_model.dart';


// ignore: must_be_immutable
class LeftSide extends StatelessWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 8,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(5, 5),
                    blurRadius: 18,
                    spreadRadius: 1),
                BoxShadow(
                    spreadRadius: 1,
                    color: Colors.grey.shade100,
                    blurRadius: 18,
                    offset: const Offset(-5, -5))
              ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Black Beard',
                        style: GoogleFonts.pacifico(color: Colors.amber),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: SizedBox(
                      height: 70,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (state is AppStateIsInIncioScreen) {
                            null;
                          } else {
                            context
                                .read<AppBloc>()
                                .add(AppEventGoToInicioScreen());
                          }
                        },
                        child: SizedBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedPadding(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.only(right: 10),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                duration: const Duration(milliseconds: 200),
                                height:
                                    state is AppStateIsInIncioScreen ? 30 : 0,
                                width: state is AppStateIsInIncioScreen ? 5 : 0,
                              ),
                            ),
                            const Icon(
                              Bootstrap.grid,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Início',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: SizedBox(
                      height: 70,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context
                              .read<AppBloc>()
                              .add(AppEventGoToCardapioScreen());
                        },
                        child: SizedBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedPadding(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.only(right: 10),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                duration: const Duration(milliseconds: 200),
                                height: state is AppStateIsInCardapioScreen
                                    ? 30
                                    : 0,
                                width:
                                    state is AppStateIsInCardapioScreen ? 5 : 0,
                              ),
                            ),
                            const Icon(
                              Bootstrap.journal_text,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Cardápio',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: SizedBox(
                      height: 70,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (state is AppStateIsInPedidosScreen) {
                            null;
                          } else {
                            context
                                .read<AppBloc>()
                                .add(AppEventGoToPedidosScreen());
                          }
                        },
                        child: SizedBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedPadding(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.only(right: 10),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                duration: const Duration(milliseconds: 200),
                                height:
                                    state is AppStateIsInPedidosScreen ? 30 : 0,
                                width:
                                    state is AppStateIsInPedidosScreen ? 5 : 0,
                              ),
                            ),
                            const Icon(
                              Bootstrap.bag,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Pedidos',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // Icon(
                            //   state is AppStateShopClosed
                            //       ? Bootstrap.slash_square_fill
                            //       : Bootstrap.door_open,
                            //   color: state is AppStateShopClosed
                            //       ? Colors.red
                            //       : Colors.green,
                            // ),
                            SizedBox(
                              width: 20,
                            ),
                            // Text(
                            //   state is AppStateShopClosed
                            //       ? 'Loja Fechada'
                            //       : 'Loja aberta',
                            //   style: TextStyle(
                            //       color: state is AppStateShopClosed
                            //           ? Colors.red
                            //           : Colors.green,
                            //       fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: 150,
                              height: 50,
                              child: MaterialButton(
                                color:
                                    storeStatus[0].storestatus == 'Abrir loja'
                                        ? Colors.green
                                        : Colors.red,
                                onPressed: () async {
                                  context
                                      .read<AppBloc>()
                                      .add(AppEventCloseOpenStore());
                                },
                                child: Text(
                                  storeStatus[0].storestatus,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
