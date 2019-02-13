class DataItem {
  final List<String> ingredients;
  final List<String> steps;

  DataItem({this.ingredients, this.steps});
  factory DataItem.fromJson(Map<String, dynamic> json) {
     var stepsFromJson=json['steps'];
      var ingredientsFromJson=json['ingredients'];
   print('ingredientssssssssssssss');
    List<String> stepsList = stepsFromJson.cast<String>();
    List<String> ingredientList = ingredientsFromJson.cast<String>();
    return DataItem(ingredients: ingredientList, steps: stepsList);
  }
}
