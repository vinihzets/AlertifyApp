import 'package:alertifyapp/features/walkthrough/presentation/bloc/walkthrough_bloc.dart';
import 'package:alertifyapp/features/walkthrough/presentation/bloc/walkthrough_event.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class WalkthroughPage extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final bool isFinal;

  const WalkthroughPage(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.isFinal});

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  late WalkthroughBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(widget.description),
        ),
        const SizedBox(height: 16),
        widget.imageUrl.isNotEmpty
            ? CircleAvatar(
                backgroundImage: NetworkImage(widget.imageUrl),
              )
            : Container(),
        widget.isFinal
            ? IconButton(
                onPressed: () {
                  bloc.dispatchEvent(WalkthroughEventSetPreferences());
                  bloc.dispatchEvent(WalkthroughEventNavigate(context));
                },
                icon: const Icon(Icons.arrow_right_alt_rounded))
            : Container()
      ],
    );
  }
}
