# Name of Author: Jakub Kmetko
# Created at: 29.03.2015
#
# Description: Pridanie bodkociarky na koniec kazdeho riadku CSV datasetu (ak sa tam nenachadza)

class CheckSemicolon

  def remove_semicolon(path)
    lines = []

    File.open(path, 'r').each_line do |line|
      lines.push(line)
    end

    File.open(path, 'w+') do |f|
      lines.each do |line|
        lastChar = line[-1...line.length]
        lastChars = line[line.length-3]
        if(lastChars == ";")
          line = line[0...-3]
          line = line + "\n"
        elsif(lastChar == ";")
          line = line[0...-1]
          line = line + "\n"
        end
        f.write(line)
      end
    end
  end

  def add_semicolon(path)
    lines = []

    File.open(path, 'r').each_line do |line|
      lines.push(line)
    end

    File.open(path, 'w+') do |f|
      lines.each do |line|
        lastChars = line[-2...line.length]
        if(lastChars != ";\n")
          #line = line[0...-1]
          #line = line + ";\n"
          line.insert(-2, ";")
        end
        f.write(line)
      end
    end
  end

end