class Task(val name: String, var isCompleted: Boolean = false) {
    fun complete() {
        isCompleted = true
        println("Task $name marked as complete.")
    }
}

class TaskManager {
    private val tasks = mutableListOf<Task>()

    fun addTask(name: String) {
        val task = Task(name)
        tasks.add(task)
        println("Added: $name")
    }

    fun listTasks() {
        println("Current Tasks:")
        for (task in tasks) {
            val status = if (task.isCompleted) "[X]" else "[ ]"
            println("$status ${task.name}")
        }
    }
    
    fun completeTask(name: String) {
        val task = tasks.find { it.name == name }
        if (task != null) {
            task.complete()
        } else {
            println("Task not found")
        }
    }
}

fun main() {
    println("Welcome to Task Manager")
    val manager = TaskManager()
    manager.addTask("Learn Kotlin")
    manager.addTask("Write 15 commits")
}
