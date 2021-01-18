

function build_mex(waypoint)
    -- build mex if it possible
    -- Callbacks.CapMex = function(data, units)
    local units = EntityCategoryFilterDown(categories.ENGINEER, GetSelectedUnits())
    if not units[1] then return end
    -- local mex = GetEntityById(data.target)
    local mex = 'uab1103'
    if not mex or not EntityCategoryContains(categories.MASSEXTRACTION * categories.STRUCTURE, mex) then return end

    -- if mex:GetCurrentLayer() == 'Seabed' then return end

    local pos = waypoint
    local msid = mex
    local builder

    -- for _, unit in units do
    --     msid = mex -- t1 mex
    --     if unit:CanBuild(msid) then
    --         break
    --     end
    -- end
    builder = units[1]

    if not builder then return end

    -- local locations = {
    --     up = Vector(pos.x, pos.y, pos.z - 2),
    --     down = Vector(pos.x, pos.y, pos.z + 2),
    --     left = Vector(pos.x - 2, pos.y, pos.z),
    --     right = Vector(pos.x + 2, pos.y, pos.z),
    -- }
    local location = waypoint

    
    IssueBuildMobile({builder}, location, msid, {})
    print('Bom')

    IssueGuard(units, builder)
end
