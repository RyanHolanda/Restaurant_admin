part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final bool isLoading;
  const AppState({required this.isLoading});
}

class AppStateIsInIncioScreen extends AppState {
  const AppStateIsInIncioScreen({required isLoading})
      : super(isLoading: isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class AppStateIsInCardapioScreen extends AppState {
  const AppStateIsInCardapioScreen(this.items, {required isLoading})
      : super(isLoading: isLoading);
  final List<ItemModel> items;

  @override
  List<Object?> get props => [items, isLoading];
}

class AppStateIsInPedidosScreen extends AppState {
  const AppStateIsInPedidosScreen({required isLoading})
      : super(isLoading: isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class AppStateAddItemMenu extends AppState {
  const AppStateAddItemMenu({required isLoading}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [isLoading];
}

class AppStateLoadingData extends AppState {
  const AppStateLoadingData({required isLoading}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [isLoading];
}
