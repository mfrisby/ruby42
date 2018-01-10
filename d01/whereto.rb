#!/usr/bin/env ruby

def getstates()
    states = {
        "Oregon"     => "OR",
        "Alabama"    => "AL",
        "New Jersey" => "NJ",
        "Colorado"   => "CO"
    }
    return states
end

def getcapitals()
    cap = {
        "OR" => "Salem",
        "AL" => "Montgomery",
        "NJ" => "Trenton",
        "CO" => "Denver"
    }
    return cap
end

def find_state(a)
    caps = getcapitals
    states = getstates
    stateinvert = states.invert
    if (states.has_key?(a))
        b = states[a]
        if caps.has_key?(b)
            puts "#{caps[b]} is the capital of #{stateinvert[b]} (akr: #{states[a]})"
        end
    end
end

def find_cap(a)
    cap = getcapitals
    c = cap.invert
    states = getstates
    s = states.invert
    if (c.has_key?(a))
        b = c[a]
        if s.has_key?(b)
            puts "#{cap[b]} is the capital of #{s[b]} (akr: #{c[a]})"
        end
    end
end

def tri(a)
    if a.empty?
        return
    end
    c = getcapitals
    s = getstates
    if s.has_key?(a)
        find_state(a)
        return
    elsif c.has_value?(a)
        find_cap(a)
        return
    else
        puts "#{a} is neither a capital city nor a state"
    end
end

def start()
    if (ARGV.length != 1)
            return
    end
    av = ARGV[0]
    arr = av.split(",")
    arr.each {|x| if (x.empty?) ; return end}
    arr.each {|x| x.replace(x.delete(' '))}
    arr.each {|x| x.replace(x.capitalize)}
    arr.each {|x| tri(x)}
end

start