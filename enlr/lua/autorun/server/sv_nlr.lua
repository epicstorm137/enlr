util.AddNetworkString("enlr_startnlr")
util.AddNetworkString("enlr_forcestop")

local metaply = FindMetaTable("Player")

function metaply:HasNLR()
    return self:GetNWBool("enlr:hasnlr",false)
end

function metaply:RemoveNLR()
    if !self:HasNLR() then return end
    self:SetNWVector("enlr:point",nil)
    self:SetNWInt("enlr:nlrover",nil)
    self:SetNWBool("enlr:hasnlr",false)
    net.Start("enlr_forcestop")
    net.Send(self)
end

hook.Add("PlayerDeath","enlr:addnlrdeath",function(ply,inflictor,attacker)
    if ply == attacker and !enlr.Config.SuicideNLR then return end
    if !attacker:IsPlayer() and !enlr.Config.EntityNLR then return end
    local deathtime = CurTime()

    ply:SetNWVector("enlr:point",ply:GetPos())
    ply:SetNWInt("enlr:nlrover",(deathtime + enlr.Config.NLRTime))
    ply:SetNWBool("enlr:hasnlr",true)

    timer.Simple(enlr.Config.NLRTime,function()
        if (ply:GetNWInt("enlr:nlrover") - enlr.Config.NLRTime) == deathtime then
            ply:RemoveNLR()
        end
    end)

    net.Start("enlr_startnlr")
    net.Send(ply)

end)