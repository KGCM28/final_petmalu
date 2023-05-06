import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/screens/onboarding/widgets/widgets.dart';
import '../onboarding_screen.dart';

class DemoTab extends StatelessWidget {
  const DemoTab({
    Key? key,
    required this.state,
  }) : super(key: key);

  final OnboardingLoaded state;

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenLayout(
      currentStep: 3,
      children: [
        CustomTextHeader(text: 'What\'s Your Dog\'s Name?'),
        SizedBox(height: 20),
        CustomTextField(
          hint: 'ENTER YOUR DOG\'S NAME',
          onChanged: (value) {
            context.read<OnboardingBloc>().add(
                  UpdateUser(
                    user: state.user.copyWith(name: value),
                  ),
                );
          },
        ),
        SizedBox(height: 50),
        CustomTextHeader(text: 'What\'s Your Dog\'s Gender?'),
        SizedBox(height: 20),
        CustomCheckbox(
          text: 'MALE',
          value: state.user.gender == 'Male',
          onChanged: (bool? newValue) {
            context.read<OnboardingBloc>().add(
                  UpdateUser(
                    user: state.user.copyWith(gender: 'Male'),
                  ),
                );
          },
        ),
        CustomCheckbox(
          text: 'FEMALE',
          value: state.user.gender == 'Female',
          onChanged: (bool? newValue) {
            context.read<OnboardingBloc>().add(
                  UpdateUser(
                    user: state.user.copyWith(gender: 'Female'),
                  ),
                );
          },
        ),
        SizedBox(height: 30),
        CustomTextHeader(text: ' Dog\'s Age?'),
        CustomTextField(
          hint: 'ENTER YOUR Dog\'s AGE',
          onChanged: (value) {
            context.read<OnboardingBloc>().add(
                  UpdateUser(
                    user: state.user.copyWith(age: int.parse(value)),
                  ),
                );
          },
        ),
        SizedBox(height: 30),
      ],
      onPressed: () {
        context
            .read<OnboardingBloc>()
            .add(ContinueOnboarding(user: state.user));
      },
    );
  }
}
