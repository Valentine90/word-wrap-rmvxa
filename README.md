## About
![Rpg Maker VX ACE](https://img.shields.io/badge/RPG%20MAKER-VX%20ACE-red?style=for-the-badge&logo=appveyo)
![lANG](https://img.shields.io/badge/LANG-RUBY(%20RGSS%20)-red?style=for-the-badge&logo=appveyo)
<p>Line break for RPG Maker.</p>

## Examples
No line break command (`\n`):
```Ruby
str = 'Testing line breaks'
line_width = 100
word_wrap(str, line_width).each_with_index do |text, i|
  draw_text(0, 18 * i, contents_width, 18, text)
end
```
With line break command (`\n`):
```Ruby
str = "Testing\n line\n breaks"
line_width = 100
word_wrap(str, line_width).each_with_index do |text, i|
  draw_text(0, 18 * i, contents_width, 18, text)
end
```
