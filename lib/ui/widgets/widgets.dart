import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vmart/shared/shared.dart';
import 'package:http/http.dart' as http;
import '../../models/models.dart';

import '../../providers/providers.dart';
import '../../shared/shared.dart';
import '../../shared/shared.dart';
import '../pages/pages.dart';

part 'home_page/product_card/product_card.dart';
part 'home_page/loading_button/loading_button.dart';
part 'home_page/checkout_widget/checkout_card/checkout_card.dart';
part 'home_page/checkout_widget/address_list/address_list.dart';
part 'home_page/checkout_widget/select_delivery/select_delivery.dart';
part 'home_page/cart_card/cart_card.dart';

part 'home_page/product_tile/product_tile.dart';
part 'home_page/product_all/product_all.dart';
part 'home_page/wishlist_card/wishlist_card.dart';
part 'home_page/tips_item/home_tips_item.dart';
part 'home_page/chat_bubble/chat_bubble.dart';

part 'home_page/chat_tile/chat_tile.dart';

part 'home_page/profile/my_order_widget/finish_widget.dart';
part 'home_page/profile/my_order_widget/processed_widget.dart';
part 'home_page/profile/my_order_widget/my_order_card.dart';

part 'home_page/categories_widget/special_categories.dart';