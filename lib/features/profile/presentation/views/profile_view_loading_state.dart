import 'package:flutter/material.dart';

class ProfileViewLoadingState extends StatefulWidget {
  const ProfileViewLoadingState({super.key});

  @override
  State<ProfileViewLoadingState> createState() =>
      _ProfileViewLoadingStateState();
}

class _ProfileViewLoadingStateState extends State<ProfileViewLoadingState> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
