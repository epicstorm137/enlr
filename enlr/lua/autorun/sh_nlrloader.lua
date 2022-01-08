enlr = enlr or {}
enlr.Config = enlr.Config or {}

-- Enable to add nlr when a player suicides
enlr.Config.SuicideNLR = true

-- Enable to add nlr when a player gets killed by an entity
enlr.Config.EntityNLR = true

-- Time In Seconds for NLR to be over
enlr.Config.NLRTime = 60

-- The radius of the bubble that is the NLR zone
enlr.Config.NLRRadius = 750

-- The text that is displayed when you break NLR
enlr.Config.NLRWarning = "You are currently breaking NLR!"

-- The color of the timer of your nlr
enlr.Config.TimerColor = color_white

-- The color of the warning on someones head
enlr.Config.NotifColor = Color( 255, 0, 0 )

-- The text of the warning on someones head
enlr.Config.NotiText = "Currently Breaking NLR"

-- The distance of the warning above someones head will be rendered
enlr.Config.NotifDist = 240