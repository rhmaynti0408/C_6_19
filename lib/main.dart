import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/orders.dart';
import 'screens/user_products/add_products.dart';
import './screens/user_products/user_products.dart';
import './provider/order_provider.dart';
import './widgets/navigator.dart';
import './provider/cart_provider.dart';
import './screens/cart.dart';
import './screens/product_details/product_details.dart';
import './provider/product_provider.dart';
import './routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Scarlett_Shop/cubit/auth_cubit.dart';
import 'package:Scarlett_Shop/cubit/page_cubit.dart';
import 'package:Scarlett_Shop/screens/login.dart';
import 'package:Scarlett_Shop/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PageCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => CartProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => OrderProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scarlett Shop',
            theme: ThemeData(
                primarySwatch: Colors.pink,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            // home:  RegisterPage(),
            routes: {
              '/': (context) => RegisterPage(),
              'register-page': ((context) => RegisterPage()),
              'login-page': (context) => LoginPage(),
              'main-page': (context) => NavigatorWidget(),
              Routes.productDetails: (context) => const ProductDetails(),
              Routes.cartScreen: (context) => const CartScreen(),
              Routes.orderScreen: (context) => const OrderScreen(),
              Routes.userProduct: (context) => const UserProductsScreen(),
              Routes.addUserProduct: (context) => const AddUserProduct(),
            },
          ),
        ));
  }
}
