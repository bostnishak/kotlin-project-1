package com.library

interface NotificationService {
    fun sendNotification(userId: String, message: String)
}

class EmailNotificationService : NotificationService {
    override fun sendNotification(userId: String, message: String) {
        println("-> [EMAIL to User $userId] $message")
    }
}

class SmsNotificationService : NotificationService {
    override fun sendNotification(userId: String, message: String) {
        println("-> [SMS to User $userId] $message")
    }
}
