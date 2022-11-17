import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/screens/Card%C3%A1pio/cardapio_screen.dart';
import 'package:admin_panel/screens/Card%C3%A1pio/widgets/add_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboveBottomBarDisplay extends StatelessWidget {
  const AboveBottomBarDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if(state is AppStateIsInCardapioScreen){
            return const CardapioScreen();
          } if(state is AppStateAddItemMenu){
            return const AddItemScreen();
          } else {
          } return const SizedBox.shrink();
        },
      ),
    );
  }
}
