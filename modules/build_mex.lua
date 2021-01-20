

function build_mex()
    return 
    -- build mex if it possible
    local units = EntityCategoryFilterDown(categories.ENGINEER, GetSelectedUnits())
    if not units[1] then return end
    -- local mex = GetEntityById(data.target)
    local mex = 'uab1103'
    if not mex or not EntityCategoryContains(categories.MASSEXTRACTION * categories.STRUCTURE, mex) then return end

    -- if mex:GetCurrentLayer() == 'Seabed' then return end
    local X = units:GetPosition()[1]
    local Z = units:GetPosition()[3]

    local mass_deposits = GetDepositsAroundPoint(X, Z, Radius, Type)
    local i = 1
    for j=1,table.getn(mass_deposits) do
        if mass_deposits[i].Dist > mass_deposits[j].Dist then 
            i = j
        end
    end
    -- local Y = 
    local pos = {mass_deposits[i].X2-0.5,0,mass_deposits[i].Z2-0.5}
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
    local Position = pos
    local Blueprint = 'ueb1103'
    
    AddCommandFeedbackBlip({
        Position = Position,
        BlueprintID = Blueprint,
        TextureName = '/meshes/game/flag02d_albedo.dds',
        ShaderName = 'CommandFeedback',
        UniformScale = 1,
    }, 0.7)
    print('Bom')

    -- IssueGuard(units, builder)
end
