# Git flow

## Đặt tên branch

Tên branch phải theo format:

- `prefix/description`

### Prefix được phép

- `ref`
- `feat`
- `fix`
- `tdd`
- `hotfix`
- `chore`
- `testcase`

### Quy tắc cho phần description

- Chỉ cho phép ký tự: `a-zA-Z0-9._-`
- Độ dài tối thiểu: `10`

### Ví dụ

Hợp lệ:

- `feat/base_app_init`
- `fix/login_null_crash`
- `chore/update_dependencies`

Không hợp lệ:

- `feat/short`
- `feature/base_app` (prefix `feature` không được cho phép, hãy dùng `feat`)

## Commit message

Nên dùng prefix rõ ràng + mô tả ngắn gọn.

Format khuyến nghị:

- `<type>: <subject>`

Các type gợi ý:

- `feat`
- `fix`
- `chore`
- `refactor`
- `test`

Ví dụ:

- `feat: add base app skeleton`
- `fix: handle null token on login`
- `chore: update melos scripts`

## Đặt tag để CD (UAT/PROD)

Tag được dùng để trigger pipeline CI/CD deploy.

### Tag UAT

Format:

- `uat.<VERSION>-<BUILD>`

Tạo & push:

```bash
make run_uat_cd VERSION=1.2.3 BUILD=45
```

### Tag PROD

Format:

- `prod.<VERSION>-<BUILD>`

Tạo & push:

```bash
make run_prod_cd VERSION=1.2.3 BUILD=45
```

## Revert (xoá) tag

Dùng khi bạn đặt nhầm tag (sai version/build).

### Revert tag UAT

```bash
make revert_uat_tag VERSION=1.2.3 BUILD=45
```

### Revert tag PROD

```bash
make revert_prod_tag VERSION=1.2.3 BUILD=45
```

## Build artifacts

Tất cả lệnh build đều chạy cho app tại `apps/customer_app`.

### DEV

```bash
make build_android_dev
make build_ios_dev
make build_web_dev
```

### UAT

```bash
make build_android_uat
make build_ios_uat
make build_web_uat
```

### PROD

```bash
make build_android_prod
make build_ios_prod
make build_web_prod
```
