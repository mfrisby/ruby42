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

def start()
    if (ARGV.length != 1)
            return
    end
    a = ARGV[0]
    msg = "Unknown capital city"
    c = getcapitals
    c = c.invert
    s = getstates
    s = s.invert
    if (c.has_key?(a))
        b = c[a]
        if s.has_key?(b)
            puts s[b]
        else
            puts msg
        end
    else
        puts msg
    end
end

start