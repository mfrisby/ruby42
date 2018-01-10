#!/usr/bin/env ruby
def tri(lines)
    lines.each {|x| x.slice! ","}
    lines.map! {|x| x.to_i}
    puts lines.sort
end

def croissant()
    if File.file?("./numbers.txt") == false
        puts "No such file here."
        return
    end
    file = File.open("./numbers.txt", "r")
    tri(file.readlines)
    file.close
end
croissant