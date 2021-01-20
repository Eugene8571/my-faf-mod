function UpdatePrioState()
    local units = currentSelection
end

--[[

GetCommandQueue
local idleEngineers = GetIdleEngineers()



--------------------------------------
-- Returns list of deposits
-- Type: 0 - All, 1 - Mass, 2 - Energy
-- Result: {{X1,X2,Z1,Z2,Type,Dist},...}
function GetDepositsAroundPoint(X, Z, Radius, Type)
end

--- Return the reclamable things inside the given rectangle.
-- That includes props, units, wreckages.
-- @param rectangle Map area created by function Rect(x0, z0, x1, z1).
function GetReclaimablesInRect(rectangle)
end

--- Return a table with units inside the given rectangle.
-- @param rectangle Map area created by function Rect(x0, z0, x1, z1).
function GetUnitsInRect(rectangle)
end

--  table GetValidAttackingUnits() - return a table of the currently selected units
function GetValidAttackingUnits()
end


--- Filter a list of units to only those found in the category.
-- @param category Unit category.
-- @tblUnits Table containing units, same as group of units.
-- @return Filtered list of units.
function EntityCategoryFilterDown(category, tblUnits)
end
table.getn(EntityCategoryFilterDown(categories.ENGINEER - categories.POD, units))


--- Orders a group of engineers to build a unit at target position.
-- Example: IssueBuildMobile({builder}, Vector(pos.x, pos.y, pos.z-2), msid, {}).
-- @param tblUnits Table containing engineers.
-- @param position Table with position {x, y, z}.
-- @param blueprintID ID of the unit to build, example: 'ueb0103'.
-- @param table (Two element table - TODO: find out what it is) or empty table.
-- @return Returns the issued command.
function IssueBuildMobile(tblUnits, position, blueprintID, table)
end


['move'] = {action = 'StartCommandMode order RULEUCC_Move'}

--- Returns elevation at given position.
-- Ignores water surface.
-- @param x Position on x axis.
-- @param z Position on x axis.
function GetTerrainHeight(x, z)
end



\schook\lua\ui\game\selection.lua


local hidden_select = false
function IsHidden()
    return hidden_select == true
end

function Hidden(callback)
    local CM = import('/lua/ui/game/commandmode.lua')
    local current_command = CM.GetCommandMode()
    local old_selection = GetSelectedUnits() or {}

    hidden_select = true
    callback()
    SelectUnits(old_selection)
    CM.StartCommandMode(current_command[1], current_command[2])
    hidden_select = false
end



--- Orders the builder to build a unit.
-- @param builder Unit, (engineer) to use.
-- @param blueprintID Unit's bp ID to build, example: 'ueb0101'.
-- @param buildLocation Table {x, z, 0}.
-- @param buildRelative: true/false. true = build coordinates are relative to the starting location, false = absolute coords
-- @return true/false
function CAiBrain:BuildStructure(builder, blueprintID, buildLocation, buildRelative)
end


-- \lua\AI\AIBuilders\AIEconomicBuilders.lua

-- Called if there is a conditional build available to start
function DoConditionalBuild(singleEngineerPlatoon)
    local aiBrain = singleEngineerPlatoon:GetBrain()


WARN(debug.traceback())





if factionIndex == 1 then
    resourceStructures = {'UEB1103', 'UEB1103', 'UEB1103', 'UEB1103'}
    initialUnits = {'UEB0101', 'UEB1101', 'UEB1101', 'UEB1101', 'UEB1101'}
elseif factionIndex == 2 then
    resourceStructures = {'UAB1103', 'UAB1103', 'UAB1103', 'UAB1103'}
    initialUnits = {'UAB0101', 'UAB1101', 'UAB1101', 'UAB1101', 'UAB1101'}
elseif factionIndex == 3 then
    resourceStructures = {'URB1103', 'URB1103', 'URB1103', 'URB1103'}
    initialUnits = {'URB0101', 'URB1101', 'URB1101', 'URB1101', 'URB1101'}
elseif factionIndex == 4 then
    resourceStructures = {'XSB1103', 'XSB1103', 'XSB1103', 'XSB1103'}
    initialUnits = {'XSB0101', 'XSB1101', 'XSB1101', 'XSB1101', 'XSB1101'}
end



--- вызывает критическую ошибку.
Callbacks.BuildMex = function(position, units)
    print(' SimCallback BuildMex')
    -- local units = EntityCategoryFilterDown(categories.ENGINEER, units)
    if not units[1] then return end
    -- print('eng in')
    -- local mex = GetEntityById(data.target)
    -- if not mex or not EntityCategoryContains(categories.MASSEXTRACTION * categories.STRUCTURE, mex) then return end

    -- if mex:GetCurrentLayer() == 'Seabed' then return end

    -- local pos = mex:GetPosition()
    local msid = LetterArray[units[1]:GetBlueprint().General.FactionName]..'b1103'
    local builder = units[1]

    -- for _, unit in units do
    --     msid = LetterArray[unit:GetBlueprint().General.FactionName]..'b1103' -- The identity of the storage we'll build
    --     if unit:CanBuild(msid) then
    --         builder = unit
    --         break
    --     end
    -- end

    if not builder then return end

    local location = Vector(position[1],position[2],position[3])
    IssueBuildMobile({builder}, location, msid, {})

    IssueGuard(units, builder)
end



-- table.sort(onScreenReclaims, function(a, b) return a.mass > b.mass end)
]]