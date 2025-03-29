# VIM/Neovim

## Instalacja neovima
Instalacja z managera pakietów:
```bash
$ sudo apt install vim neovim
```

Otwieranie pliku:
```bash
$ vim <nazwa pliku>
$ nvim <nazwa pliku>
```
## Instalacja najnowszej wersji 

Aby zainstalować najnowszą wersje [neovima](
https://github.com/neovim/neovim/blob/master/BUILD.md) (ubuntu napewno nie ma najnowszej)
```bash
$ curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
$ sudo rm -rf /opt/nvim
$ sudo tar -C /opt -xzf nvim-linux64.tar.gz
# po wykonaniu trzeba dodać ściężkę do .bashrc:
$ export PATH="$PATH:/opt/nvim-linux64/bin"
```

## Tryby
1. Normal - tryb domyślny (ESC), używany do komend edytora (dd, x)
2. Insert - tryb wpisywania (i/a/o), służy do wpisywania tekstu jak w wkażdym innym edytorze tekstu
   *   i - tryb wpisywania przed kursorem
   *   a - tryb wpisywania po kursorze
   *   o - stworz nową linie i wlacz tryb wpisywania
3. Visual - tryb zaznaczania obszarów tekstu: 2 główne sposoby zaznaczania 
4. Visual linewise - zaznaczanie w linii (V)
5. Visual blockwise - zaznaczanie w bloku/prostokącie (ctrl + V)
6. Command-Line - tryb wpisywania komend/poleceń (:)

!!! vimtutor !!!

## Podstawowe czynności w VIMe
1. `u` - undo 
2. `CTRL + R` - redo 
3. `:w` - zapisz
4. `:q` - wyjdź
5. `:wq/:x` - zapisz i wyjdź
6. `!` - powoduje wymuszenie (:q! - wyjdź bez zapisywania)
7. `:edit <nazwa pliku>` - edytuj wskazany plik w nowym bufferze (będą otwarte 2 pliki)

## Nawigacja w Vimie
1. `h j k l` - left down up right
2. `gg` - przejdź do pierwszej linii
3. `G` - przejdź do ostatniej linii
4. `:<liczba>` - przejdź do wskazanej linii
5. `$` - przejdź do końca linii
6. `0` - przejdź do początku linii
7. `b` - przejdź do poprzedniego słowa
8. `w` - przejdź do kolejnego słowa

## Edytowanie tekstu w trybie Normal
1. `x` - wytnij znak pod kursorem (przechodzi do schowka)
2. `dw/db` - usun kolejne/poprzednie słowo 
3. `dd` - usun całą linię	
4. `yy` - skopiuj całą linię
5. `>>` - tab w lewo
6. `<<` - tab w prawo

## Proces kopiowania/wycinania
1. zaznacz fragment pliku używająć trybu Visual (V/Ctrl + V)
2. aby skopiować zaznaczony fragment naciśnij y, aby wyciąć naciśnij x
3. aby wkleić tekst, wyjdź z trybu Visual (ESC), następnie aby:
wkleić po kursorze, nacisnij p, 
wkleić przed kursorem, naciśnij P (shift + P),

## Wyszukiwanie tekstu
1. `/<szukana fraza>` (przeszukuje w przód) `?<szukana fraza>` (przeszukuje w tył) 
2. aby znaleźć kolejne wystąpienie, nacisnij n
3. aby znaleźć poprzednie wystąpienie, nacisnij N (shift + n)

bonus: można najechać na słowo, 
naciśnięcie */# spowoduje automatyczne znalezienie kolejnego wystąpienia w przód/tył
bonus: :set ignorecase spowoduje ignorowanie dużych liter

## Wyszukaj i zamień 
już nie tak prosto, trzeba przerobić regex: 
`:[range]s/{pattern}/{string}/[flags] [count]`

vim przeszukuje wszystkie linie z `[range]` (range: 0,20 przeszuka tylko linie od 0 do 20, 
`.,$` spowoduje przeszukanie od obecnej linii do końca, `.,+4` spowoduje zmianę w kolejnych liniach, 
`%` spowoduje zmianę w całym bufferze)
w poszukiwaniu wzorca `{pattern}` i zmieni go na `{string}`

`[flags]` odpowiada a flagi, przykładowo flaga g spowoduje zmianę wszystkich słów w linii
flaga c powoduje wymaganie potwierdzenia zmiany 

## Buffer:
1. `buffer` - plik otwarty do edycji, VIM przechowuje je w pamięci, kiedy otwieramy nowe. 
2. `:e <nazwa pliku>` - tworzy nowy buffer i ustawia go jako aktywny
3. `:badd <nazwa pliku>` - tworzy nowy buffer, ale tworzy go w tle
4. `:bdelete <nazwa pliku>/:bd <nazwa pliku>` - usuń buffer
5. `:buffer <nazwa pliku>/ :b <nazwa pliku>` - zmienia aktywny buffer 
5. `:bnext/:bn` - przełącz na kolejny buffer (do przodu)
6. `:bprevious/:bp` - przełącz na kolejny buffer (do tyłu)
7. `:bfirst/:bf` - skocz do pierwszego buffera
8. `:blast/:bl` - skocz do ostatniego buffera
9. `:split <nazwa pliku>/:sp <nazwa pliku>` - dzieli ekran horyzontalnie, otwierając plik w nowym bufferze
10 `:vsplit <nazwa pliku>/:vs <nazwa pliku>` - dzieli ekran wertykalnie, otwierając plik w nowym bufferze
10. `:ls/:files/:buffers` - sprawdź otwarte pliki (buffery)

flagi bufferów: 
1. `%` - buffer otwarty
2. `a` - buffer aktywny
3. `#` - buffer ostatnio edytowany

## Konfiguracja 
plik konfiguracyjny: `~/.config/nvim/init.lua`, jeżeli nie ma, należy utworzyć

Manager Pluginów: [Lazy](https://github.com/folke/lazy.nvim)

Drzewko projektu:
[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
```
:NvimTreeOpen
:NvimTreeClose
```
Keystrokes: https://neovim.io/doc/user/map.html

Wyszukiawanie w projekcie:
[telescope](https://github.com/nvim-telescope/telescope.nvim)
```
:Telescope
:Telescope find_files
:Telescope buffers
:Telescope live_grep
```

Kolory:
1. [neovim-colorscheme](https://github.com/topics/neovim-colorscheme)
2. [tokyonight](https://github.com/folke/tokyonight.nvim)

Struktura pluginow: .config/nvim/lua/plugins

Lazy automatycznie ładuje pliki .lua z folderu plugins
require("lazy").setup("plugins")

Language Server Provider:
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
```
:LspInfo
```

Instalator LSP: [mason](https://github.com/williamboman/mason.nvim)
```
:Mason 
```

Linki:
1. https://www.lunarvim.org/
2. https://nvchad.com/
3. http://www.lazyvim.org/
4. https://github.com/rockerBOO/awesome-neovim
