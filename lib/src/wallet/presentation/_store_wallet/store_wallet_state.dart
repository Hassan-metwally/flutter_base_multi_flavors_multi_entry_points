part of 'store_wallet_cubit.dart';

class StoreWalletState extends Equatable {
  const StoreWalletState({
    required this.getBalanceState,
    required this.withDrawState,
    required this.showTransationHistory,
    required this.getWalletHistoryState,
    required this.currentPage,
    required this.lastPage,
  });

  final Async<BalanceEntity> getBalanceState;
  final Async<String> withDrawState;
  final bool showTransationHistory;
  final Async<List<TransactionEntity>> getWalletHistoryState;
  final int currentPage;
  final int lastPage;

  const StoreWalletState.initial()
    : this(
        getBalanceState: const Async.initial(),
        withDrawState: const Async.initial(),
        showTransationHistory: true,
        getWalletHistoryState: const Async.initial(),
        currentPage: 1,
        lastPage: 1,
      );

  StoreWalletState copyWith({
    final Async<BalanceEntity>? getBalanceState,
    final Async<String>? withDrawState,
    final bool? showTransationHistory,
    final Async<List<TransactionEntity>>? getWalletHistoryState,
    final int? currentPage,
    final int? lastPage,
  }) => StoreWalletState(
    getBalanceState: getBalanceState ?? this.getBalanceState,
    getWalletHistoryState: getWalletHistoryState ?? this.getWalletHistoryState,
    withDrawState: withDrawState ?? this.withDrawState,
    showTransationHistory: showTransationHistory ?? this.showTransationHistory,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
  );

  @override
  List<Object?> get props => [getBalanceState, getWalletHistoryState, withDrawState, showTransationHistory, currentPage, lastPage];
}
