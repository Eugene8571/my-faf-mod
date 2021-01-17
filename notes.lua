function UpdatePrioState()
    local units = currentSelection

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

--- Orders platoon to move to target position.
-- If squad is specified, moves only the squad.
-- @param position Table with position {x, y, z}.
-- @param useTransports true/false
-- @param [squad] Types: 'Attack', 'Artillery', 'Guard' 'None', 'Scout', 'Support'.
-- @return command
function CPlatoon:MoveToLocation(position, useTransports, [squad])
end