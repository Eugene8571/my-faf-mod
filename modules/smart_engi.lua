

local function move_random(waypoint)
    local selection = GetSelectedUnits()
    local unit = selection[1]

    if not unit then return print('-') end

    local avgPoint = {0,0}
    avgPoint[1] = avgPoint[1] + unit:GetPosition()[1]
    avgPoint[2] = avgPoint[2] + unit:GetPosition()[3]
    


    local target_position = waypoint
    if not target_position then target_position = unit:GetPosition() end
    local r = math.random( 0, 360 )
    target_position[1] = target_position[1] + 10*math.sin(r)
    target_position[3] = target_position[3] + 10*math.cos(r)

    avgPoint[1] = target_position[1] - avgPoint[1]
    avgPoint[2] = target_position[3] - avgPoint[2]
    local rotation = math.atan(avgPoint[1]/avgPoint[2])
    rotation = rotation * 180 / math.pi
    if avgPoint[2] < 0 then
        rotation = rotation + 180
    end

    local cb = {Func="AttackMove", 
                Args={
                    Target=target_position, 
                    Rotation = rotation, 
                    Clear=false}}

    SimCallback(cb, true)
    local commandQueue = unit:GetCommandQueue()
    print(table.getn(commandQueue))
    return target_position
end


function smart_engi()
    local waypoint
    for i=1,2 do
        waypoint = move_random(waypoint)
    end
end

