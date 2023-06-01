#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "todo.h"
#include "status.h"

Todo* newTodo(int id, const char* title, const char* description, Status status) {
	Todo* todo = (Todo*)malloc(sizeof(Todo));
    if (todo == NULL) {
        fprintf(stderr, "Error: Failed to allocate memory for Todo\n");
        return NULL;
    }

    todo->id = id;
    strncpy(todo->title, title, sizeof(todo->title) - 1);
    strncpy(todo->description, description, sizeof(todo->description) - 1);
    todo->status = status;

    return todo;
}

void setTitle(Todo* todo, const char* title) {
	strncpy(todo->title, title, sizeof(todo->title) - 1);
    todo->title[sizeof(todo->title) - 1] = '\0';
}

void setDescription(Todo* todo, const char* description) {
	strncpy(todo->description, description, sizeof(todo->description) - 1);
    todo->description[sizeof(todo->description) - 1] = '\0';
}

void setStatus(Todo* todo, Status status) {
	todo->status = status;
}

void deleteTodo(Todo* todo) {
    free(todo);
}
