part of '../representative_home_page.dart';

class _RepresentativeHomeBody extends StatefulWidget {
  const _RepresentativeHomeBody();

  @override
  State<_RepresentativeHomeBody> createState() => _RepresentativeHomeBodyState();
}

class _RepresentativeHomeBodyState extends State<_RepresentativeHomeBody> {
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
