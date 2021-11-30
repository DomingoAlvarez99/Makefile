.DEFAULT_GOAL := deploy
JAR_SOURCE_PATH:=./target/example-1.0-SNAPSHOT-jar-with-dependencies.jar
JAR_DEPLOY_DIR:=./deploy
JAR_DEPLOY_PATH:=$(JAR_DEPLOY_DIR)/makefile-app.jar

help: ## Show make targets
	@./scripts/help.sh
build: ## Package the app
	@rm -rf ./target
	@mvn package -DskipTests
deps: ## Download and install dependencies
	@mvn clean install -DskipTests
install: ## Move the binary into a dir
	@mkdir -p $(JAR_DEPLOY_DIR)
	@rm -f $(JAR_DEPLOY_PATH) > /dev/null
	@mv $(JAR_SOURCE_PATH) $(JAR_DEPLOY_PATH) 
.PHONY: deploy
start: ## Start the app
	@java -jar "$(JAR_DEPLOY_PATH)" &
deploy: deps test build install start ## Deploy the app 
stop: ## Stop the app
	@./scripts/kill.sh "$(JAR_DEPLOY_PATH)"
test: ## Run tests
	@mvn test
