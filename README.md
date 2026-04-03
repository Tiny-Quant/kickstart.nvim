# Core Functionality

- [x] Tab complete. 

- [x] Easy motions. 

- [x] File explorer. 

Quarto

- [x] Autocomplete @ from bib. 
- [x] Autocomplete @ from crossref. 
- [] Autocomplete yaml.
- [x] Snippets

- [] R
    - [x] LSP
    - [x] Send to radian
    - [x] Plot server

- [] Python
    - [x] LSP
    - [x] Send to ipython

- [] Latex 
    - [x] LSP
    - [x] preview
    - Notes:
        - Always write math between $$ ... $$ or $ ... $ (for inline). This ensure syntax highlighting, autocomplete, and preview.  
        - Including {#eq-?} after the second $$ makes the equation numbered. 
        - Use $$ \begin{align} ... \end{align} $$ if you want each line numbered. 

- [] Zotero
    - [] insert cite

# Debugging 

- Start by running `:checkhealth`. 

- Check nvim and plugin versions. 

# Reference

## Vim / Neovim modeline options reference

Modeline syntax:

```
vim: option=value option=value
vi: option=value
ex: option=value
```

Modelines can appear in the first or last lines of a file and set editor options when the file is opened.

Example:

```
-- vim: ts=2 sts=2 sw=2 et
```

---

### Indentation / tabs

| option | name | meaning |
|--------|---------|----------|
| ts=2 | tabstop | number of spaces a tab counts for |
| sw=2 | shiftwidth | indent size for >> << == |
| sts=2 | softtabstop | spaces inserted when pressing Tab |
| et | expandtab | use spaces instead of tabs |
| noet | noexpandtab | use real tabs |

Example:

```
vim: ts=4 sw=4 sts=4 et
```

---

### Filetype / syntax

| option | meaning |
|---------|---------|
| ft=lua | set filetype |
| ft=python | set filetype |
| syntax=lua | set syntax |
| syntax=sh | set syntax |

Example:

```
vim: ft=lua
```

---

### Text formatting

| option | meaning |
|--------|----------|
| tw=80 | wrap at column |
| wrap | enable wrap |
| nowrap | disable wrap |

Example:

```
vim: tw=80
```

---

### Folding

| option | meaning |
|--------|----------|
| foldmethod=indent | indent folding |
| foldmethod=expr | expr folding |
| foldmethod=syntax | syntax folding |
| foldmethod=manual | manual folding |
| foldlevel=99 | open folds |

Example:

```
vim: foldmethod=indent
```

---

### Search / case

| option | meaning |
|--------|----------|
| ic | ignorecase |
| noic | case sensitive |
| scs | smartcase |
| hlsearch | highlight search |
| nohlsearch | disable highlight |

Example:

```
vim: ic scs
```

---

### Spell check

| option | meaning |
|--------|----------|
| spell | enable spell |
| nospell | disable |

Example:

```
vim: spell
```

---

### Line numbers

| option | meaning |
|--------|----------|
| number | show line numbers |
| nonumber | hide |
| relativenumber | relative |
| norelativenumber | disable |

Example:

```
vim: number
```

---

### Display

| option | meaning |
|--------|----------|
| cursorline | highlight line |
| nocursorline | disable |
| list | show whitespace |
| nolist | hide whitespace |

Example:

```
vim: list
```

---

### Security note

Modelines are restricted to safe options.

See:

```
:help modeline
:help modeline-security
```

---

### Common kickstart modeline

```
-- vim: ts=2 sts=2 sw=2 et
```

Meaning:

- tabstop = 2
- shiftwidth = 2
- softtabstop = 2
- expandtab = true
