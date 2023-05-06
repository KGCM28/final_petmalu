// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// import '../widget/widgets.dart';

// class EmailVerification extends StatelessWidget {
//   final TabController tabController;

//   const EmailVerification({
//     super.key,
//     required this.tabController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();

//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 30,
//         vertical: 50,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               CustomTextHeader(
//                   tabController: tabController,
//                   text: 'Did You Get The Verification Code?'),
//               CustomTextField(
//                 tabController: tabController,
//                 text: 'ENTER YOUR CODE',
//                 controller: controller,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               StepProgressIndicator(
//                 totalSteps: 6,
//                 currentStep: 2,
//                 selectedColor: Theme.of(context).primaryColor,
//                 unselectedColor: Color(0xFFF4F4F4),
//               ),
//               SizedBox(height: 10),
//               CustomButton(tabController: tabController, text: 'NEXT STEP'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
