import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/screens/onboarding/widgets/widgets.dart';
import '../../../widgets/widgets.dart';
import '../../screens.dart';

class BioTab extends StatelessWidget {
  const BioTab({
    Key? key,
    required this.state,
  }) : super(key: key);

  final OnboardingLoaded state;

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenLayout(
      currentStep: 5,
      children: [
        CustomTextHeader(text: 'Describe Your Dog'),
        CustomTextField(
          hint: 'ENTER YOUR DOG\'S BIO',
          onChanged: (value) {
            context.read<OnboardingBloc>().add(
                  UpdateUser(
                    user: state.user.copyWith(bio: value),
                  ),
                );
          },
        ),
        SizedBox(height: 50),
        CustomTextHeader(text: 'What do you do?'),
        CustomTextField(
          hint: 'ENTER YOUR JOB TITLE',
          onChanged: (value) {
            context.read<OnboardingBloc>().add(
                  UpdateUser(
                    user: state.user.copyWith(jobTitle: value),
                  ),
                );
          },
        ),
        SizedBox(height: 50),
        CustomTextHeader(text: 'Breeds & Interest'),
        Row(
          children: [
            CustomTextContainer(text: 'SHIH TZU'),
            CustomTextContainer(text: 'HUSKY'),
            CustomTextContainer(text: 'CHIHUAHUA'),
          ],
        ),
        Row(
          children: [
            CustomTextContainer(text: 'GOLDEN RETRIEVER'),
            CustomTextContainer(text: 'AMERICAN BULLY'),
          ],
        ),
        Row(
          children: [
            CustomTextContainer(text: 'POODLE'),
            CustomTextContainer(text: 'PARTNER'),
            CustomTextContainer(text: 'FRIEND'),
          ],
        ),
      ],
      onPressed: () {
        context
            .read<OnboardingBloc>()
            .add(ContinueOnboarding(user: state.user));
      },
    );
  }
}
