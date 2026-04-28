package com.library

enum class Genre {
    FICTION, NON_FICTION, SCIENCE, HISTORY, FANTASY, BIOGRAPHY, TECHNOLOGY
}

data class Author(
    val id: String,
    val name: String,
    val bio: String
) {
    override fun toString(): String = name
}
