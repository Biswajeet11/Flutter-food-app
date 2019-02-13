
class DataRecipe {
  final String title;
  final String image;
  final String description;
  DataRecipe({this.title,this.image,this.description});
  factory DataRecipe.fromJson(Map<String,dynamic> json){
    return DataRecipe(
      image:json['image'],
      title:json['title'],
      description:json['description'], 
    );
  }
}

