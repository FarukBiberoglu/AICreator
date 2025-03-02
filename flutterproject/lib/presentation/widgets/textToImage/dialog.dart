import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutterproject/presentation/widgets/textToImage/dialog_mixin.dart';
import '../../../core/widgets/elevatedbutton/custom_button.dart';

class SimpleImageDialog extends StatefulWidget {
  final Uint8List imagememory;

  const SimpleImageDialog({
    super.key,
    required this.imagememory,
  });

  @override
  State<SimpleImageDialog> createState() => _SimpleImageDialogState();
}

class _SimpleImageDialogState extends State<SimpleImageDialog> with DialogMixin {


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey[800]!,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.memory(
                widget.imagememory,
                fit: BoxFit.cover,
                width: double.infinity,
              ),

             Padding(
               padding: const EdgeInsets.only(top: 8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CustomElevatedButton(
                      onPressed: isLoadingImage ? null : saveImage,
                      child: isLoadingImage
                          ? CircularProgressIndicator()
                          : Row(
                        children: [
                          Text('Download', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 5),
                          Icon(Icons.download, color: Colors.white),
                        ],
                      ),
                    ),

                    SizedBox(width: 25),

                    CustomElevatedButton(
                      onPressed: shareImage,
                      child: Row(
                        children: [
                          Text('Share', style: TextStyle(fontSize: 18)),
                          SizedBox(width: 5),
                          Icon(Icons.share, color: Colors.white),
                        ],
                      ),
                    ),

                  ],
                ),
             ),


          ],
        ),
      ),
    );
  }
}
