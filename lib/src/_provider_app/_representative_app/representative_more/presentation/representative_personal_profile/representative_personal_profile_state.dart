part of 'representative_personal_profile_cubit.dart';

class RepresentativePersonalProfileState extends Equatable {
  final Async<RepresentativeEntity> getDataState;
  final Async<void> updateDataState;

  const RepresentativePersonalProfileState({required this.getDataState, required this.updateDataState});

  const RepresentativePersonalProfileState.initial() : this(getDataState: const Async.initial(), updateDataState: const Async.initial());
  RepresentativePersonalProfileState copyWith({final Async<RepresentativeEntity>? getDataState, final Async<void>? updateDataState}) {
    return RepresentativePersonalProfileState(
      getDataState: getDataState ?? this.getDataState,
      updateDataState: updateDataState ?? this.updateDataState,
    );
  }

  @override
  List<Object?> get props => [getDataState, updateDataState];
}
