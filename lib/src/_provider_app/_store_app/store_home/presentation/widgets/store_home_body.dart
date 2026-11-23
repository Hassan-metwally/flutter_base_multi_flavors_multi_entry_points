part of '../store_home_page.dart';

class _StoreHomeBody extends StatefulWidget {
  const _StoreHomeBody();

  @override
  State<_StoreHomeBody> createState() => _StoreHomeBodyState();
}

class _StoreHomeBodyState extends State<_StoreHomeBody> {
  Future<void> Function()? _refreshAds;
  Future<void> _onRefresh() {
    return Future.wait([_refreshAds?.call() ?? Future<void>.value()]);
  }

  void _bindAds(Future<void> Function()? refresh) => _refreshAds = refresh;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: AppColors.backgroundColor,
      backgroundColor: AppColors.primary,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: AdsWidget(onBindRefresh: _bindAds)),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
