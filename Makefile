.DEFAULT_GOAL := deploy
JAR_FILE_PATH:=./target/example-1.0-SNAPSHOT-jar-with-dependencies.jar

help: ## Show make targets
	@./scripts/help.sh
build: deps ## Run the tests and package the app
	@rm -rf ./target
	@mvn package
deps: ## Download dependencies
	@mvn clean install
deploy: build ## Deploy the app
	@java -jar "$(JAR_FILE_PATH)" &
stop: ## Stop the app
	@./scripts/kill.sh "$(JAR_FILE_PATH)"
test: ## Run tests
	@mvn test
