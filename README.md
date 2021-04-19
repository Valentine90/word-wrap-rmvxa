## About
![Rpg Maker VX ACE](https://img.shields.io/badge/RPG%20MAKER-VX%20ACE-red?style=for-the-badge&logo=appveyo)
![lANG](https://img.shields.io/badge/LANG-RUBY(%20RGSS%20)-red?style=for-the-badge&logo=appveyo)
<p>Line break for RPG Maker.</p>

## Examples
No line break command (\n):
```
str = 'Testing line breaks'
word_wrap(str, 100).each_with_index do |text, i|
  draw_text(0, 18 * i, contents_width, 18, text)
end
```
With line break command (\n):
```
str = "Testing\n line\n breaks"
word_wrap(str, 100).each_with_index do |text, i|
  draw_text(0, 18 * i, contents_width, 18, text)
end
```
