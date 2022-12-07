part of 'get_orders_bloc.dart';

abstract class GetOrdersState extends Equatable {
  const GetOrdersState();
  
  @override
  List<Object> get props => [];
}

class GetOrdersInitial extends GetOrdersState {}
