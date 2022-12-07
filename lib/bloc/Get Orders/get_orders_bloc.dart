import 'dart:async';

import 'package:admin_panel/models/orders_model.dart';
import 'package:admin_panel/repos/receive_order.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_orders_event.dart';
part 'get_orders_state.dart';

class GetOrdersBloc extends Bloc<GetOrdersEvent, GetOrdersState> {
  GetOrdersBloc() : super(GetOrdersInitial()) {
    on<GetOrdersEventGetOrders>((event, emit) async {
      await ReceiveOrder().getOrders();
      Timer.periodic(const Duration(minutes: 1), (timer) async {
        final order = await ReceiveOrder().getOrders();
        orderInfo = order;
      });
    });
  }
}
