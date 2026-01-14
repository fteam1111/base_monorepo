flutter_install:
	@fvm use 3.35.7
	@fvm flutter clean
	@fvm flutter pub get
clean_ios:
	@cd ios && rm -rf Pods && rm -f Podfile.lock && fvm flutter pub get && fvm flutter precache --ios && pod install && cd ..
run_analyze:
	@fvm dart pub global activate melos >/dev/null 2>&1 || true
	@melos exec --fail-fast -- flutter analyze --fatal-infos --fatal-warnings

# VERSION và BUILD dùng để tạo tag release/CD, ví dụ:
# make run_uat_cd VERSION=1.2.3 BUILD=45
# Tag tạo ra: uat.1.2.3-45
run_uat_cd:
	@git tag -a uat.${VERSION}-${BUILD} -m "uat ${VERSION}(${BUILD})" && git push origin uat.${VERSION}-${BUILD}
run_prod_cd:
	@git tag -a prod.${VERSION}-${BUILD} -m "prod ${VERSION}(${BUILD})" && git push origin prod.${VERSION}-${BUILD}

# Xoá tag (local + remote) nếu tạo nhầm, ví dụ:
# make revert_uat_tag VERSION=1.2.3 BUILD=45
revert_uat_tag:
	@git tag -d uat.${VERSION}-${BUILD} && git push --delete origin uat.${VERSION}-${BUILD}
revert_prod_tag:
	@git tag -d prod.${VERSION}-${BUILD} && git push --delete origin prod.${VERSION}-${BUILD}

build_ios_uat:
	@cd apps/customer_app && fvm flutter build ipa --flavor uat -t lib/main_uat.dart --release
build_android_uat:
	@cd apps/customer_app && fvm flutter build appbundle --flavor uat -t lib/main_uat.dart --release
build_web_uat:
	@cd apps/customer_app && fvm flutter build web -t lib/main_uat.dart --release

build_ios_prod:
	@cd apps/customer_app && fvm flutter build ipa --flavor prod -t lib/main_prod.dart --release
build_android_prod:
	@cd apps/customer_app && fvm flutter build appbundle --flavor prod -t lib/main_prod.dart --release
build_web_prod:
	@cd apps/customer_app && fvm flutter build web -t lib/main_prod.dart --release

build_ios_dev:
	@cd apps/customer_app && fvm flutter build ipa --flavor dev -t lib/main_dev.dart --release
build_android_dev:
	@cd apps/customer_app && fvm flutter build appbundle --flavor dev -t lib/main_dev.dart --release
build_web_dev:
	@cd apps/customer_app && fvm flutter build web -t lib/main_dev.dart --release
