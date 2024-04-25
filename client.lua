local semaphore = 0

CreateThread(function()
    local raceTestFunction = function(i)
        CreateThread(function()
            while true do
                Wait(5000)
                semaphore = semaphore + 1
                if semaphore == 1 then
                    Wait(math.random(500, 2000))
                    print('Thread Done', i)
                    semaphore = 0
                end
            end
        end)
    end

    for i = 1, 100000 do
        raceTestFunction(i)
    end
end)
