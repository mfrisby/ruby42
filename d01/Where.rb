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
    msg = "Unknown state"
    c = getcapitals
    s = getstates
    if (s.has_key?(a))
        b = s[a]
        if c.has_key?(b)
            puts c[b]
        else
            puts msg
        end
    else
        puts msg
    end
end

start