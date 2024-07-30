import 'dart:developer';
import 'package:car_sales/src/core/style/colors.dart';
import 'package:car_sales/src/core/widget/text_widget.dart';
import 'package:car_sales/src/feature/home/presentation/widgets/featured_on_container_widget.dart';
import 'package:car_sales/src/feature/home/presentation/widgets/home_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     final homeVmController = ref.read(homeVMController.notifier);
    homeVmController.fetchData(model: "camry", context: context);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homeVMController);
    final homeVmController = ref.read(homeVMController.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const TextWidget(
          'Car Store',
          textColor: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: SvgPicture.asset("assets/images/notification.svg"),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: homeVmController.isLoading
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    HomeFilterWidget(controller: homeVmController.searchController, onPressed: () {}),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: SizedBox(
                        height: 200,
                        child: Expanded(
                          flex: 1,
                          child: FeaturedOnContainerWidget(),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          'Recommended',
                          textColor: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const TextWidget('See all', textColor: Colors.grey,),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // final car = homeVmController.carList[index];
                        return  MaterialButton(
                          onPressed: (){
                            log(homeVmController.carList.length.toString());
                          },
                          height: 50, // Adjust height and width as needed
                          minWidth: 20,
                          color: Colors.black, // Replace with your desired widget
                        );
                      },
                    )



                  ],
                ),
              )
            : Center(
                child: TextWidget(
                  " data is ${homeVmController.isLoading}",
                  textColor: Colors.black,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log(homeVmController.carList.length.toString());
          ref.watch(homeVMController);
          await homeVmController.fetchData(model: "BMW", context: context);
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
