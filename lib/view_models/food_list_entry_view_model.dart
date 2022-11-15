import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/list_food_entry.dart';
import 'package:flutter_application_1/models/food_item.dart';
import 'package:flutter_application_1/view_models/food_item_view_model.dart';

final List<ListFoodEntry> initialData = List.generate(
  10,
  (index) => ListFoodEntry(
      id: index,
      storage: "Fridge",
      quantity: 3,
      owner: "Jennifer Zheng",
      dateAdded: DateTime.now()),
);

class FoodListEntryViewModel with ChangeNotifier {
  final List<ListFoodEntry> _foodItems = initialData;

  List<ListFoodEntry> get foodItems => _foodItems;
  set quantity(int q) => {quantity = q};

  static FoodItem? getFoodItem(id) {
    return FoodItemViewModel.getFoodItem(id);
  }

  static ListFoodEntry? getListFoodEntry(int id) {
    for (var item in initialData) {
      if (item.id == id) return item;
    }
    return null;
  }

  void addFoodItemEntry(
      int id, String storage, int quantity, String owner, DateTime dateAdded) {
    _foodItems.add(
      ListFoodEntry(
        id: id,
        storage: storage,
        quantity: quantity,
        owner: owner,
        dateAdded: dateAdded,
      ),
    );
  }

  static String getInitials(ListFoodEntry listFoodEntry) {
    var buffer = StringBuffer();
    var split = listFoodEntry.owner.split(' ');
    for (var i = 0; i < split.length; i++) {
      buffer.write(split[i][0].toUpperCase());
    }

    return buffer.toString();
  }

  static String expirationString(int id) {
    ListFoodEntry? listFoodEntry = FoodListEntryViewModel.getListFoodEntry(id);
    FoodItem? foodItem = FoodItemViewModel.getFoodItem(id);
    Duration timePassed = DateTime.now().difference(listFoodEntry!.dateAdded);
    // Duration? daysToExpire = Duration(days: foodItem!.daysToExpire);

    if (timePassed.inDays == foodItem!.daysToExpire) {
      return "Expires Today";
    }

    if (timePassed.inDays > foodItem.daysToExpire) {
      return "Expired by ${timePassed.inDays - foodItem.daysToExpire} Day";
    }

    if (foodItem.daysToExpire - timePassed.inDays > 1) {
      return "${foodItem.daysToExpire - timePassed.inDays} days left";
    } else {
      return "${foodItem.daysToExpire - timePassed.inDays} day left";
    }
  }
}
