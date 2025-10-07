import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/shared_widgets/show_snack_bar.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/chat/presentation/view_models/chat_cubit.dart';
import 'package:shakshak/generated/assets.dart';

import '../../../../generated/l10n.dart';
import '../widgets/chat_list_item.dart';

class ChatView extends StatefulWidget {
  final int tripId; // Add tripId parameter

  const ChatView({
    super.key,
    required this.tripId,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      "text":
          "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore.",
      "isSent": true,
      "time": "10 AM",
      "avatar": "assets/images/user1.png"
    },
    {
      "text":
          "Sed Do Eiusmod Tempor Incididunt Ut Labore Et Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliqui.",
      "isSent": false,
      "time": "10 AM",
      "avatar": "assets/images/user2.png"
    },
    {
      "text": "Lorem Ipsum Dolor Sit",
      "isSent": true,
      "time": "10 AM",
      "avatar": "assets/images/user1.png"
    },
    {
      "text":
          "Sed Do Eiusmod Tempor Incididunt Ut Labore Et Magna Aliqua. Ut Enim Ad Minim Veniam,.",
      "isSent": false,
      "time": "10 AM",
      "avatar": "assets/images/user2.png"
    },
    {
      "text": "Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing",
      "isSent": true,
      "time": "10 AM",
      "avatar": "assets/images/user1.png"
    },
    {
      "text": "Sed Do Eiusmod Tempor Incididunt Ut Labore Et",
      "isSent": false,
      "time": "10 AM",
      "avatar": "assets/images/user2.png"
    },
    {
      "text": "Ok",
      "isSent": true,
      "time": "10 AM",
      "avatar": "assets/images/user1.png"
    },
  ];

  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      final messageText = _messageController.text;

      context.read<ChatCubit>().sendMessage(
            tripId: widget.tripId,
            message: messageText,
          );

      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayoutView(
      header: buildChatAppBar(context),
      body: BlocListener<ChatCubit, ChatState>(
        listener: (context, state) {
          if (state is SendMessageSuccess) {
            // Add message to local list on success
            setState(() {
              messages.add({
                "text": state.writeUsModel.message ?? '',
                "isSent": true,
                "time": "10 AM",
                "avatar": "assets/images/user1.png",
              });
            });

            showSnackBar(
                context,
                'تم إرسال الرسالة بنجاح',
                S.of(context).doneSuccessfully,
                AppColors.primaryColor,
                ContentType.success);
          } else if (state is SendMessageFailure) {
            showSnackBar(
                context,
                state.errorMessage,
                S.of(context).errorOccurred,
                AppColors.primaryColor,
                ContentType.failure);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: false,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isSent = message["isSent"];

                  return ChatListItem(isSent: isSent, message: message);
                },
              ),
            ),
            BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                final isLoading = state is SendMessageLoading;

                return Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _messageController,
                        hint: 'اكتب الرسالة هنا...',
                        isReadOnly: isLoading,
                      ),
                    ),
                    12.pw,
                    GestureDetector(
                      onTap: isLoading ? null : sendMessage,
                      child: Container(
                        width: 46.r,
                        height: 46.r,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: isLoading
                              ? AppColors.primaryColor.withOpacity(0.5)
                              : AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.r,
                              )
                            : SvgPicture.asset(
                                Assets.svgSend,
                                height: 26.r,
                                width: 26.r,
                              ),
                      ),
                    )
                  ],
                ).paddingSymmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChatAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            'مصطفى الاعصر',
            textAlign: TextAlign.center,
            style: Styles.textStyle18SemiBold(context)
                .copyWith(color: Colors.white),
          ),
          Text(
            '( سائق )',
            style: Styles.textStyle14Medium(context)
                .copyWith(color: AppColors.lightGreyColor),
          ),
        ],
      ),
    );
  }
}
