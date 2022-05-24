function pisum()
    sum = 0.0
    for j = 1:500
        sum = 0.0
        for k = 1:10000
            sum += 1.0/(k*k)
        end
    end
    sum
end

function pisumi()
    sum = 0
    for j = 1:500
        sum = 0.0
        for k = 1:10000
            sum += 1.0/(k*k)
        end
    end
    sum
end

function pisum1()
    sum = 0.0
    for j = 1:500
        sum = 0.0
        for k = 1:10000
            sum += 1.0/(k*id1(k))
        end
    end
    sum
end

function pisum2()
    sum = 0.0
    for j = 1:500
        sum = 0.0
        for k = 1:10000
            sum += 1.0/(k*id2(k))
        end
    end
    sum
end

function pisum3()
    sum = 0.0
    for j = 1:500
        sum = 0.0
        for k = 1:10000
            sum += 1.0/(k*id3(k))
        end
    end
    sum
end

function pisum12()
    sum = 0.0
    for j = 1:500
        sum = 0.0
        for k = 1:10000
            sum += id2(1.0/(k*id2(k)))
        end
    end
    sum
end

id1(x) = x

id2(x) = (rand() == 4.2) ? "x" : x

id3(x) = (rand() == 4.2) ? x : x
