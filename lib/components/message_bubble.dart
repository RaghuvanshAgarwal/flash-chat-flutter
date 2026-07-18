import 'package:flash_chat/modals/message.dart';
import 'package:flash_chat/theme.dart';
import 'package:flash_chat/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.isMine, required this.message});
  final bool isMine;
  final Message message;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final spacing = theme.extension<AppSpacing>()!;
    final String timestamp = message.timestamp != null
        ? DateFormat('EEE d MMM h:mm a').format(message.timestamp!)
        : 'Sending...';
    final Color? cardColor = isMine
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.secondaryContainer;
    final Color? textColor = isMine
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSecondaryContainer;
    return Padding(
      padding: EdgeInsets.all(spacing.s3!),
      child: Align(
        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: isMine
                  ? BorderRadiusGeometry.only(
                      topLeft: Radius.circular(
                        Constants.kMessageBubbleBorderRadius,
                      ),
                      bottomLeft: Radius.circular(
                        Constants.kMessageBubbleBorderRadius,
                      ),
                      bottomRight: Radius.circular(
                        Constants.kMessageBubbleBorderRadius,
                      ),
                    )
                  : BorderRadiusGeometry.only(
                      topLeft: Radius.circular(
                        Constants.kMessageBubbleBorderRadius,
                      ),
                      topRight: Radius.circular(
                        Constants.kMessageBubbleBorderRadius,
                      ),
                      bottomRight: Radius.circular(
                        Constants.kMessageBubbleBorderRadius,
                      ),
                    ),
            ),
            color: cardColor,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(spacing.s3!),
              child: Column(
                crossAxisAlignment: isMine
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                spacing: spacing.s2!,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${isMine ? 'You' : message.sender}: $timestamp',
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: textColor?.withAlpha(150),
                      ),
                    ),
                  ),
                  Text(
                    message.message,
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
