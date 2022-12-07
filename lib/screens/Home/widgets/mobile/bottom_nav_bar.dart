import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class BottomnavBar extends StatelessWidget {
  const BottomnavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<AppBloc>().add(AppEventGoToInicioScreen());
                      },
                      icon: const Icon(Bootstrap.grid)),
                  Text(
                    'Início',
                    style: GoogleFonts.inriaSans(
                        fontWeight: state is AppStateIsInIncioScreen
                            ? FontWeight.bold
                            : null),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
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
                  Text(
                    'Cardápio',
                    style: GoogleFonts.inriaSans(
                        fontWeight: state is AppStateIsInCardapioScreen
                            ? FontWeight.bold
                            : null),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
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
            ],
          ),
        );
      },
    );
  }
}
