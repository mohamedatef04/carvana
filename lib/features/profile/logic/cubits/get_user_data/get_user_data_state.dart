import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:equatable/equatable.dart';

abstract class GetUserDataState extends Equatable {
  const GetUserDataState();

  @override
  List<Object?> get props => [];
}

class GetUserDataInitial extends GetUserDataState {}

class GetUserDataLoading extends GetUserDataState {}

class GetUserDataSuccess extends GetUserDataState {
  final UserDataModel userDataModel;
  const GetUserDataSuccess({required this.userDataModel});

  @override
  List<Object?> get props => [userDataModel];
}

class GetUserDataFailure extends GetUserDataState {
  final String errorMessage;
  const GetUserDataFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
