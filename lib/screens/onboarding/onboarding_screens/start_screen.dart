import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/blocs/blocs.dart';
import '/screens/onboarding/widgets/widgets.dart';

class StartTab extends StatelessWidget {
  const StartTab({
    Key? key,
    required this.state,
  }) : super(key: key);

  final OnboardingLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              height: 250,
              width: 250,
              child: Image(
                image: AssetImage('assets/splash.gif'),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Welcome to PETMALU',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 20),
            Text(
              'We\'re thrilled to have you using our pet matching application! We\'re excited to help you find the perfect partner for your furry friend.',
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(height: 1.8),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        CustomButton(
          text: 'START',
          onPressed: () {
            context
                .read<OnboardingBloc>()
                .add(ContinueOnboarding(user: state.user));
          },
        )
      ],
    );
  }
}
