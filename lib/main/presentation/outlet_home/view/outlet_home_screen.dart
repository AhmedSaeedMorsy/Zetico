import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zetico/app/resources/color_manager.dart';
import 'package:zetico/main/presentation/In_active_outlet/view/in_active_outlet_screen.dart';
import 'package:zetico/main/presentation/active_outlet/view/active_outlet_screen.dart';
import 'package:zetico/main/presentation/agreed_outlet/view/agreed_outlet_screen.dart';
import 'package:zetico/main/presentation/not_agreed_outlet/view/not_agreed_outlet_screen.dart';
import 'package:zetico/main/presentation/outlet_home/controller/view_outlet_bloc.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/strings_manager.dart';
import '../../../../app/resources/values_manager.dart';
import '../../view_outlet/view/outlet_screen.dart';

class OutletHomeScreen extends StatelessWidget {
  const OutletHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BlocProvider(create: (context)=>ViewOutletBloc()..getViewOutlet(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_sharp,
                  size: AppSize.s30.w,
                ),
              ),
            ],
            backgroundColor: ColorManager.thirdgradientColor,
            centerTitle: true,
            title: Text(
              AppStrings.home.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: FontSizeManager.s16.sp),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: AppSize.s60.h,
                decoration: BoxDecoration(
                  color: ColorManager.firstgradientColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      AppSize.s8.h,
                    ),
                    bottomRight: Radius.circular(
                      AppSize.s8.h,
                    ),
                  ),
                ),
                child: TabBar(
                  indicatorColor: ColorManager.black,
                  indicator: const BoxDecoration(
                    color: ColorManager.white,
                  ),
                  labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: FontSizeManager.s12.sp,
                      ),
                  labelPadding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / AppSize.s80,
                    horizontal: MediaQuery.of(context).size.width / AppSize.s50,
                  ),
                  labelColor: ColorManager.black,
                  automaticIndicatorColorAdjustment: true,
                  unselectedLabelColor: ColorManager.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Text(
                      AppStrings.viewOutlet.tr(),
                      style: TextStyle(
                        fontSize: FontSizeManager.s16.sp,
                      ),
                    ),
                    Text(
                      AppStrings.agreed.tr(),
                      style: TextStyle(
                        fontSize: FontSizeManager.s16.sp,
                      ),
                    ),
                    Text(
                      AppStrings.active.tr(),
                      style: TextStyle(
                        fontSize: FontSizeManager.s16.sp,
                      ),
                    ),
                    Text(
                      AppStrings.inActive.tr(),
                      style: TextStyle(
                        fontSize: FontSizeManager.s16.sp,
                      ),
                    ),
                    Text(
                      AppStrings.notAgreed.tr(),
                      style: TextStyle(
                        fontSize: FontSizeManager.s16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s30,
              ),
             const Expanded(
                child: TabBarView(
                  children: [
                    OutletScreen(),
                    AgreedOutletScreen(),
                    ActiveOutletScreen(),
                   InActiveOutletScreen(),
                    NotAgreedOutletScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
