get:
	flutter pub get

analyze:
	dart pub global run tool analyze
	dcm analyze --fatal-style --fatal-performance --fatal-warnings --ci-key=$(DCM_CI_KEY) --email=$(DCM_CI_EMAIL) .
	dcm check-unused-files --ci-key=$(DCM_CI_KEY) --email=$(DCM_CI_EMAIL) . --exclude=$(excludeUnused)

build:
	dart run build_runner build --delete-conflicting-outputs
