.PHONY: ansible-lint
ansible-lint: ## run ansible lint on ansible/ folder
	podman run -it -v $(PWD):/workspace:rw,z --workdir /workspace \
		--entrypoint "/usr/local/bin/ansible-lint" quay.io/ansible/creator-ee:latest  "-vvv" "roles" "plugins" "playbooks"

.PHONY: ansible-unittest
ansible-unittest: ## run ansible unit tests
	ansible-test units --docker
