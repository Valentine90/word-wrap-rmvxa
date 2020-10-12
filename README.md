## Sobre
![Rpg Maker VX ACE](https://img.shields.io/badge/RPG%20MAKER-VX%20ACE-red?style=for-the-badge&logo=appveyo)
![lANG](https://img.shields.io/badge/LANG-RUBY(%20RGSS%20)-red?style=for-the-badge&logo=appveyo)
<p>Quebra de linha para RPG Maker.</p>

## Exemplos:
Sem comando de quebra de linha (\n):
```
str = 'Testando quebra de linha'
word_wrap(str, 100).each_with_index do |text, i|
  draw_text(0, 18 * i, contents_width, 18, text)
end
```
Com comando de quebra de linha (\n):
```
str = "Testando\n quebra de\n linha"
word_wrap(str, 100).each_with_index do |text, i|
  draw_text(0, 18 * i, contents_width, 18, text)
end
```
