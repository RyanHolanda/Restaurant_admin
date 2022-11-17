import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class BottomnavBar extends StatelessWidget {
  const BottomnavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Bootstrap.grid)),
              const Text('Início')
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: () {
                context.read<AppBloc>().add(AppEventGoToCardapioScreen());
              }, icon: const Icon(Bootstrap.journal_text)),
              const Text('Cardápio'),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 5,
                    width: 50,
                    color: Colors.amber,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Bootstrap.bag)),
              const Text('Pedidos')
            ],
          ),
        ],
      ),
    );
  }
}
