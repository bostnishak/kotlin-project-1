class Task(val name: String, var isCompleted: Boolean = false) {
    fun complete() {
        isCompleted = true
    }
}

fun main() {
    println("Welcome to Task Manager")
}
