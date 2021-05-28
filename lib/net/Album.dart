class Album {
  final String item_name;
  final int item_id;
  final String photo;

  Album({
    this.item_name,
    this.item_id,
    this.photo,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        item_id: json['id'], item_name: json['title'], photo: json['url']);
  }
}
