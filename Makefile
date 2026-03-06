# ──────────────────────────────────────────────────────────────────
# Makefile — bike_tracker
#
# Flavors:
#   dev  → main_dev.dart   | Android: "dev"  | iOS: dev
#   uat  → main_uat.dart   | Android: "uat"  | iOS: uat
#   prod → main_prod.dart  | Android: "prd"  | iOS: prod
#
# ⚠️  Android gradle dùng tên flavor "prd", không phải "prod".
#     Makefile dùng "--flavor prd" cho Android prod build.
#     Tag vẫn dùng prefix "prod." theo convention GIT_FLOW.md.
# ──────────────────────────────────────────────────────────────────

# ── Setup ──────────────────────────────────────────────────────────

flutter_install:
	@fvm use 3.35.7
	@fvm flutter clean
	@fvm flutter pub get

clean_ios:
	@cd ios && rm -rf Pods && rm -f Podfile.lock \
		&& fvm flutter pub get \
		&& fvm flutter precache --ios \
		&& pod install && cd ..

# ── Static Analysis ────────────────────────────────────────────────

run_analyze:
	@fvm dart pub global activate melos >/dev/null 2>&1 || true
	@melos exec --fail-fast -- fvm flutter analyze --fatal-infos --fatal-warnings

# ── CD Tags  ───────────────────────────────────────────────────────
# Tạo và push tag để trigger GitLab CD pipeline.
# Ví dụ:
#   make tag_uat  VERSION=1.2.3 BUILD=45  → tag: uat.1.2.3-45
#   make tag_prod VERSION=1.2.3 BUILD=45  → tag: prod.1.2.3-45

tag_dev:
	@git tag -a dev.${VERSION}-${BUILD} -m "dev ${VERSION}(${BUILD})" \
		&& git push origin dev.${VERSION}-${BUILD}

tag_uat:
	@git tag -a uat.${VERSION}-${BUILD} -m "uat ${VERSION}(${BUILD})" \
		&& git push origin uat.${VERSION}-${BUILD}

tag_prod:
	@git tag -a prod.${VERSION}-${BUILD} -m "prod ${VERSION}(${BUILD})" \
		&& git push origin prod.${VERSION}-${BUILD}

# Alias cũ (giữ tương thích ngược)
run_uat_cd:  tag_uat
run_prod_cd: tag_prod

# ── Revert Tags ────────────────────────────────────────────────────
# Xoá tag local + remote nếu tạo nhầm.
# Ví dụ: make revert_tag_uat VERSION=1.2.3 BUILD=45

revert_tag_dev:
	@git tag -d dev.${VERSION}-${BUILD} \
		&& git push --delete origin dev.${VERSION}-${BUILD}

revert_tag_uat:
	@git tag -d uat.${VERSION}-${BUILD} \
		&& git push --delete origin uat.${VERSION}-${BUILD}

revert_tag_prod:
	@git tag -d prod.${VERSION}-${BUILD} \
		&& git push --delete origin prod.${VERSION}-${BUILD}

# Alias cũ (giữ tương thích ngược)
revert_uat_tag:  revert_tag_uat
revert_prod_tag: revert_tag_prod

# ── Build iOS ──────────────────────────────────────────────────────

build_ios_dev:
	@cd apps/customer_app && fvm flutter build ipa \
		--flavor dev -t lib/main_dev.dart --release

build_ios_uat:
	@cd apps/customer_app && fvm flutter build ipa \
		--flavor uat -t lib/main_uat.dart --release

build_ios_prod:
	@cd apps/customer_app && fvm flutter build ipa \
		--flavor prod -t lib/main_prod.dart --release

# ── Build Android ──────────────────────────────────────────────────
# ⚠️  Android flavor "prod" được định nghĩa là "prd" trong build.gradle.kts.

build_android_dev:
	@cd apps/customer_app && fvm flutter build appbundle \
		--flavor dev -t lib/main_dev.dart --release

build_android_uat:
	@cd apps/customer_app && fvm flutter build appbundle \
		--flavor uat -t lib/main_uat.dart --release

build_android_prod:
	@cd apps/customer_app && fvm flutter build appbundle \
		--flavor prd -t lib/main_prod.dart --release

# ── Build Web ──────────────────────────────────────────────────────

build_web_dev:
	@cd apps/customer_app && fvm flutter build web \
		-t lib/main_dev.dart --release

build_web_uat:
	@cd apps/customer_app && fvm flutter build web \
		-t lib/main_uat.dart --release

build_web_prod:
	@cd apps/customer_app && fvm flutter build web \
		-t lib/main_prod.dart --release

# ── Fastlane shortcuts ─────────────────────────────────────────────

fastlane_analyze:
	@bundle exec fastlane ci_analyze

fastlane_uat VERSION ?= 1.0.0 BUILD ?= 1:
	@bundle exec fastlane cd_uat version:${VERSION} build_number:${BUILD}

fastlane_prod VERSION ?= 1.0.0 BUILD ?= 1:
	@bundle exec fastlane cd_prod version:${VERSION} build_number:${BUILD}
