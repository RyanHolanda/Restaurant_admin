import 'dart:async';
import 'dart:io' show Platform;
import 'package:admin_panel/bloc/app_bloc.dart';
import 'package:admin_panel/models/orders_model.dart';
import 'package:admin_panel/models/store_status_model.dart';
import 'package:admin_panel/repos/orders_repo.dart';
import 'package:admin_panel/screens/Home/widgets/desktop/windows_buttons.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:audioplayers/audioplayers.dart';

class InicioScreen extends StatelessWidget {
  InicioScreen({
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    orderInfo.sort(
      (a, b) => b.id.compareTo(a.id),
    );
    final allOrderstotal = orderInfo.map((value) => value.price).toList();
    final totalSold = allOrderstotal.reduce((a, b) => a + b);
    final mediumTicket =
        allOrderstotal.reduce((a, b) => a + b / allOrderstotal.length);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                padding:
                    Platform.isMacOS || Platform.isWindows || Platform.isLinux
                        ? const EdgeInsets.only(left: 50, bottom: 50, top: 20)
                        : const EdgeInsets.all(19),
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
                    ),
                    Platform.isAndroid || Platform.isIOS
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: 102,
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
                          )
                        : const SizedBox.shrink(),
                  ],
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Padding(
                    padding: Platform.isMacOS ||
                            Platform.isWindows ||
                            Platform.isLinux
                        ? const EdgeInsets.only(left: 50)
                        : const EdgeInsets.only(left: 20),
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
                                  orderInfo.length.toString(),
                                  style: GoogleFonts.inriaSans(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SelectableText(
                                  'Pedidos ao total',
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
                    padding: Platform.isMacOS ||
                            Platform.isWindows ||
                            Platform.isLinux
                        ? const EdgeInsets.only(left: 50)
                        : const EdgeInsets.only(left: 20),
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
                                  totalSold.toStringAsFixed(2),
                                  style: GoogleFonts.inriaSans(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SelectableText(
                                  'Vendidos',
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
                    padding: Platform.isMacOS ||
                            Platform.isWindows ||
                            Platform.isLinux
                        ? const EdgeInsets.only(left: 50)
                        : const EdgeInsets.only(left: 20),
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
                                  mediumTicket.toStringAsFixed(2),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 50),
              child: Text(
                'Seus Pedidos',
                style: GoogleFonts.inriaSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500),
              ),
            ),
            Orders(scrollController: scrollController)
          ],
        ),
      ),
    );
  }
}

class Orders extends StatefulWidget {
  const Orders({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final player = AudioPlayer();
  ScrollController itemsScrollController = ScrollController();

  Future newOrder() async {
    final order = await ReceiveOrder().getOrders();
    if (order.length != orderInfo.length) {
      player.play(AssetSource('new_order.wav'));
      setState(() {
        orderInfo = order;
        orderInfo.sort(
          (a, b) => b.id.compareTo(a.id),
        );
      });
    }
  }

  @override
  void initState() {
    Timer.periodic(
      const Duration(minutes: 1),
      (timer) async {
        await newOrder();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(25),
          color: Colors.grey.withOpacity(0.05),
          width: MediaQuery.of(context).size.width,
          height: 700,
          child: SelectionArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Scrollbar(
                    controller: widget.scrollController,
                    thumbVisibility: true,
                    child: ListView.builder(
                      controller: widget.scrollController,
                      shrinkWrap: true,
                      itemCount: orderInfo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                              focusColor: Colors.red,
                              onPressed: () {
                                setState(() {
                                  clientNumber = orderInfo[index].clientNumber;
                                  paymentMethod =
                                      orderInfo[index].paymentMethod;
                                  orderPrice = orderInfo[index].price;
                                  clientAdress = orderInfo[index].clientAdress;
                                  clientName = orderInfo[index].clientName;
                                  clientWillPay =
                                      orderInfo[index].clientWillPay;
                                  clientPixKey = orderInfo[index].clientPixKey;
                                  isDelivery = orderInfo[index].isDelivery;
                                  items = orderInfo[index].items.split(',');
                                  date = orderInfo[index].date;
                                  meatPoint = orderInfo[index].meatPoint;
                                  wantSachets = orderInfo[index].wantSachets;
                                  molhoOrMaionese =
                                      orderInfo[index].molhoOrMaionese;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SizedBox(
                                  width: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#${orderInfo[index].id}',
                                        style: TextStyle(
                                            color: Colors.grey.shade400),
                                      ),
                                      Text(orderInfo[index].clientName),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'R\$ ${orderInfo[index].price.toStringAsFixed(2)}'),
                                          const Spacer(),
                                          Text(
                                            orderInfo[index].date,
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          clientName == null
                              ? const SizedBox.shrink()
                              : Text(
                                  clientName ?? '',
                                  style: const TextStyle(fontSize: 25),
                                ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(date ?? ''),
                          const Spacer(),
                          orderPrice == null
                              ? const SizedBox.shrink()
                              : Text(
                                  'R\$ ${orderPrice?.toStringAsFixed(2) ?? ''}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(paymentMethod == 'Cartao'
                            ? 'Cartão'
                            : paymentMethod ?? ''),
                      ),
                      isDelivery
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Text(clientAdress?.replaceAll(
                                      'Number', 'Número') ??
                                  ''),
                            )
                          : const SizedBox.shrink(),
                      isDelivery
                          ? const SizedBox.shrink()
                          : const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Cliente irá retirar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                      const SizedBox(
                        height: 15,
                      ),
                      meatPoint == null
                          ? const SizedBox.shrink()
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: Text('+55 ${clientNumber ?? ''}')),
                      meatPoint == null
                          ? const SizedBox.shrink()
                          : clientPixKey != ''
                              ? Text('Chave pix do cliente: $clientPixKey')
                              : const SizedBox.shrink(),
                      meatPoint == null
                          ? const SizedBox.shrink()
                          : clientPixKey != ''
                              ? Text('Quanto cliente irá pagar: $clientWillPay')
                              : const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Scrollbar(
                          controller: itemsScrollController,
                          thumbVisibility: true,
                          child: SizedBox(
                            height: 300,
                            child: ListView.builder(
                              controller: itemsScrollController,
                              shrinkWrap: true,
                              itemCount: items?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) =>
                                  Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: 70,
                                    color: Colors.grey.shade200,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          items?[index]
                                                  .toString()
                                                  .replaceAll('[', '')
                                                  .replaceAll(']', '') ??
                                              '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.grey.shade200,
                              padding: const EdgeInsets.all(15),
                              child: wantSachets == null
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'Gostaria de sachês?: ${wantSachets ?? ''}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.grey.shade200,
                              padding: const EdgeInsets.all(15),
                              child: meatPoint == null
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'Ponto da carne: ${meatPoint ?? ''}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.grey.shade200,
                              padding: const EdgeInsets.all(15),
                              child: molhoOrMaionese == null
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'Molho grill ou maionese: ${molhoOrMaionese == 'nao' ? 'Não, obrigado' : molhoOrMaionese ?? ''}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ],
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
  }
}

String? clientNumber;
String? clientPixKey;
String? clientWillPay;
String? date;
bool isDelivery = true;
String? clientAdress;
List? items;
String? meatPoint;
String? molhoOrMaionese;
String? paymentMethod;
String? wantSachets;
int? id;
double? orderPrice;
String? clientName;
