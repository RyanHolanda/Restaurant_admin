part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

@immutable
class AppEventGoToPedidosScreen extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventGoToCardapioScreen extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventGoToInicioScreen extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventGetItems extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventOpenAddItemsMenu extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventCloseOpenStore extends AppEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventAddItems extends AppEvent {
  final String name;
  final String price;
  final String description;
  final String? image;
  final bool paused;
  const AppEventAddItems(
      {required this.name,
      required this.paused,
      required this.description,
      required this.price,
      this.image});
  @override
  List<Object?> get props => [name, description, price, image, paused];
}

@immutable
class AppEventDeleteItem extends AppEvent {
  final String id;
  const AppEventDeleteItem({required this.id});
  @override
  List<Object?> get props => [id];
}


@immutable
class AppEventEditItem extends AppEvent {
  final String id;
  final String? name;
  final String? price;
  final String? image;
  final String? description;
  final bool? paused;
  const AppEventEditItem(
      {required this.id, this.description, this.image, this.name, this.price, this.paused});
  @override
  List<Object?> get props => [id, image, name, price, description, paused];
}
