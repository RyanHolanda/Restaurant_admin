// ignore: depend_on_referenced_packages
import 'package:admin_panel/models/orders_model.dart';
import 'package:admin_panel/repos/orders_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:admin_panel/models/store_status_model.dart';
import 'package:admin_panel/repos/store_status_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_panel/models/item_model.dart';
import 'package:admin_panel/repos/items_repositories.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppStateIsInIncioScreen(isLoading: false)) {
    on<AppEventGoToCardapioScreen>((event, emit) async {
      emit(const AppStateIsInCardapioScreen([], isLoading: true));
      try {
        final items = await ItemsRepository().getItems();
        emit(AppStateIsInCardapioScreen(items, isLoading: false));
      } catch (e) {
        emit(const AppStateIsInCardapioScreen([], isLoading: true));
        add(AppEventGoToCardapioScreen());
      }
    });

    on<AppEventGoToInicioScreen>((event, emit) async {
      emit(const AppStateIsInIncioScreen(isLoading: false));
    });

    on<AppEventGoToPedidosScreen>((event, emit) async {
      emit(const AppStateIsInPedidosScreen(isLoading: false));
    });

    on<AppEventGetItems>((event, emit) async {
      emit(const AppStateLoadingData(isLoading: true));
      try {
        await ItemsRepository().getItems();
        final orders = await ReceiveOrder().getOrders();
        orderInfo = orders;
        final store = await StoreStatusRepositorie().getStoreStatus();
        storeStatus = store;
        emit(const AppStateIsInIncioScreen(isLoading: false));
      } catch (e) {
        add(AppEventGetItems());
      }
    });

    on<AppEventAddItems>((event, emit) async {
      emit(const AppStateIsInCardapioScreen([], isLoading: true));
      await AddItems(
              image: event.image,
              description: event.description,
              price: event.price,
              name: event.name)
          .addItems();
      add(AppEventGoToCardapioScreen());
    });

    on<AppEventDeleteItem>((event, emit) async {
      emit(const AppStateIsInCardapioScreen([], isLoading: true));
      await Deleteitems(id: event.id).deleteItems();
      add(AppEventGoToCardapioScreen());
    });

    on<AppEventOpenAddItemsMenu>((event, emit) async {
      emit(const AppStateAddItemMenu(isLoading: false));
    });

    on<AppEventEditItem>((event, emit) async {
      emit(const AppStateIsInCardapioScreen([], isLoading: false));
      await Updateitems(
              id: event.id,
              description: event.description,
              paused: event.paused,
              image: event.image,
              name: event.name,
              price: event.price)
          .updateitems();
      add(AppEventGoToCardapioScreen());
    });

    on<AppEventCloseOpenStore>((event, emit) async {
      emit(const AppStateLoadingData(isLoading: true));
      await UpdateStoreStatus(
              id: storeStatus[0].id,
              storestatus: storeStatus[0].storestatus == 'Fechar loja'
                  ? 'Abrir loja'
                  : 'Fechar loja')
          .updateitems();
      final store = await StoreStatusRepositorie().getStoreStatus();
      storeStatus = store;
      emit(const AppStateIsInIncioScreen(isLoading: false));
    });
  }
}
