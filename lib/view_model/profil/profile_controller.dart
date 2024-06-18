import 'dart:io';

import 'package:dattingapp/view_model/services/session_manager.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/utils.dart';
import '../../res/component/costume_iconbutton.dart';
import '../../res/component/short_H_bar.dart';

class ProfileController with ChangeNotifier {
  final DatabaseReference dbref = FirebaseDatabase.instance.ref().child("User");
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final piker = ImagePicker();

  XFile? _image;

  XFile? get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await piker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await piker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }


  void pickImages(BuildContext context) {
    showBottomSheet(
      backgroundColor: const Color.fromRGBO(44, 61, 108, 1),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Profil Photo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                  iconColor: Colors.white,
                )
              ],
            ),
            Divider(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                imagePickerIcon(
                    onTap: () {
                      Navigator.of(context).pop(pickCameraImage(context));
                      notifyListeners();
                    },
                    icon: Icons.camera_alt_rounded,
                    text: 'Camera'),
                const SizedBox(
                  width: 15,
                ),
                imagePickerIcon(
                    onTap: () {
                      Navigator.of(context).pop(pickGalleryImage(context));
                      notifyListeners();
                    },
                    icon: Icons.photo_camera_back_rounded,
                    text: 'Gallery'),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required text,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onTap,
          icon: icon,
          iconColor: Colors.white,
          minWidth: 50,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  void uploadImage(BuildContext context) async {
    setLoading(true);
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage : ' + SessionController().userId.toString());
    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    dbref
        .child(SessionController().userId.toString())
        .update({'Profile': newUrl.toString()}).then((value) {
      Utils.toasstMessage('Profile Update');
      setLoading(false);
      _image = null;
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toasstMessage(error.toString());
    });
  }
}
