class ModelTask {
int? id;
String? status;
String? tasktitle;
String? tasktime;
String? taskdate;

ModelTask({required this.tasktitle,required this.tasktime,required this.taskdate});


ModelTask.frommap (Map m)
{
  id=m['id'];
  tasktitle=m['taskname'];
  tasktime=m['time'];
  taskdate=m['date'];
  status=m['status'];


}

}