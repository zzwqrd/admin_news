import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dynamic openImagePicker({context, dynamic onGalleryTapped, dynamic onCameraTapped}) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoButton(
            child: const Text(
//              translator.currentLanguage == "en" ? "Cancel" :
              "الغاء",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            CupertinoButton(
              child: Row(
                children: const [
                  Icon(
                    CupertinoIcons.photo_camera_solid,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
//                      translator.currentLanguage == "en"
//                          ? "Camera"
//                          :
                    "الكاميرا",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              onPressed: onCameraTapped,
            ),
            CupertinoButton(
              child: Row(
                children: const [
                  Icon(
                    Icons.insert_photo,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
//                      translator.currentLanguage == "en"
//                          ? "Gallery"
//                          :
                    "الاستوديو",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              onPressed: onGalleryTapped,
            ),
          ],
        );
      });
}
