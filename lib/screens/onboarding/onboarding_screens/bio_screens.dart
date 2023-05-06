// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';

// import '../../../blocs/blocs.dart';
// import '../widget/widgets.dart';

// class Bio extends StatelessWidget {
//   final TabController tabController;
//   const Bio({
//     super.key,
//     required this.tabController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OnboardingBloc, OnboardingState>(
//       builder: (context, state) {
//         if (state is OnboardingLoading) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (state is OnboardingLoaded) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomTextHeader(text: 'Describe Your Dog a Bit'),
//                     CustomTextField(
//                       text: 'ENTER YOUR DOG\'S BIO',
//                       onChanged: (value) {
//                         context.read<OnboardingBloc>().add(
//                               UpdateUser(
//                                 user: state.user.copyWith(bio: value),
//                               ),
//                             );
//                       },
//                     ),
//                     SizedBox(height: 100),
//                     CustomTextHeader(text: 'BREED & PURPOSE'),
//                     Row(
//                       children: [
//                         CustomTextContainer(text: 'Shih Tzu'),
//                         CustomTextContainer(text: 'Bully'),
//                         CustomTextContainer(text: 'Askal'),
//                         CustomTextContainer(text: 'Aspin'),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         CustomTextContainer(text: 'Friends'),
//                         CustomTextContainer(text: 'Breed'),
//                         CustomTextContainer(text: 'Partner'),
//                         CustomTextContainer(text: 'FuBu'),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     StepProgressIndicator(
//                       totalSteps: 6,
//                       currentStep: 4,
//                       selectedColor: Theme.of(context).primaryColor,
//                       unselectedColor: Color(0xFFF4F4F4),
//                     ),
//                     SizedBox(height: 10),
//                     CustomButton(
//                         tabController: tabController, text: 'NEXT STEP'),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Text('Somgething went wrong');
//         }
//       },
//     );
//   }
// }
