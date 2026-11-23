part of 'store_personal_profile_cubit.dart';

class StorePersonalProfileState extends Equatable {
  final Async<StoreEntity> getDataState;
  final Async<void> updateDataState;

  const StorePersonalProfileState({required this.getDataState, required this.updateDataState});

  const StorePersonalProfileState.initial() : this(getDataState: const Async.initial(), updateDataState: const Async.initial());
  StorePersonalProfileState copyWith({final Async<StoreEntity>? getDataState, final Async<void>? updateDataState}) {
    return StorePersonalProfileState(
      getDataState: getDataState ?? this.getDataState,
      updateDataState: updateDataState ?? this.updateDataState,
    );
  }

  @override
  List<Object?> get props => [getDataState, updateDataState];
}
