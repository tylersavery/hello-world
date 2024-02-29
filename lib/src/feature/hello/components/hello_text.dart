import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/src/feature/hello/constants.dart';
import 'package:helloworld/src/feature/hello/models/article.dart';
import 'package:helloworld/src/feature/hello/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HelpText extends StatelessWidget {
  final Article article;
  const HelpText({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final result = needleFromHaystack(TARGET_VALUE, article.extract);

    final success = result == TARGET_VALUE;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Article Extract"),
                    content: Text(article.extract),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  );
                });
          },
          child: Text(
            result,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: success ? Colors.green : Colors.red,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(style: const TextStyle(color: Colors.black87, fontSize: 16), children: [
              const TextSpan(text: "From "),
              TextSpan(
                text: article.title,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrlString(article.url);
                  },
              ),
            ]),
          ),
        ),
        if (article.thumbnail != null)
          CachedNetworkImage(
            imageUrl: article.thumbnail!,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          )
      ],
    );
  }
}
