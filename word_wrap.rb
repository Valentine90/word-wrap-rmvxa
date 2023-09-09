#==============================================================================
# ** Word Wrap
#------------------------------------------------------------------------------
#  Este script lida com a quebra de texto.
#------------------------------------------------------------------------------
#  Copyright (c) 2020-2023 Valentine
#==============================================================================

class Window_Base < Window
  def draw_text_wrapped(x, y, width = 0, height = 0, str = '', align = 0)
    if x.is_a?(Integer)
      rect = Rect.new(x, y, width, height)
    else
      rect = x
      str = y
      align = width
    end
    if contents.text_size(str).width <= rect.width && !str.include?("\n")
      draw_text(rect, str, align)
      return
    end
    process_words(rect, str, align)
  end

  def process_words(rect, str, align)
    line = ''
    line_width = 0
    str.each_line(' ') do |word|
      word_width = contents.text_size(word).width
      if word.include?("\n")
        rect, line, line_width = skip_line(word, rect, align, line, line_width)
      elsif word_width > rect.width
        rect, line = character_wrap(word, rect, align, line)
      elsif line_width + word_width > rect.width
        draw_text(rect, line, align)
        rect.y += rect.height
        line = word
        line_width = word_width
      else
        line << word
        line_width += word_width
      end
    end
    draw_text(rect, line, align)
  end

  def skip_line(words, rect, align, line, line_width)
    words.each_line do |word|
      # Se a última palavra da matriz não está
      # acompanhada do comando de quebra de linha.
      unless word.end_with?("\n")
        line = word
        line_width = contents.text_size(word).width
        break
      end
      word = word.delete("\n")
      word_width = contents.text_size(word).width
      if line_width + word_width <= rect.width
        draw_text(rect, "#{line}#{word}", align)
      else
        draw_text(rect, line, align)
        rect.y += rect.height
        draw_text(rect, word, align)
      end
      line.clear
      line_width = 0
      rect.y += rect.height
    end
    [rect, line, line_width]
  end

  def character_wrap(word, rect, align, line)
    cs = ''
    cs_width = 0
    word.each_char do |c|
      c_width = contents.text_size(c).width
      if cs_width + c_width <= rect.width
        cs << c
        cs_width += c_width
        next
      end
      unless line.empty?
        draw_text(rect, line, align)
        rect.y += rect.height
      end
      draw_text(rect, cs, align)
      rect.y += rect.height
      cs = c
      cs_width = c_width
      line.clear
    end
    [rect, line << cs]
  end
end
