function table_to_string(tbl)
    if type(tbl) == "string" then return "'"..tbl.."'" end
        local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..tostring(v).."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

function move_to_point(point_A, point_B)
    if not point_B then return end
    local selection = GetSelectedUnits()
    local unit = selection[1]
    if not unit then return print('-') end
    local unit_position = unit:GetPosition()
    if not point_A then point_A = unit_position end

    local avgPoint = {0,0}
    avgPoint[1] = avgPoint[1] + point_A[1]
    avgPoint[2] = avgPoint[2] + point_A[3]
    


    local target_position = point_B
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
    return target_position    
end

function to_mass_deposits(waypoint)
    local selection = GetSelectedUnits()
    local unit = selection[1]

    if not unit then return print('-') end

    local unit_position = unit:GetPosition()

    local commandQueue = unit:GetCommandQueue()
    local n = table.getn(commandQueue)
    if not waypoint then waypoint = unit_position end



    local X = commandQueue[n].position[1] or unit:GetPosition()[1] --
    local Z = commandQueue[n].position[3] or unit:GetPosition()[3] --
    local Radius = 40
    local Type = 1

    local mass_deposits = GetDepositsAroundPoint(X, Z, Radius, Type)
    -- print(mass_deposits[1])
    local i = 1
    for j=1,table.getn(mass_deposits) do
        if mass_deposits[i].Dist > mass_deposits[j].Dist then 
            i = j
        end
    end

    local point_A
    if waypoint then point_A = waypoint else point_A = unit_position end
    local Y = point_A[2]
    local point_B = {mass_deposits[i].X2-0.5,Y,mass_deposits[i].Z2-0.5}
    print(point_B[1], point_B[3])
    move_to_point(point_A, point_B)
    LOG(table_to_string(unit:GetCommandQueue()))
    return point_B
end


local function attack_move_random(waypoint)
    local selection = GetSelectedUnits()
    local unit = selection[1]

    if not unit then return print('-') end

    local avgPoint = {0,0}
    avgPoint[1] = avgPoint[1] + unit:GetPosition()[1]
    avgPoint[2] = avgPoint[2] + unit:GetPosition()[3]
    


    local target_position = waypoint or unit:GetPosition()
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

    -- OnControlGroupApply(selection)
    return target_position
end

BMex = import("/mods/my-faf-mod/modules/build_mex.lua")
-- reclaim_grid = import("/mods/my-faf-mod/modules/reclaim_grid.lua")
-- Reclaimables = import('/lua/sim/Unit.lua').Unit.Reclaimables
-- Reclaimables = import('/lua/SimUtils.lua').Reclaimables

-- ToReclaimables = import('/lua/ui/game/reclaim.lua').ToReclaimables
ToReclaimables = import('/mods/my-faf-mod/modules/reclaim_grid.lua').ToReclaimables
function testMove()
    local waypoint
    -- for i=1,5 do
    --     waypoint = attack_move_random(waypoint)
    -- end
    -- waypoint = to_mass_deposits(waypoint)
    -- BMex.build_mex()
    waypoint = attack_move_random(waypoint)
    -- point_B = waypoint
    -- point_B[1] = waypoint[1] + 10
    -- waypoint = move_to_point(waypoint, point_B)
    local r = ToReclaimables(waypoint)
    print('qwe', r.mass)
    waypoint = move_to_point(waypoint, r.position)
end









function build_mex()
    local units = EntityCategoryFilterDown(categories.ENGINEER, GetSelectedUnits())
    if not units[1] then return end
    -- local mex = GetEntityById(data.target)
    local mex = 'uab1103'
    if not mex or not EntityCategoryContains(categories.MASSEXTRACTION * categories.STRUCTURE, mex) then return end

    -- if mex:GetCurrentLayer() == 'Seabed' then return end
    local X = units[1]:GetPosition()[1]
    local Z = units[1]:GetPosition()[3]

    local Radius = 50
    local Type = 1
    local mass_deposits = GetDepositsAroundPoint(X, Z, Radius, Type)
    local i = 1
    for j=1,table.getn(mass_deposits) do
        if mass_deposits[i].Dist > mass_deposits[j].Dist then 
            i = j
        end
    end
    -- local Y = 
    -- local pos = {mass_deposits[i].X2-0.5,0,mass_deposits[i].Z2-0.5}
    local pos = {110.5,25.46484375,33.5}
    local msid = mex
    local builder = units[1]

    -- for _, unit in units do
    --     msid = mex -- t1 mex
    --     if unit:CanBuild(msid) then
    --         break
    --     end
    -- end
    

    if not builder then return end
    local unit = builder
    -- LOG(table_to_string(unit:GetCommandQueue()))

    -- local locations = {
    --     up = Vector(pos.x, pos.y, pos.z - 2),
    --     down = Vector(pos.x, pos.y, pos.z + 2),
    --     left = Vector(pos.x - 2, pos.y, pos.z),
    --     right = Vector(pos.x + 2, pos.y, pos.z),
    -- }
    local Position = pos
    local Blueprint = 'ueb1103'

    local command = {
        ["Clear"]=true,
        ["CommandType"]="Guard",
        ["Target"]={
            ["Type"]="Position",
            ["Position"]={"110.5","25.46484375","33.5"}
        },
        ["Blueprint"]="ueb1103"
    }


    command.Units = units

    local location = pos

    item = {

    }
    
    IssueBuildMobile({builder}, location, msid, {})


    -- import('/lua/ui/game/commandmode.lua').StartCommandMode("build", {name = item.id})


    -- -- OnCommandIssued(command)




    -- AddCommandFeedbackBlip({
    --     Position = Position,
    --     BlueprintID = Blueprint,
    --     TextureName = '/meshes/game/flag02d_albedo.dds',
    --     ShaderName = 'CommandFeedback',
    --     UniformScale = 1,
    -- }, 0.7)
    -- import('/lua/ui/game/commandmode.lua').StartCommandMode('order', { name = 'RULEUCC_Repair' }, true )

    -- import('/lua/spreadattack.lua').MakeShadowCopyOrders(command)
    -- import('/lua/ui/game/commandmode.lua').OnCommandIssued(command)
    -- IssueGuard(units, builder)
    print('build_mex() end')
end





