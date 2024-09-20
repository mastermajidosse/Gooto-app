import 'dart:math';
// import 'package:Creaskale/services/api/post_api.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomChatField extends StatefulWidget {
 // final String postId;
  final VoidCallback onSend;
  final TextEditingController messageController;
  BottomChatField({
  //  required this.postId,
    required this.onSend,
    required this.messageController,
  });

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final TextEditingController _messageController = TextEditingController();
  bool isRecorderInit = false;
  bool isShowEmojiContainer = false;
  bool isRecording = false;
  FocusNode focusNode = FocusNode();
  bool isShowSendButton = false;
  bool isShow = false;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  List<String> message = [];
//  PostApi postApi = PostApi();

  void sendTextMessage() async {
    widget.onSend();
  }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      hideKeyboard();
      showEmojiContainer();
    }
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  tagFunc() {
    setState(() {
      _messageController.text = "#";
    });
  }

  //change function
  void _onChanged(String text) {
    setState(() {
      if (_messageController.text.isNotEmpty && _controller.isDismissed) {
        _controller.forward();
      } else if (_messageController.text.isEmpty && _controller.isCompleted) {
        _controller.reverse();
      }
      isShow = !isShow;
    });
  }

  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      final bottomInset = max(
          0.0,
          keyboardHeight -
              (MediaQuery.of(context).size.height -
                  renderBox.localToGlobal(Offset.zero).dy -
                  renderBox.size.height));
      setState(() {
        _isKeyboardVisible = keyboardHeight > 0;
        _bottomInset = bottomInset;
      });
    });
  }

  //
  double _bottomInset = 0.0;
  double _containerHeight1 = 300.0;
  double _containerHeight2 = 60.0;
  //
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isShowEmojiContainer ? _containerHeight1 : _containerHeight2,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      transform: Matrix4.translationValues(0.0, _bottomInset, 0.0),
      child: Column(
        children: [
          //SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              maxLength: 20,
              focusNode: focusNode,
              controller: widget.messageController,
              onChanged: _onChanged,
              decoration: InputDecoration(
                // filled: true,
                suffixIcon: Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: tagFunc,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                          width: 25,
                          height: 22,
                          child: SvgPicture.asset(
                            "assets/@.svg",
                            height: ScreenUtil().setHeight(57),
                            color: Colors.black,
                            //isLike ? Colors.red :
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: toggleEmojiKeyboardContainer,
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 39,
                        height: 40,
                        decoration: BoxDecoration(
                            // color: Color.fromARGB(255, 226, 22, 104),
                            borderRadius: BorderRadius.circular(70)),
                        child: IconButton(
                          onPressed: () => sendTextMessage(),
                          icon: Icon(Icons.arrow_upward_outlined, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Add Comment..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.all(2),
              ),
            ),
          ),
          // isShowEmojiContainer
          //     ? SingleChildScrollView(
          //         child: SizedBox(
          //           height: 240,
          //           child: EmojiPicker(
          //             onEmojiSelected: ((category, emoji) {
          //               setState(() {
          //                 _messageController.text = _messageController.text + emoji.emoji;
          //               });

          //               if (!isShowSendButton) {
          //                 setState(() {
          //                   isShowSendButton = true;
          //                 });
          //               }
          //             }),
          //           ),
          //         ),
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }
}
