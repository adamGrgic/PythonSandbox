struct Task:
    var id: Int
    var description: String
    var completed: Bool

    fn new(id: Int, description: String) -> Task:
        return Task(id, description, False)

    fn mark_completed(self):
        self.completed = True

struct TodoList:
    var tasks: List[Task] = List[Task]()

    fn add_task(self, description: String):
        var new_task = Task.new(self.tasks.size(), description)
        self.tasks.append(new_task)
        print("Task added: " + description)

    fn list_tasks(self):
        print("\nTodo List:")
        for task in self.tasks:
            status = "✔" if task.completed else "✘"
            print(f"{task.id}: {status} {task.description}")

    fn complete_task(self, task_id: Int):
        if task_id < self.tasks.size():
            self.tasks[task_id].mark_completed()
            print(f"Task {task_id} marked as completed!")
        else:
            print("Invalid Task ID")

fn main():
    var todo = TodoList()

    while True:
        print("\nOptions:")
        print("1. Add Task")
        print("2. List Tasks")
        print("3. Complete Task")
        print("4. Exit")

        var choice: Int = Int(input("Enter your choice: "))

        if choice == 1:
            var description: String = input("Enter task description: ")
            todo.add_task(description)
        elif choice == 2:
            todo.list_tasks()
        elif choice == 3:
            var task_id: Int = Int(input("Enter task ID to mark complete: "))
            todo.complete_task(task_id)
        elif choice == 4:
            print("Exiting... Goodbye!")
            break
        else:
            print("Invalid choice. Try again!")

main()
