class todoModel{
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  todoModel({required this.id,
    required this.todo,
    required this.completed,
    required this.userId,});

  factory todoModel.fromJson(Map<String,dynamic> json){
    return todoModel(id: json['id'], todo: json['todo'], completed: json['completed'], userId: json['userId']);
  }
}