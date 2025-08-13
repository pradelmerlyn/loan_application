clean_rebuild: ## Clean the flutter project cache
	flutter clean
	flutter packages get

build_runner: ## This command generates models for freezed and json_serializable
	flutter pub run build_runner build --delete-conflicting-outputs