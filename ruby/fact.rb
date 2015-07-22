def fact(n)
    if n == 0
        1
    elsif n > 0
        n * fact(n-1)
    else
        print "Error!"
    end
end

print fact(ARGV[0].to_i), "\n"
