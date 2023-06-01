CC = gcc
CFLAGS = -Wall -Wextra

SRCDIR = api models routes
OBJDIR = bin

MODELSOURCES := $(wildcard $(addsuffix /models/*.c,$(SRCDIR)))
CONTROLLERSOURCES := $(wildcard $(addsuffix /controllers/*.c,$(SRCDIR)))
ROUTESOURCES := $(wildcard $(addsuffix /routes/*.c,$(SRCDIR)))

MODELOBJS := $(patsubst %.c,$(OBJDIR)/%.o,$(notdir $(MODELSOURCES)))
CONTROLLEROBJS := $(patsubst %.c,$(OBJDIR)/%.o,$(notdir $(CONTROLLERSOURCES)))
ROUTEOBJS := $(patsubst %.c,$(OBJDIR)/%.o,$(notdir $(ROUTESOURCES)))

TARGET = $(OBJDIR)/main

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(MODELOBJS) $(CONTROLLEROBJS) $(ROUTEOBJS) $(OBJDIR)/main.o
	$(CC) $(CFLAGS) $^ -o $@

$(OBJDIR)/%.o: api/models/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o: api/controllers/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.o: api/routes/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR)/main.o: main.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(MODELOBJS) $(CONTROLLEROBJS) $(ROUTEOBJS) $(OBJDIR)/main.o $(TARGET)

run:
	./bin/main
