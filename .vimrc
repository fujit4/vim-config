" ========================================
" Basic
" ========================================

let mapleader = " "      " Leaderキーをスペースにする

set nocompatible         " Vi互換モードを無効化してVimの機能を使う
set number               " 行番号を表示する

" ========================================
" Encoding
" ========================================

set encoding=utf-8       " Vim内部の文字コードをUTF-8にする
set fileencoding=utf-8   " ファイル保存時の文字コードをUTF-8にする
set fileencodings=utf-8,sjis,euc-jp  " 読み込み時に試す文字コード
set fileformats=unix,dos " LFとCRLFの改行形式に対応する
set nobomb               " UTF-8 BOMを付けずに保存する

" ========================================
" Indentation
" ========================================

set tabstop=4            " タブ文字を画面上で4桁幅にする
set shiftwidth=4         " 自動インデントやシフトの幅を4桁にする

" ========================================
" Display
" ========================================

set wrap                 " 長い行を画面内で折り返す
set linebreak            " 単語の途中で折り返さない

" ========================================
" Cursor
" ========================================

" Normal: block
" Insert: vertical bar
let &t_EI = "\e[2 q"     " 通常モードではカーソルをブロック表示
let &t_SI = "\e[6 q"     " 挿入モードではカーソルを縦棒表示

" ========================================
" IME Control (mintty only)
" ========================================

if exists('$TERM_PROGRAM') && $TERM_PROGRAM ==# 'mintty'

    " Insertモード終了時にIMEをOFFにする
    let &t_EI .= "\e[<0t"

endif

" ========================================
" Navigation
" ========================================

set whichwrap=b,s,<,>,[,] " 行頭・行末で左右移動を折り返す
set notimeout             " マッピングの入力待ち時間を無効化する

" J and gJ
nnoremap J gJ             " Jで改行を挿入せず行を連結する
nnoremap gJ J             " gJで空白を調整して行を連結する

" ========================================
" Character width
" ========================================

" 指定した記号を全角幅（2桁）として扱う
" ========================================
" Character width
" ========================================

if exists('*setcellwidths')
    let s:cellwidths = []

    call add(s:cellwidths, [0x00B0, 0x00B1, 2]) " ° ±
    call add(s:cellwidths, [0x00D7, 0x00D7, 2]) " ×
    call add(s:cellwidths, [0x00F7, 0x00F7, 2]) " ÷
    call add(s:cellwidths, [0x03C0, 0x03C0, 2]) " π
    call add(s:cellwidths, [0x203B, 0x203B, 2]) " ※
    call add(s:cellwidths, [0x203C, 0x203C, 2]) " ‼
    call add(s:cellwidths, [0x2049, 0x2049, 2]) " ⁉
    call add(s:cellwidths, [0x2103, 0x2103, 2]) " ℃
    call add(s:cellwidths, [0x212B, 0x212B, 2]) " Å
    call add(s:cellwidths, [0x2190, 0x21FF, 2]) " 矢印
    call add(s:cellwidths, [0x2202, 0x2202, 2]) " ∂
    call add(s:cellwidths, [0x2205, 0x2208, 2]) " ∅～∈
    call add(s:cellwidths, [0x220B, 0x220B, 2]) " ∋
    call add(s:cellwidths, [0x220F, 0x2213, 2]) " ∏～∓
    call add(s:cellwidths, [0x221A, 0x221A, 2]) " √
    call add(s:cellwidths, [0x221E, 0x221E, 2]) " ∞
    call add(s:cellwidths, [0x2220, 0x2220, 2]) " ∠
    call add(s:cellwidths, [0x2225, 0x2225, 2]) " ∥
    call add(s:cellwidths, [0x2227, 0x222A, 2]) " ∧～∪
    call add(s:cellwidths, [0x222B, 0x222B, 2]) " ∫
    call add(s:cellwidths, [0x222E, 0x222E, 2]) " ∮
    call add(s:cellwidths, [0x2234, 0x2235, 2]) " ∴ ∵
    call add(s:cellwidths, [0x2248, 0x2248, 2]) " ≈
    call add(s:cellwidths, [0x2252, 0x2252, 2]) " ≒
    call add(s:cellwidths, [0x2260, 0x2267, 2]) " ≠～≧
    call add(s:cellwidths, [0x2282, 0x2287, 2]) " ⊂～⊇
    call add(s:cellwidths, [0x2460, 0x2473, 2]) " ①～⑳
    call add(s:cellwidths, [0x2474, 0x249B, 2]) " ⑴～⒛
    call add(s:cellwidths, [0x24EA, 0x24EA, 2]) " ⓪
    call add(s:cellwidths, [0x25A0, 0x25CF, 2]) " 図形・丸記号
    call add(s:cellwidths, [0x2605, 0x2606, 2]) " ★ ☆
    call add(s:cellwidths, [0x3251, 0x325F, 2]) " ㉑～㉟
    call add(s:cellwidths, [0x32B1, 0x32BF, 2]) " ㊱～㊿

    call setcellwidths(s:cellwidths)
endif


" ========================================
" Save
" ========================================

nnoremap <silent> <C-s> :write<CR>       " Ctrl+Sで保存する
inoremap <silent> <C-s> <C-o>:write<CR>  " 挿入モードでもCtrl+Sで保存する

" ========================================
" Bell
" ========================================

set noerrorbells         " エラー時のビープ音を無効化する
set novisualbell         " エラー時の画面フラッシュを無効化する
set t_vb=                " 端末のビジュアルベルを無効化する

" ========================================
" Security / Privacy
" ========================================

set nomodeline           " ファイル内に記述されたVim設定を読み込まない
set noexrc               " カレントディレクトリの設定ファイルを読み込まない

set viminfo=             " 履歴やレジスタなどを終了後に保存しない
set noundofile           " 永続的なUndo履歴を保存しない
set noswapfile           " 未保存の編集内容を一時ファイルに保存しない

" ========================================
" Clipboard
" ========================================

inoremap <C-v> <C-r>+
cnoremap <C-v> <C-r>+
vnoremap <C-c> "+y
