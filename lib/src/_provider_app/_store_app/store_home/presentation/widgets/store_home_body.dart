part of '../store_home_page.dart';

class _StoreHomeBody extends StatefulWidget {
  const _StoreHomeBody();

  @override
  State<_StoreHomeBody> createState() => _StoreHomeBodyState();
}

class _StoreHomeBodyState extends State<_StoreHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LiquidPullToRefresh(
        backgroundColor: AppColors.primary,
        color: Colors.transparent,
        showChildOpacityTransition: false,
        onRefresh: () async {
          setState(() {});
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              // ProviderStatisticsWidget(key: UniqueKey()),
              const SizedBox(height: 16),
              // _ServiceOrdersSection(key: UniqueKey()),
              const SizedBox(height: 16),
              // _ProductsOrdersSection(key: UniqueKey()),
              // const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
