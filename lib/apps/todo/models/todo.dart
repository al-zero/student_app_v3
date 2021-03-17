class Todo{
   int id;
  final String title;
  final String description;
  final bool complete;

  Todo({this.id, this.title ,this.description, this.complete});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      id: json['id'],
      title: json['title'] ,
      description: json['description'],
      complete: json['complete'],
    );
  }

  dynamic toJson()=>{
    'id': id,
    'title': title,
    'description':description,
    'complete': complete,
  };
}