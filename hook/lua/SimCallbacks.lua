

Callbacks.AttackMove = function(data, units)
    LOG('AttackMove')
    LOG(table_to_string(data))

    local engis = EntityCategoryFilterDown(categories.ENGINEER, units)
    if engis[1] then 
        LOG('engis[1] ', engis[1])
        -- if CanBuildInSpot(mex, msid, location) then
        IssueBuildMobile({engis[1]}, data.Target, 'ueb1103', {})
        IssueGuard(units, engis[1])
        return
        -- end
    end

    if data.Clear then
        IssueClearCommands(units)
    end
    IssueAggressiveMove(units, data.Target)
end
