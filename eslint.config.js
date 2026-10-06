import tseslint from '@typescript-eslint/eslint-plugin'

export default [
  {
    files: ['fixture.js'],
    plugins: { ts: tseslint },
    rules: { 'ts/no-unused-vars': 'error' }
  }
]
