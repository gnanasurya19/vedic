import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedic/core/extentions/style_extention.dart';
import 'package:vedic/core/theme/app_colors.dart';
import 'package:vedic/features/my_bookings/providers/my_booking_provider.dart';
import 'package:vedic/features/my_bookings/repository/my_booking_repo.dart';
import 'package:vedic/shared/widgets/custom_app_bar.dart';
import 'package:vedic/shared/widgets/glass_icon_button.dart';
import 'package:vedic/shared/widgets/ritual_card.dart';
import 'package:vedic/shared/widgets/shimmer.dart';

class MyBookingScreen extends ConsumerWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSearch = ref.watch(showRitualSearchBarProvider);
    return Scaffold(
      appBar: CustomAppBar(
        height: 60,
        isLeading: true,
        onPressLeading: () {
          Navigator.pop(context);
        },
        title: Text(
          "",
          style: context.style.text.regular.copyWith(color: AppColors.white),
        ),
        actions: [
          GlassIconButton(
            icon: showSearch ? Icons.close : Icons.search,
            onPress: () {
              ref
                  .watch(showRitualSearchBarProvider.notifier)
                  .updateValue(!showSearch);
            },
          ),
          GlassIconButton(
            icon: Icons.notification_add_outlined,
            onPress: () {},
          ),
          SizedBox(width: context.style.insets.md),
        ],
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: context.style.insets.sm,
              bottom: context.style.insets.xl,
              left: context.style.insets.xl,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(context.style.radius.xxl),
              ),
            ),
            child: Text(
              'My Booking',
              style: context.style.text.boldXLarge.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -14),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: context.style.insets.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.style.radius.xl),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withAlpha(55),
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.all(context.style.insets.lg),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [Text("142",style: context.style.text.semiBoldMd.copyWith(color: AppColors.primary),), Text('Total')]),
                  ),
                  Expanded(
                    child: Column(children: [Text("8",style: context.style.text.semiBoldMd.copyWith(color: Colors.amberAccent),), Text('Pending')]),
                  ),
                  Expanded(
                    child: Column(children: [Text("127",style: context.style.text.semiBoldMd.copyWith(color: AppColors.green),), Text('Completed')]),
                  ),
                  Expanded(
                    child: Column(children: [Text("7",style: context.style.text.semiBoldMd.copyWith(color: Colors.red),), Text('Cancelled')]),
                  ),
                ],
              ),
            ),
          ),
          if (showSearch)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search rituals",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      ref
                          .watch(showRitualSearchBarProvider.notifier)
                          .updateValue(!showSearch);
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
                onChanged: (value) {
                  ref
                      .watch(ritualSearchQueryProvider.notifier)
                      .updateQuery(value);
                },
              ),
            ),
          _buildStatusList(context, ref),
          Expanded(child: _buildRitualList(context, ref)),
        ],
      ),
    );
  }

  Widget _buildRitualList(BuildContext context, WidgetRef ref) {
    final asyncRituals = ref.watch(filteredritualListProvider);

    return RefreshIndicator(
      backgroundColor: AppColors.white,
      color: AppColors.primary,
      onRefresh: () async {
        ref.invalidate(ritualBookingListProvider);
        try {
          await ref.read(ritualBookingListProvider.future);
        } catch (_) {}
      },
      child: asyncRituals.when(
        data: (rituals) {
          if (rituals.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                const Center(child: Text("No Item found")),
              ],
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: context.style.insets.md),
            itemCount: rituals.length,
            itemBuilder: (context, index) {
              final ritual = rituals[index];
              return RitualCard(ritual: ritual);
            },
          );
        },
        loading: () => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(8.0),
            child: ShimmerWidget(width: double.infinity, height: 100),
          ),
        ),
        error: (e, s) => ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Center(child: Text(e.toString())),
          ],
        ),
      ),
    );
  }
}

Widget _buildStatusList(BuildContext context, WidgetRef ref) {
  final statusList = ref.watch(myBookingRepoProvider).ritualStatus;
  final selectedStatusId = ref.watch(ritualSelectedStatusProvider);

  return SizedBox(
    height: 40,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: context.style.insets.lg),
      itemBuilder: (context, index) {
        final status = statusList[index];
        final isSelected = status.statusID == selectedStatusId;
        return ActionChip(
          label: Text(status.status),
          backgroundColor: isSelected ? AppColors.primary : AppColors.white,
          labelStyle: TextStyle(
            color: isSelected ? AppColors.white : AppColors.black,
          ),
          onPressed: () {
            ref
                .read(ritualSelectedStatusProvider.notifier)
                .updateStatus(status.statusID);
          },
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(width: context.style.insets.sm),
      itemCount: statusList.length,
    ),
  );
}
