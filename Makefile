include include.mk

NAME = cub3D
LIBFT_DIR = ./libft

CC = cc
CFLAGS = -Wall -Wextra -Werror -g3 -I./include

OBJS = $(SRCS:.c=.o)

INCLUDES = -I$(LIBFT_DIR)/include
LDFLAGS = -lmlx -lXext -lX11 -lm -L$(LIBFT_DIR) -lft
CFLAGS += $(INCLUDES)

all: libft $(NAME)

libft:
	@$(MAKE) -C $(LIBFT_DIR)

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $(NAME)

clean:
	@rm -rf $(OBJS)
	@$(MAKE) -C $(LIBFT_DIR) clean

fclean: clean
	@$(MAKE) -C $(LIBFT_DIR) fclean
	@rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re libft
