import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class BottomnavBar extends StatelessWidget {
  const BottomnavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<AppBloc>().add(AppEventGoToInicioScreen());
                      },
                      icon: Icon(Bootstrap.grid)),
                  const Text('Início'),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      duration: const Duration(milliseconds: 200),
                      height: state is AppStateIsInIncioScreen ? 5 : 0,
                      width: state is AppStateIsInIncioScreen ? 50 : 0,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<AppBloc>()
                            .add(AppEventGoToCardapioScreen());
                      },
                      icon: const Icon(Bootstrap.journal_text)),
                  const Text('Cardápio'),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      duration: const Duration(milliseconds: 200),
                      height: state is AppStateIsInCardapioScreen ? 5 : 0,
                      width: state is AppStateIsInCardapioScreen ? 50 : 0,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () {
                    context.read<AppBloc>().add(AppEventGoToPedidosScreen());
                  }, icon: Icon(Bootstrap.bag)),
                  const Text('Pedidos'),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      duration: const Duration(milliseconds: 200),
                      height: state is AppStateIsInPedidosScreen ? 5 : 0,
                      width: state is AppStateIsInPedidosScreen ? 50 : 0,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
