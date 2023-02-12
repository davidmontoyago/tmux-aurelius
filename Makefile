
lint:
	docker run --rm -v "$(PWD):/mnt" koalaman/shellcheck:stable --color --external-sources ./scripts/**/*.sh