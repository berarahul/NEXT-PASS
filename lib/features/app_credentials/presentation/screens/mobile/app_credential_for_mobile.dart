import 'package:next_pass/core/constants/app_linker.dart';

class AppCredentials extends StatelessWidget {
  const AppCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    final CredentialController controller = Get.put(CredentialController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CustomAppBar(
          title: "Credential Details",
          actionIcon: Obx(() => IconButton(
                icon: SvgPicture.asset(
                  controller.isEditing.value
                      ? IconsAssets.check_icon
                      : IconsAssets.edit_icon,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {
                  if (controller.isEditing.value) {
                    controller.saveEditedCredentials(); // Save and update UI
                  }
                  controller.toggleEditing(); // Toggle edit mode
                },
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderWidget(),

                //  Wrap CredentialWidget with Obx() for real-time updates
                Obx(() => CredentialWidget(
                      isEditing: controller.isEditing.value,
                    )),

                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
