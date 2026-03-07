# Neovim Config Notes

- LSP 등록: `lua/lsp/servers/` (서버별 파일)
- 포매터 등록: `lua/plugins/formatting.lua` (`conform.nvim`)
- 자동완성 capability: `blink.cmp` (`require('blink.cmp').get_lsp_capabilities()`)

## LSP 추가 방법

1. LSP 서버 실행 파일을 시스템에 직접 설치합니다.
- 예: `rust-analyzer`, `basedpyright-langserver`, `ruff`, `typescript-language-server`, `svelteserver`, `yaml-language-server`, `taplo`

2. `lua/lsp/servers/`에 서버 파일을 추가하고, `lua/lsp/servers/init.lua`의 `server_modules`에 등록합니다.

예시 (`lua_ls`) 파일: `lua/lsp/servers/lua_ls.lua`

```lua
function M.setup(capabilities, utils)
  vim.lsp.config('lua_ls', utils.with_capabilities(capabilities, {
    root_dir = utils.root_from({ '.luarc.json', '.git' }),
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
      },
    },
  }))
  vim.lsp.enable('lua_ls')
end
```

3. 필요하면 각 서버 파일의 `utils.root_from({...})` 마커를 프로젝트에 맞게 조정합니다.

현재 기본 등록 서버:
- `rust_analyzer`
- `basedpyright`
- `ruff`
- `ts_ls`
- `svelte`
- `yamlls`
- `taplo`

## Formatter 추가 방법 (conform.nvim)

1. 포매터 CLI를 시스템에 직접 설치합니다.
- 예: `stylua`, `ruff`, `rustfmt`, `prettier`, `shfmt`

2. `lua/plugins/formatting.lua`의 `formatters_by_ft`에 filetype 매핑을 추가합니다.

예시:

```lua
formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'ruff_format' },
  rust = { 'rustfmt' },
  javascript = { 'prettier' },
  typescript = { 'prettier' },
  sh = { 'shfmt' },
}
```

3. 현재 포맷 동작
- 저장 시 자동 포맷: `format_on_save` 활성화
- 수동 포맷: `<leader>lf` (conform 우선, 없으면 LSP fallback)

## 확인 방법

- LSP attach 확인: `:LspInfo`
- formatter 상태 확인: `:ConformInfo`
- 바이너리 경로 확인: `:echo executable('rust-analyzer')` (1이면 OK)

## 문제 해결

- LSP가 안 붙으면:
  - 서버 바이너리 설치 여부 확인
  - `root_dir` 마커가 현재 프로젝트와 맞는지 확인
- 포맷이 안 되면:
  - formatter CLI 설치 여부 확인
  - filetype 이름과 `formatters_by_ft` 키가 일치하는지 확인
