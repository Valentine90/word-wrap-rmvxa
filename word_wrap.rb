#==============================================================================
# ** Window_Base
#------------------------------------------------------------------------------
#  Esta é a superclasse de todas as janelas do jogo.
#------------------------------------------------------------------------------
#  Autor: Valentine
#==============================================================================

class Window_Base < Window

  def word_wrap(text, width = contents_width)
    # Corrige a compressão de texto do RGD
    width -= 20
    bitmap = contents || Bitmap.new(1, 1)
    return [text] if bitmap.text_size(text).width <= width
    lines = []
    line = ''
    line_size = 0
    text.each_line(' ') do |word|
      word_size = bitmap.text_size(word).width
      if word.include?("\n")
        line, lines, line_size = skip_line(word, width, bitmap, line, lines, line_size)
      elsif word_size > width
        line, lines = character_wrap(word, width, bitmap, line, lines)
      elsif line_size + word_size <= width
        line << word
        line_size += word_size
      else
        lines << line
        line = word
        line_size = word_size
      end
    end
    bitmap.dispose unless contents
    lines << line
  end
  
  def skip_line(words, width, bitmap, line, lines, line_size)
    words.each_line do |word|
      # Se a última palavra da matriz não está
      #acompanhada do comando de quebra de linha
      unless word.end_with?("\n")
        line = word
        line_size = bitmap.text_size(word).width
        break
      end
      word = word.delete("\n")
      word_size = bitmap.text_size(word).width
      if line_size + word_size <= width
        # Impede que as linhas sejam alteradas quando a
        #linha atual for apagada
        lines << line.clone + word
      else
        lines << line.clone << word
      end
      line.clear
      line_size = 0
    end
    return line, lines, line_size
  end
  
  def character_wrap(word, width, bitmap, line, lines)
    cs = ''
    cs_size = 0
    word.each_char do |c|
      c_size = bitmap.text_size(c).width
      if cs_size + c_size <= width
        cs << c
        cs_size += c_size
      else
        lines << line.clone unless line.empty?
        lines << cs
        cs = c
        cs_size = c_size
        line.clear
      end
    end
    return line << cs, lines
  end
  
 end
