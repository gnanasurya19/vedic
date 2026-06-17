import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vedic/core/extentions/style_extention.dart';
import 'package:vedic/core/navigation/route_name.dart';
import 'package:vedic/core/theme/app_colors.dart';
import 'package:vedic/features/home/presentation/widgets/card_widget.dart';
import 'package:vedic/features/home/providers/home_provider.dart';
import 'package:vedic/features/home/repository/home_repository.dart';
import 'package:vedic/shared/widgets/custom_app_bar.dart';
import 'package:vedic/shared/widgets/glass_icon_button.dart';
import 'package:vedic/shared/widgets/name_profile.dart';
import 'package:vedic/shared/widgets/ritual_card.dart';
import 'package:vedic/shared/widgets/shimmer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        height: context.style.scale * 100,
        actions: [
          GlassIconButton(icon: Icons.person, onPress: () {}),
          NameProfile(
            color: AppColors.secondary,
            size: 42,
            text: Text(
              "JD",
              style: context.style.text.semiBoldMd.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(width: context.style.insets.md),
        ],
        isLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 20, color: AppColors.white),
            ),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white.withValues(alpha: 0.2),
                      ),
                      child: _buildAvailability(context, ref),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(newRitualBookingProvider);
                  ref.invalidate(overViewProvider);
                  try {
                    await ref.read(newRitualBookingProvider.future);
                    await ref.read(overViewProvider.future);
                  } catch (_) {}
                },
                child: Container(
                  color: AppColors.white,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.style.insets.rg,
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today\'s Overview',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            iconAlignment: IconAlignment.end,
                            icon: const Icon(Icons.arrow_forward),
                            label: Text(
                              'View All',
                              style: context.style.text.semiBold,
                            ),
                          ),
                        ],
                      ),
                      _buildOverview(context, ref),
                      SizedBox(height: context.style.insets.md),

                      _buildNewBooking(context, ref),
                      UpComingRitualCard(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary,foregroundColor: AppColors.white),
                onPressed: (){
                Navigator.pushNamed(context, RouteNames.myBooking);
              }, child: Text("My Booking"))),
          ],
        ),
      ),
    );
  }

  Row _buildAvailability(BuildContext context, WidgetRef ref) {
    final availble = ref.watch(userAvailableProvider);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Availability',
              style: context.style.text.regular.copyWith(
                color: AppColors.white,
              ),
            ),
            Row(
              spacing: 5,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: availble ? Colors.green : Colors.amberAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  'Available for booking',
                  style: context.style.text.regularMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Switch(
          activeTrackColor: AppColors.green,
          value: availble,
          onChanged: (value) {
            ref.watch(userAvailableProvider.notifier).update(value);
          },
        ),
      ],
    );
  }

  Widget _buildOverview(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(overViewProvider);
    final overviewData = ref.watch(homeRepositoryProvider).overview;

    return asyncValue.when(
      data: (data) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
        ),
        itemCount: overviewData.length,
        itemBuilder: (context, index) {
          final overview = overviewData[index];
          return CardWidget(
            title: overview.title ?? "",
            subtitle: '',
            value: overview.value ?? "",
            icon: overview.icon ?? Icons.home,
            color: overview.color ?? AppColors.secondary,
          );
        },
      ),
      error: (e, s) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Center(child: Text(e.toString())),
        ],
      ),
      loading: () => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.5,
        ),
        itemCount: 4,
        itemBuilder: (context, index) =>
            ShimmerWidget(width: double.infinity, height: 100),
      ),
    );
  }

  Widget _buildNewBooking(BuildContext context, WidgetRef ref) {
    final asyncRituals = ref.watch(newRitualBookingProvider);

    return asyncRituals.when(
      data: (rituals) {
        if (rituals.isEmpty) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              const Center(child: Text("No New Bookings")),
            ],
          );
        }
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.style.insets.md),
              child: Row(
                children: [
                  Text(
                    '🔥 New Bookings request',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${rituals.length} new',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: rituals.length,
              itemBuilder: (context, index) {
                final ritual = rituals[index];
                return RitualCard(ritual: ritual);
              },
            ),
          ],
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
    );
  }
}

class UpComingRitualCard extends StatelessWidget {
  const UpComingRitualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.style.insets.rg),

      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: context.style.insets.xl),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primary,
            ),
            child: Column(
              spacing: 3,
              children: [
                Text(
                  'Today Booking',
                  style: context.style.text.regular.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'Abhijit Muharatha',
                  style: context.style.text.regularXXLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  '11:45 - 12:32',
                  style: context.style.text.regularXXLarge.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  'Location',
                  style: context.style.text.regular.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            left: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent.withValues(alpha: 0.3),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -20,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary.withValues(alpha: 0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
