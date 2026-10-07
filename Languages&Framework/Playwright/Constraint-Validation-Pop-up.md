# Constraint Validation Pop-up

```typescript
await page.selector().evaluate(
(node: HTMLInputElement) => node.validity.valid)
```

```typescript
await page.locator('input[type="email"]').evaluate(
 (node: HTMLInputElement) => node.validationMessage)
```

Ketika Anda menulis `node` di dalam kurung parameter `.evaluate(node => ... )`, Anda **justru sedang mendefinisikannya** saat itu juga.


