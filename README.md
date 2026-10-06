# `no-unused-vars` false positive in `@typescript-eslint` 8.71.1

Suspected PR <https://github.com/typescript-eslint/typescript-eslint/pull/12892>

- released in `8.71.1`
- related issue report: <https://github.com/typescript-eslint/typescript-eslint/issues/12979>

## Reproducer

```bash
# Run with podman/docker:
podman build --tag tseslint-871-repro . && podman run --rm tseslint-871-repro
```

```bash
=== eslint with @typescript-eslint 8.71.1 (expect 1 error) ===
/app/fixture.js
  1:7  error  'x' is assigned a value but only used as a type  ts/no-unused-vars
exit: 1

=== eslint with @typescript-eslint 8.71.0 (expect clean) ===
exit: 0

BUG CONFIRMED: 8.71.1 false positive, 8.71.0 clean
```
