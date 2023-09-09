## About
![Rpg Maker VX ACE](https://img.shields.io/badge/RPG%20MAKER-VX%20ACE-red?style=for-the-badge&logo=appveyo)
![lANG](https://img.shields.io/badge/LANG-RUBY%20(RGSS)-red?style=for-the-badge&logo=appveyo)

Complete word wrap for RPG Maker. Both lines with multiple words separated by spaces (eg: "text wrapping test") and lines with large text without spaces (eg: "aaaaaaaaaaaaaaaaaaaaaaaa") are broken. It is also possible to manually add a line break by entering the special character `\n`.

## Examples
No line break command:
```Ruby
text = 'Testing line breaks'
line_width = 100
draw_text_wrapped(0, 0, line_width, contents.font.size + 2, text)
```
With line break command (`\n`):
```Ruby
text = "Testing\n line\n breaks"
line_width = 100
draw_text_wrapped(0, 0, line_width, contents.font.size + 2, text)
```
