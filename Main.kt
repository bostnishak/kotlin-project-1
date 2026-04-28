class Task(val name: String, var isCompleted: Boolean = false) {
    fun complete() {
        isCompleted = true
        println("Task $name marked as complete.")
    }
}

fun main() {
    println("Welcome to Task Manager")
    val task1 = Task("Learn Kotlin")
}
