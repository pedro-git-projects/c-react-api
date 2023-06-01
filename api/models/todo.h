#ifndef PEDRO_GIT_PROJECTS_C_REACT_API_TODO_H 
#define PEDRO_GIT_PROJECTS_C_REACT_API_TODO_H 

#include "status.h"

typedef struct {
    int id;
    char title[100];
    char description[255];
    Status status;
} Todo;

Todo* newTodo(int id, const char* title, const char* description, Status status);
void setTitle(Todo* todo, const char* title);
void setDescription(Todo* todo, const char* description);
void setStatus(Todo* todo, Status status);
void deleteTodo(Todo* todo);

#endif
