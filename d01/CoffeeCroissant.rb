#!/usr/bin/env ruby

def getdata()
    data = [
        ['Frank', 33],
        ['Stacy', 15],
        ['Juan', 24],
        ['Dom', 32],
        ['Steve', 24],
        ['Jill' , 24]
    ]
    return data
end

def start()
    data = getdata()
    data = data.sort_by { |name, age| [age, name] }
    data.each{|x| puts x[0]}
end

start