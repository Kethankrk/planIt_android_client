import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/appbar.dart';
import 'package:planit/widgets/my_events_page/my_events_section.dart';
import 'package:planit/widgets/my_events_page/participate_section.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  int active = 1;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgroundColor: Colors.black,
      appbar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        leading: hompageAppBar,
        leadingWidth: double.infinity,
      ),
      child: Column(
        children: [
          CustomSlidingSegmentedControl<int>(
            isStretch: true,
            initialValue: 1,
            children: const {
              1: CustomText(text: "Participating event"),
              2: CustomText(text: "My events"),
            },
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            thumbDecoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            onValueChanged: (v) {
              setState(() {
                active = v;
              });
            },
          ),
          const SizedBox(height: 20),
          active == 1
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .56,
                  child: const ParticipateSection(),
                )
              : const MyEventsSection()
        ],
      ),
    );
  }
}
