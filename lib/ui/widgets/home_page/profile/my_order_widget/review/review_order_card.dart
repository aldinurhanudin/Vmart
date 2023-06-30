import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vmart/models/models.dart';

import '../../../../../../providers/providers.dart';
import '../../../../../../shared/shared.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewOrderCard extends StatefulWidget {
  final CartModel cart;
  const ReviewOrderCard(this.cart);

  @override
  State<ReviewOrderCard> createState() => _ReviewOrderCardState();
}

class _ReviewOrderCardState extends State<ReviewOrderCard> {
  TextEditingController reviewController = TextEditingController();
  bool showTextInput = false;

  File? image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('No image selected');
    }
  }

  void sendDataToFirebase(double rating, String review) async {
    CollectionReference reviewsCollection =
        FirebaseFirestore.instance.collection('reviews');

    try {
      await reviewsCollection.add({
        'rating': rating,
        'review': review,
      });
      print('Data successfully sent to Firebase');
    } catch (error) {
      print('Error sending data to Firebase: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        setState(() {
          showTextInput = !showTextInput;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), 
            ),
          ],
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.cart.product!.galleries![0].url,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cart.product!.name,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Text(
                        '${widget.cart.quantity} Barang',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // cartProvider.removeCart(cart.id!);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Divider(
              thickness: 0.8,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.edit_outlined,
                  size: 30,
                ),
                SizedBox(width: 5),
                Text('Testimoni'),
                SizedBox(width: 32),
                Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Text('Foto'),
                ),
              ],
            ),
            if (showTextInput)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.green,
                    colorScheme: ColorScheme.light(
                      primary: Colors.green,
                    ),
                  ),
                  child: TextField(
                    controller: reviewController,
                    decoration: InputDecoration(
                      labelText: 'Yuk isi testimoninya',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            if (image != null)
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          image = null;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (showTextInput)
              ElevatedButton(
                onPressed: () {
                  double rating = 5.0;
                  String review = reviewController.text;
                  sendDataToFirebase(rating, review);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text('Kirim'),
              ),
          ],
        ),
      ),
    );
  }
}
