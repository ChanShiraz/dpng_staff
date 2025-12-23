import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.show,
    required this.onPress,
    required this.isLoading,
    required this.uploaded,
  });
  final bool show;
  final VoidCallback onPress;
  final bool isLoading;
  final bool uploaded;

  @override
  Widget build(BuildContext context) {
    return show
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: onPress,
                child: isLoading
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                      )
                    : uploaded
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 5),
                          Text('Saved', style: TextStyle(color: Colors.white)),
                        ],
                      )
                    : Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
          )
        : SizedBox();
  }
}
