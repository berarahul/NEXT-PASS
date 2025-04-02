import '../../../../core/constants/app_linker.dart';

class MobileGetStartedScreen extends StatelessWidget {
  const MobileGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final GetStartedController getStartedController =
        Get.put(GetStartedController());

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 455,
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    getStartedController.selectedView.value = index;
                  },
                  children: getStartedController.viewList,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  getStartedController.viewList.length,
                  (index) => Obx(
                    () => AnimatedContainer(
                      width: (getStartedController.selectedView.value == index)
                          ? 10
                          : 8,
                      height: (getStartedController.selectedView.value == index)
                          ? 10
                          : 8,
                      duration: const Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                        color:
                            (getStartedController.selectedView.value == index)
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                    ),
                  ),
                ),
              ),
            Column(children:[
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PrimaryButton(
                  text: (getStartedController.selectedView.value == 0)
                      ? AppStrings.nextButton
                      : AppStrings.startButton,
                  onPressed: () {
                    if (getStartedController.selectedView.value == 0) {
                      pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    } else {
                      Get.toNamed(AppRoutes.authtab);
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  if (getStartedController.selectedView.value == 0) {
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  } else {
                    pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  }
                },
                child: Obx(() => Text(
                      (getStartedController.selectedView.value == 0)
                          ? AppStrings.skipButton
                          : AppStrings.backButton,
                      style: Theme.of(context).textTheme.labelLarge,
                    )),
              ),
            ]),
            ],
          ),
        ),
      ),
    );
  }
}
