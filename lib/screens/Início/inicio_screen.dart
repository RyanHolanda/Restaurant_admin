import 'dart:io' show Platform;
import 'package:admin_panel/screens/Home/widgets/desktop/windows_buttons.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class InicioScreen extends StatelessWidget {
  InicioScreen({
    Key? key,
  }) : super(key: key);

  final ScrollController _dataScrollController = ScrollController();
  final ScrollController _historicScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              padding: const EdgeInsets.only(left: 50, bottom: 50, top: 20),
              child: Row(
                children: [
                  const Icon(BoxIcons.bx_menu_alt_left,
                      color: Colors.black, size: 28),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'DashBoard',
                    style: GoogleFonts.inriaSans(fontSize: 28),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 50),
                    // child: GestureDetector(
                    //   onTap: () => state is AppStateShopClosed
                    //       ? showDialog(
                    //           context: context,
                    //           builder: (context) =>
                    //               CupertinoAlertDialog(
                    //             title: const Text(
                    //                 'Tem certeza que deseja abrir sua loja?'),
                    //             actions: [
                    //               TextButton(
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                   child: const Text(
                    //                     'Manter fechada',
                    //                     style: TextStyle(
                    //                         color: Colors.red,
                    //                         fontWeight:
                    //                             FontWeight.bold),
                    //                   )),
                    //               TextButton(
                    //                   onPressed: () {
                    //                     context.read<AppBloc>().add(
                    //                         AppEventOpenRestaurant());
                    //                     Navigator.pop(context);
                    //                   },
                    //                   child: const Text(
                    //                       'Abrir minha loja',
                    //                       style: TextStyle(
                    //                           color: Colors.green,
                    //                           fontWeight:
                    //                               FontWeight.bold)))
                    //             ],
                    //           ),
                    //         )
                    //       : showDialog(
                    //           context: context,
                    //           builder: (context) =>
                    //               CupertinoAlertDialog(
                    //             title: const Text(
                    //                 'Tem certeza que deseja Fechar sua loja?'),
                    //             actions: [
                    //               TextButton(
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                   child: const Text(
                    //                     'Manter Aberta',
                    //                     style: TextStyle(
                    //                         color: Colors.red,
                    //                         fontWeight:
                    //                             FontWeight.bold),
                    //                   )),
                    //               // TextButton(
                    //               //     onPressed: () {
                    //               //       context.read<AppBloc>().add(
                    //               //           AppEventCloseRestaurant());
                    //               //       Navigator.pop(context);
                    //               //     },
                    //               //     child: const Text(
                    //               //         'Fechar minha loja',
                    //               //         style: TextStyle(
                    //               //             color: Colors.green,
                    //               //             fontWeight:
                    //               //                 FontWeight.bold)))
                    //             ],
                    //           ),
                    //         ),
                    //   // child: Container(
                    //   //   decoration: BoxDecoration(
                    //   //       borderRadius: BorderRadius.circular(15),
                    //   //       color: state is AppStateShopClosed
                    //   //           ? Colors.red
                    //   //           : Colors.green),
                    //   //   padding: const EdgeInsets.all(20),
                    //   //   child: Text(
                    //   //     state is AppStateShopClosed
                    //   //         ? 'Loja Fechada'
                    //   //         : 'Loja aberta',
                    //   //     style: const TextStyle(
                    //   //         color: Colors.white,
                    //   //         fontWeight: FontWeight.bold),
                    //   //   ),
                    //   // ),
                    // ),
                  ),
                ],
              )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black),
                      padding: const EdgeInsets.all(25),
                      width: 300,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                '180',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SelectableText(
                                'Pedidos hoje',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(0.9),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.my_library_books_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(16, 0, 0, 0)),
                      padding: const EdgeInsets.all(25),
                      width: 300,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                r'R$ 340,00',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SelectableText(
                                'Vendidos hoje',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(30, 0, 0, 0),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(16, 0, 0, 0)),
                      padding: const EdgeInsets.all(25),
                      width: 300,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                r'R$ 60,00',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SelectableText(
                                'Ticket médio',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(30, 0, 0, 0),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Bootstrap.ticket,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                '541',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SelectableText(
                                'Pedidos',
                                style: GoogleFonts.inriaSans(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Icon(
                              Bootstrap.bag,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(16, 0, 0, 0),
                  borderRadius: BorderRadius.circular(25)),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, bottom: 0, top: 19, right: 30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            'Dados dos últimos 30 dias',
                            style: GoogleFonts.inriaSans(
                                fontSize: 25,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          Text(
                            'Pedidos',
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const SizedBox(
                            height: 15,
                            child: CircleAvatar(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                          Text(
                            'Receita',
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, right: 26),
                    child: Scrollbar(
                      controller: _dataScrollController,
                      thumbVisibility: true,
                      child: SizedBox(
                        height: 435,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          controller: _dataScrollController,
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 25),
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Text(326.toString()),
                                        AnimatedContainer(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            height: 300,
                                            width: 30,
                                            duration: const Duration(
                                                milliseconds: 500)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 0.5,
                                  ),
                                  Column(
                                    children: [
                                      Text(r'R$' + 130.toString()),
                                      AnimatedContainer(
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 250,
                                          width: 30,
                                          duration: const Duration(
                                              milliseconds: 500)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${26}/${10}',
                                style: GoogleFonts.inriaSans(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Histórico de pedidos',
              style: GoogleFonts.inriaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nome',
                  style: GoogleFonts.inriaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
                Text(
                  'Items',
                  style: GoogleFonts.inriaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
                Text(
                  'data',
                  style: GoogleFonts.inriaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
                Text(
                  'Preço',
                  style: GoogleFonts.inriaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            height: 500,
            child: Scrollbar(
              thumbVisibility: true,
              controller: _historicScrollController,
              child: ListView.builder(
                controller: _historicScrollController,
                itemCount: 500,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(
                          width: 75,
                          child: Text('Arianesasas L.',
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(
                            width: 100,
                            child: SelectableText(
                                '1x Brutinho, 1x Coca-Cole, 1x Green Beard, 1x combo')),
                        SelectableText('27/11/2020\n23:00'),
                        SelectableText(r'R$ 80,00'),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
