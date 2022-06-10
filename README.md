## About
![Rpg Maker VX ACE](https://img.shields.io/badge/RPG%20MAKER-VX%20ACE-red?style=for-the-badge&logo=appveyo)
![lANG](https://img.shields.io/badge/LANG-RUBY%20(RGSS)-red?style=for-the-badge&logo=appveyo)

Complete line break for RPG Maker. Both lines with multiple words separated by spaces (eg: "text wrapping test") and lines with large text without spaces (eg: "aaaaaaaaaaaaaaaaaaaaaaaa") are broken. You can also manually add a line break by inserting the special character `\n`.

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
