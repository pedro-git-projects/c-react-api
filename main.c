#include <stdio.h>
#include "api/models/todo.h"
#include "api/models/status.h"

int main() {
	Todo* t = newTodo(1, "lol", "loool",TODO_STATUS_COMPLETED);
	printf("%d\n", t->id);
}
