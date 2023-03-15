import 'package:flutter/material.dart';
import 'package:products_app/ui/views/home.dart';
import 'core/services/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //confirm that executed  local_storage_service
  await FavoriteService.init();
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}
