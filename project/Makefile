name = inception

.DEFAULT_GOAL = all

env:
	./make_env.sh

all:
	@bash srcs/requirements/wordpress/tools/make_db_dirs.sh
	@docker compose -f ./srcs/docker-compose.yml up -d --build

build:
	@bash srcs/requirements/wordpress/tools/make_db_dirs.sh
	@docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:	down
	@printf "Cleaning ${name}...\n"
	@docker compose -f ./srcs/docker-compose.yml down --volumes --rmi local
	@sudo rm -rf /home/${USER}/data

fclean: down
	@printf "Clean of all docker configs\n"
	@docker system prune --all
	@sudo rm -rf /home/${USER}/data

hosts:
	@echo "127.0.0.1 dbessa.42.fr" | sudo tee -a /etc/hosts

wp-admin: hosts
	@echo "Opening WordPress admin. Use these credentials:"
	@echo "Username: ${ADM_WP_NAME} (defined in .env file)"
	@echo "Password: Check secrets/adm_wp_password.txt"
	@xdg-open https://dbessa.42.fr/wp-admin/ 2>/dev/null || echo "Please open https://dbessa.42.fr/wp-admin/ in your browser"

.PHONY: all build down clean fclean info env hosts wp-admin