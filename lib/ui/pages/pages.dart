import 'dart:async';
import 'dart:convert';
// import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vmart/models/models.dart';
import 'package:vmart/providers/providers.dart';
import 'package:vmart/ui/pages/home/education_page/recipe_page.dart';
import 'package:vmart/ui/widgets/home_page/profile/my_order_widget/rating_stars.dart';

import '../../models/user_model/user_model.dart';

import '../../services/services.dart';
import '../../shared/shared.dart';
import 'package:http/http.dart' as http;
import '../widgets/home_page/profile/my_order_widget/order_complited_notifier.dart';
import '../widgets/widgets.dart';

// import 'home/profile_page/my_order/my_order.dart';

part 'home/home_page/home_page.dart';

part 'home/checkout_success_page/checkout_success_page.dart';
part 'home/checkout_page/checkout_page.dart';
part 'home/all_product_page/all_products_page.dart';
part 'home/cart_page/cart_page.dart';
part 'home/profile_page/my_order/my_order.dart';
part 'home/profile_page/education/education.dart';
part 'home/product_page/product_page.dart';
part 'home/edit_profile_page/edit_profile_page.dart';
part 'home/detail_chat_page/detail_chat_page.dart';
part 'home/profile_page/profile_page.dart';

part 'home/wishlist_page/wishlist_page.dart';
part 'home/chat_page/chat_page.dart';
part 'home/main_page/main_page.dart';
part 'splash_page/splash_page.dart';

part 'sign_in_page/sign_in_page.dart';
part 'sign_up_page/sign_up_page.dart';
