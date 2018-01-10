#!/usr/bin/env ruby

def table_html(html, x, line, index)
    nl = ""
    cla = ""
    s = line.split("=")
    name = s[0]
    body = s[1].split(",")
    position = body[0].split(":")[1]
    if x == 0
        nl = "<tr>"
    end
    if position == "0"
        cla = "class=\"yellow\""
    elsif position == "1"
        cla = "class=\"orange\""
    elsif position == "17"
        cla = "class=\"blue\""
    elsif position == "16"
        cla = "class=\"pink\""
    else
        cla = "class=\"green\""
    end
    if position.to_i == x
        html.write("#{nl}<td #{cla}><h4>#{name}</h4><ul>")
        body.each{|o| html.write("<li>#{o}</li>")}
        html.write("</ul></td>")
        index = index + 1
    else
        html.write("<td></td>")
    end
    if x == 17
        nl = "</tr>"
    end
    return index
end

def get_style()
    msg = "<style>
        body {
            background-color: #74AFAD;
        }
        h1 {
            text-align: center;
        }
        h4 {
            text-align: left;
        }
        table{
            width: 100%; 
            overflow-x:auto;
            text-align: center;
        }
        td{
            border: solid;
            text-align: center;
        }
        .yellow {
            background-color: yellow;
        }
        .orange {
            background-color: orange;
        }
        .blue {
            background-color:  #1E90FF;
        }
        .pink {
            background-color: pink;
        }
        .green {
            background-color: green;
        }
    </style>"
end

def first_part_html(file, style)
    file.write("<!DOCTYPE html>
        <html>
        <head>
            <meta charset=\"UTF-8\">
            <title>Tableau periodique des elements</title>
            #{style}
        </head>
        <body>
        <h1>Tableau periodique des elements</h1>
        <table>")
end

def last_part_html(file)
    file.write("</table>   </body>
    </html>")
end

def start()
    if File.file?("periodic_table.html") == true
        File.delete("periodic_table.html")
    end
    html = File.new("periodic_table.html", "w")
    txt = File.open("periodic_table.txt", "r")

    first_part_html(html, get_style)

    lines = txt.readlines
    i = 0
    col = [1, 2, 3, 4, 5, 6, 7]
    arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
    col.each{|val|
        arr.each{|x| i = table_html(html, x, lines[i], i)}
    }
    
    last_part_html(html)
    html.close
    txt.close
end

start