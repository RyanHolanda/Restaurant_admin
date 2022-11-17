import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/screens/Card%C3%A1pio/cardapio_screen.dart';
import 'package:admin_panel/screens/Card%C3%A1pio/widgets/add_item.dart';
import 'package:admin_panel/screens/In%C3%ADcio/inicio_screen.dart';
import 'package:admin_panel/screens/Pedidos/pedidos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RightSide extends StatelessWidget {
  RightSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 0),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state is AppStateIsInIncioScreen) {
                  return InicioScreen();
                }
                if (state is AppStateIsInCardapioScreen) {
                  return const CardapioScreen();
                }

                if (state is AppStateIsInPedidosScreen) {
                  return const PedidosScreen();
                }
                if (state is AppStateAddItemMenu) {
                  return const AddItemScreen();
                } else {
                  return const Scaffold();
                }
              },
            )),
      ),
    );
  }
}
