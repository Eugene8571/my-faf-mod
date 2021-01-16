

function smart_engi()
    local unit = GetIdleEngineers()[1]
    local avgPoint = {0,0}
    avgPoint[1] = avgPoint[1] + unit:GetPosition()[1]
    avgPoint[2] = avgPoint[2] + unit:GetPosition()[3]
   
    local target_position = unit:GetPosition()
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

    local tblUnits = {unit}
    local position = target_position
    -- IssueAggressiveMove(tblUnits, position)
    SimCallback(cb, true)
    print( '...' )
end
