import 'package:next_pass/core/constants/app_linker.dart';
import 'package:next_pass/features/home/presentation/widgets/all_credentials_section.dart';
import 'package:next_pass/features/home/presentation/widgets/password_category_section.dart';
import 'package:next_pass/features/home/presentation/widgets/search_bar_section.dart';
import 'package:next_pass/features/home/presentation/widgets/view_profile_section.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        // APP BAR
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: [
                  // VIEW PROFILE SECTION
                  const ViewProfileSection(),
                  const Spacer(),
                  // NOTIFICATION SECTION
                  InkWell(
                    onTap: () {
                      print('Notification button pressed');
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(7.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        IconsAssets.notificationIcon,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.tertiary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              // SEARCH BAR SECTION
              const SearchBarSection(),
            ],
          ),
          scrolledUnderElevation: 0.0,
          toolbarHeight: 120,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        // Floation Action Button for Add new password
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.newCredential);
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          heroTag: null,
          tooltip: AppStrings.addPassword,
          child: SvgPicture.asset(
            IconsAssets.addIcon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
        // Body
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PASSWORD CATEGORY SECTION
                const PasswordCategorySection(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.allCredentials,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Spacer(),
                      Text(
                        AppStrings.viewAll,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
                // ALL CREDENTIALS SECTION
                const AllCredentialsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
