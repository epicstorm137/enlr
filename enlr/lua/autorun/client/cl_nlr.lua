local metaply = FindMetaTable("Player")
local scrw,scrh = ScrW(),ScrH()

surface.CreateFont("ENLRFont",{font = "Roboto",size = 20, antialias = true})
surface.CreateFont("ENLRFontSmall",{font = "Roboto",size = 15, antialias = true})
surface.CreateFont("ENLRFontLarge",{font = "Roboto",size = 30, antialias = true})


function metaply:HasNLR()
    return self:GetNWBool("enlr:hasnlr",false)
end

function metaply:GetNLRTime()
    return self:GetNWInt("enlr:nlrover",0)
end

function metaply:IsInNLR()
    if !self:HasNLR() then return false end
    local nlrvec = self:GetNWVector("enlr:point")
    local nlrdist = nlrvec:Distance(self:GetPos())
    if nlrdist < enlr.Config.NLRRadius then
        return true
    else
        return false
    end
end

net.Receive("enlr_startnlr",function()
    local ply = LocalPlayer()
    hook.Add("HUDPaint","enlr:RenderCount",function()
        draw.DrawText("NLR Time Left: "..(math.Round(ply:GetNLRTime() - CurTime())), "ENLRFont", scrw * 0.5, scrh * 0.005, enlr.Config.TimerColor, TEXT_ALIGN_CENTER )
    end)
end)

net.Receive("enlr_forcestop",function()
    hook.Remove("HUDPaint","enlr:RenderCount")
end)

hook.Add("Initialize","enlr:precachenlr",function()
    enlr.HasNLR = false
    enlr.IsInNLR = false
end)

timer.Simple(5,function()
    timer.Create("enlr:cachenlr",.5 ,0,function()
        enlr.HasNLR = LocalPlayer():HasNLR()
        if enlr.HasNLR then
            if LocalPlayer():IsInNLR() then
                enlr.IsInNLR = true
            else
                enlr.IsInNLR = false
            end
        end
    end)
end)

hook.Add("HUDPaint","enlr:RenderZone",function()
    if enlr.HasNLR and enlr.IsInNLR then
        draw.DrawText(enlr.Config.NLRWarning, "ENLRFontLarge", scrw* 0.5, scrh* 0.6, HSVToColor(  ( CurTime() * 75 ) % 360, 1, 1 ) , TEXT_ALIGN_CENTER )
    end
end)

hook.Add("HUDPaint","enlr:PlayerHasNLR",function()
    for k,targ in ipairs(player.GetAll()) do
        if LocalPlayer() != targ and LocalPlayer():GetPos():Distance( targ:GetPos() ) < enlr.Config.NotifDist and targ:IsInNLR() then
            local eyepos = targ:EyePos() + Vector(0,0,20)
            scrpos = eyepos:ToScreen()

            draw.SimpleText(enlr.Config.NotiText,"ENLRFontLarge",scrpos.x,scrpos.y,enlr.Config.NotifColor,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end
end)