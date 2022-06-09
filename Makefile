# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kferterb <kferterb@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/30 12:20:28 by kferterb          #+#    #+#              #
#    Updated: 2022/06/09 20:32:32 by kferterb         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	miniRT

SRCS 		= 	main.c \
				utils/gnl.c \
				parsing/parsing.c \
				parsing/parse_a_c_l.c \
				parsing/parse_utils.c \

HEADER		=	includes/minirt.h

OBJ 		=	$(addprefix $(OBJ_DIR), $(patsubst %.c, %.o, $(SRCS)))

OBJ_DIR		=	obj/

UTILS_DIR	=	obj/utils/

PARSE_DIR	=	obj/parsing/

LIB_PATH	= 	libft/

LINKS		= 	-I /usr/local/include -L /usr/local/lib -lmlx -framework OpenGL -framework AppKit

CC			=	gcc

CFLAGS		=	-Wall -Wextra -Werror -I$(HEADER)

.PHONY:		 	all bonus clean fclean re

all:			makelibft $(NAME)

makelibft:
				@make -C $(LIB_PATH) all

$(NAME):		$(HEADER) $(OBJ)
				$(CC) $(CFLAGS) $(OBJ) $(LIB_PATH)libft.a $(LINKS) -o $(NAME)

$(OBJ_DIR)%.o:	%.c $(HEADER)
				@mkdir -p $(OBJ_DIR) $(UTILS_DIR) $(PARSE_DIR)
				$(CC) $(FLAGS) -c $< -o $@

clean:
				@rm -rf $(OBJ_DIR) $(OBJ_DIR)
				@make -C $(LIB_PATH) clean

fclean:			clean
				@$(RM) $(NAME)
				@make -C $(LIB_PATH) fclean

re:				fclean all
