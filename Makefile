COMPILER = cc
NAME = opengl
CFLAGS = -Wall -Werror -Wextra -Iincludes
LIBS = -lglfw -lGL
SRC_DIR = src
OBJ_DIR = build

SRC = $(SRC_DIR)/main.c 

OBJ = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

all: $(NAME)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	$(COMPILER) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ)
	$(COMPILER) $(CFLAGS) $(OBJ) $(LIBS) -o $(NAME)



clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(NAME)
