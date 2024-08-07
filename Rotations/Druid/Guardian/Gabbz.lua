

local rotationName = "Gabbz"
local wmbapi = _G.wmbapi
---------------
--- Toggles ---
---------------
local function createToggles()
    -- Rotation Button
    local RotationModes = {
        [1] = { mode = "On", value = 1, overlay = "Automatic Rotation", tip = "Enables DPS Rotation", highlight = 1, icon = br.player.spells.swipe },
        [2] = { mode = "Off", value = 2, overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = br.player.spells.regrowth }
    };
    br.ui:createToggle(RotationModes, "Rotation", 1, 0)
 -- Cooldown Button
    local CooldownModes = {
       -- [1] = { mode = "Auto", value = 1, overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = br.player.spells.incarnationGuardianOfUrsoc },
        [1] = { mode = "On", value = 1, overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = br.player.spells.incarnationGuardianOfUrsoc },
        [2] = { mode = "Off", value = 3, overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = br.player.spells.incarnationGuardianOfUrsoc }
    };
    br.ui:createToggle(CooldownModes, "Cooldown", 2, 0)
   -- Defensive Button
    local DefensiveModes = {
        [1] = { mode = "On", value = 1, overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = br.player.spells.survivalInstincts },
        [2] = { mode = "Off", value = 2, overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = br.player.spells.survivalInstincts }
    };
    br.ui:createToggle(DefensiveModes, "Defensive", 3, 0)
    -- Interrupt Button
    local InterruptModes = {
        [1] = {
            mode = "On",
            value = 1,
            overlay = "Interrupts Enabled",
            tip = "Includes Basic Interrupts.",
            highlight = 1,
            icon = br.player.spells.skullBash
        },
        [2] = {
            mode = "Off",
            value = 2,
            overlay = "Interrupts Disabled",
            tip = "No Interrupts will be used.",
            highlight = 0,
            icon = br.player.spells.skullBash
        }
    };
    br.ui:createToggle(InterruptModes, "Interrupt", 4, 0)
--Taunt
    local TauntModes = {
        [1] = {
            mode = "Dun",
            value = 1,
            overlay = "Taunt only in Dungeon",
            tip = "Taunt will be used in dungeons.",
            highlight = 1,
            icon = br.player.spells.growl
        },
        [2] = {
            mode = "All",
            value = 2,
            overlay = "Auto Taunt Enabled",
            tip = "Taunt will be used everywhere.",
            highlight = 0,
            icon = br.player.spells.growl
        },
        [3] = {
            mode = "Off",
            value = 3,
            overlay = "Auto Taunt Disabled",
            tip = "Taunt will not be used.",
            highlight = 0,
            icon = br.player.spells.incapacitatingRoar
        }
    };
    br.ui:createToggle(TauntModes, "Taunt", 1, -1)

    local BristlingFurModes = {
        [1] = {
            mode = "On",
            value = 1,
            overlay = "Bristling Fur Enabled",
            tip = "Will use BF",
            highlight = 1,
            icon = br.player.spells.bristlingFur
        },
        [2] = {
            mode = "Off",
            value = 2,
            overlay = "Bristling Fur Disabled",
            tip = "Will not use BF",
            highlight = 0,
            icon = br.player.spells.bristlingFur
        }
    };
    br.ui:createToggle(BristlingFurModes, "BristlingFur", 0, -1)

    local FormsModes = {
        [1] = {
            mode = "On",
            value = 1,
            overlay = "Auto Forms Enabled",
            tip = "Will change forms",
            highlight = 0,
            icon = br.player.spells.catForm
        },
        [2] = {
            mode = "Key",
            value = 2,
            overlay = "Auto Forms hotkey",
            tip = "Key triggers Auto Forms",
            highlight = 0,
            icon = br.player.spells.catForm
        },
        [3] = {
            mode = "Off",
            value = 3,
            overlay = "Auto Forms Disabled",
            tip = "Will Not change forms",
            highlight = 0,
            icon = br.player.spells.catForm
        }
    };
    br.ui:createToggle(FormsModes, "Forms", 2, -1)
-- Maul
    local MaulModes = {
        [1] = {
            mode = "On",
            value = 1,
            overlay = "Auto Maul Enabled",
            tip = "Will use Maul",
            highlight = 1,
            icon = br.player.spells.maul
        },
        [2] = {
            mode = "Off",
            value = 2,
            overlay = "Auto Maul Disabled",
            tip = "Will not use Maul",
            highlight = 0,
            icon = br.player.spells.maul
        }
    };
    br.ui:createToggle(MaulModes, "Maul", 3, -1)

    local TravelModes = {
        [1] = {
            mode = "On",
            value = 1,
            overlay = "Stay in Travel Form",
            tip = "Will stay in Travel Form if combat starts",
            highlight = 1,
            icon = br.player.spells.travelForm
        },
        [2] = {
            mode = "Off",
            value = 2,
            overlay = "Leave Travel Form",
            tip = "Will break Travel Form for combat",
            highlight = 0,
            icon = br.player.spells.travelForm
        }
    };
    br.ui:createToggle(TravelModes, "Travel", 4, -1)
        -- Tankbuster Modes
        local TankbusterModes = {
            [1] = { mode = "On", value = 1, overlay = "M+ Tankbuster Enabled", tip = "Will use Demon Spikes to Mitigate Tank Busters", highlight = 1, icon = br.player.spells.demonSpikes },
            [2] = { mode = "Off", value = 2, overlay = "M+ Tankbuster Disabled", tip = "Will NOT use Demon Spikes to Mitigate Tank Busters", highlight = 0, icon = br.player.spells.demonSpikes }
        };
        br.ui:createToggle(TankbusterModes, "Tankbuster", 5, -1)
end
---------------
--- OPTIONS ---
---------------
local function createOptions()
    local optionTable

    local function rotationOptions()
        local section
        ----------------------
        --- General Options---
        ----------------------
        section = br.ui:createSection(br.ui.window.profile, "General - Version 1.04")
        -- Travel Shapeshifts
        br.ui:createDropdownWithout(section, "Cat Key", br.dropOptions.Toggle, 6, "Set a key for cat")
        br.ui:createDropdownWithout(section, "Travel Key", br.dropOptions.Toggle, 6, "Set a key for travel")
        br.ui:createDropdown(section, "Big Hit Oh Shit!", br.dropOptions.Toggle, 6, "Hold down key to use defensives for large hits")
        br.ui:createCheckbox(section, "Auto Engage On Target", "Cast Moonfire on target OOC to engage in combat")
        br.ui:createCheckbox(section, "Auto Stealth in Cat Form", 1)
        br.ui:createCheckbox(section, "Auto Dash in Cat Form", 1)
        -- Wild Charge
        br.ui:createCheckbox(section, "Wild Charge", "Enables/Disables Auto Charge usage.")
        -- Max Moonfire Targets
        br.ui:createSpinnerWithout(section, "Max Moonfire Targets", 3, 1, 10, 1, "|cff0070deSet to maximum number of targets to dot with Moonfire. Min: 1 / Max: 10 / Interval: 1")
        br.ui:checkSectionState(section)
        
        -----------------------
        --- Cooldown Options---
        -----------------------
        section = br.ui:createSection(br.ui.window.profile, "Cooldowns")
        br.ui:createCheckbox(section, "Racial")
        -- Trinkets
        br.ui:createDropdownWithout(section, "Trinket Type", {"DPS", "Tank"}, 1, "|cffFFFFFFWhat type of trinkets are being used.")
        br.ui:createDropdownWithout(section, "Trinket Use", {"|cff00FF00Everything", "|cffFFFF00Cooldowns", "|cffFF0000Never,"}, 1, "|cffFFFFFFWhen to use trinkets.")
        br.ui:createSpinner(section, "Trinket 1", 70, 0, 100, 5, "(Tank Trinkets Only) Health Percent to Cast At")
        br.ui:createSpinner(section, "Trinket 2", 70, 0, 100, 5, "(Tank Trinkets Only) Health Percent to Cast At")
        br.ui:checkSectionState(section)
        -- Radar
        section = br.ui:createSection(br.ui.window.profile, "Radar")
        br.ui:createCheckbox(section, "All - Root the thing")
        br.ui:createCheckbox(section, "FH - Root grenadier")
        br.ui:createCheckbox(section, "AD - Root Spirit of Gold")
        br.ui:createCheckbox(section, "KR - Root Minions of Zul")
        br.ui:createCheckbox(section, "KR - Animated gold")
        br.ui:checkSectionState(section)
        ------------------------
        --- Defensive Options---
        ------------------------
        section = br.ui:createSection(br.ui.window.profile, "Defensive")
        -- Survival Instincts
        br.ui:createSpinner(section, "Survival Instincts", 40, 0, 100, 5, "Health Percent to Cast At")
        -- Rage Dump
        br.ui:createSpinnerWithout(section, "Rage Dump Amount", 40, 0, 100, 5, "Rage Deficit to use Ironfur/Maul")
        -- Ironfur Stacks
        br.ui:createSpinner(section, "Ironfur", 0, 0, 10, 1, "Set max stacks of ironfur before dumping rage into maul instead (0 for no limit)")
        -- Ironfur
        br.ui:createSpinner(section, "Ironfur (No Aggro)", 85, 0, 100, 5, "Use Ironfur on Adds/Bosses you can't aggro such as Carapace of N'Zoth if below %hp")
        --Incarnation/Berserk
        br.ui:createSpinner(section, "Incarnation/Berserk", 50, 0, 100, 5, "Use Incarnation/Berserk when below %hp")
        --Barkskin
        br.ui:createSpinner(section, "Barkskin", 50, 0, 100, 5, "Health Percentage to use at.")
        --Renewal
        br.ui:createSpinner(section, "Renewal", 50, 0, 100, 5, "Health Percentage to use at.")
        -- Frenzied Regen
        br.ui:createCheckbox(section, "Frenzied Regeneration", "Enable FR")
        br.ui:createSpinnerWithout(section, "FR - HP Interval (2 Charge)", 65, 0, 100, 5, "Health Interval to use at with 2 charges.")
        br.ui:createSpinnerWithout(section, "FR - HP Interval (1 Charge)", 40, 0, 100, 5, "Health Interval to use at with 1 charge.")
        -- Swiftmend
        br.ui:createSpinner(section, "OOC Swiftmend", 70, 10, 90, 5, "Will use Swiftmend Out of Combat.")
        -- Rejuvenation
        br.ui:createSpinner(section, "OOC Rejuvenation", 70, 10, 90, 5, "Minimum HP to cast Out of Combat.")
        -- Regrowth
        br.ui:createSpinner(section, "OOC Regrowth", 70, 10, 90, 5, "Minimum HP to cast Out of Combat.")
        -- Wild Growth
        br.ui:createSpinner(section, "OOC Wild Growth", 70, 10, 90, 5, "Mninimum HP to cast Out of Combat.")
        br.ui:createSpinnerWithout(section, "Friendly Targets", 4, 1, 5, 1, "Number of friendly targets below set HP to cast Wild Growth.")
        -- Soothe
        br.ui:createCheckbox(section, "Auto Soothe")
        -- Revive
        br.ui:createDropdown(section, "Revive", {"|cffFFFF00Selected Target", "|cffFF0000Mouseover Target", "|cffFFBB00Auto"}, 1, "|ccfFFFFFFTarget to Cast On")
        -- Rebirth
        br.ui:createDropdown(
            section,
            "Rebirth",
            {
                "|cffFFFFFFTarget",
                "|cffFFFFFFMouseover",
                "|cffFFFFFFTank",
                "|cffFFFFFFHealer",
                "|cffFFFFFFHealer/Tank",
                "|cffFFFFFFAny"
            },
            1,
            "|cffFFFFFFTarget to cast on"
        )
        -- Remove Corruption
        br.ui:createCheckbox(section, "Remove Corruption")
        br.ui:createDropdownWithout(section, "Remove Corruption - Target", {"Player", "Target", "Mouseover"}, 1, "Target to cast on")
        br.ui:checkSectionState(section)
        ------------------------
        --- Interrupt Options---
        ------------------------
        section = br.ui:createSection(br.ui.window.profile, "Interrupts")
        br.ui:createCheckbox(section, "Skull Bash")
        br.ui:createCheckbox(section, "Mighty Bash")
        br.ui:createCheckbox(section, "Incapacitating Roar")
        br.ui:createCheckbox(section, "Incapacitating Roar Logic (M+)")
        br.ui:createSpinner(section, "Interrupt At", 0, 0, 95, 5, "Cast Percent to Cast At")
        br.ui:checkSectionState(section)
    end
    optionTable = {
        {
            [1] = "Rotation Options",
            [2] = rotationOptions
        }
    }
    return optionTable
end

--------------
--- Locals ---
--------------
-- BR API Locals
local actionList = {}
local buff
local cast
local cd
local charges
local comboPoints
local debuff
local enemies
local energy
local rage
local equiped
local items
local module
local race
local spell
local talent
local ui
local unit
local units
local use
local var

local function runRotation()
 
  
   

        br.player.ui.mode.bristlingFur = br.data.settings[br.selectedSpec].toggles["BristlingFur"]
        br.player.ui.mode.ironfur = br.data.settings[br.selectedSpec].toggles["Ironfur"]
        br.player.ui.mode.taunt = br.data.settings[br.selectedSpec].toggles["Taunt"]
        br.player.ui.mode.forms = br.data.settings[br.selectedSpec].toggles["Forms"]
        buff = br.player.buff
        cast = br.player.cast
        catspeed = br.player.buff.dash.exists() or br.player.buff.tigerDash.exists()
        combatTime = br.getCombatTime()
  --wrong      combo = br.player.power.comboPoints.amount()
        cd = br.player.cd
        charges = br.player.charges
        deadtar, attacktar, hastar, playertar =
            br.GetUnitIsDeadOrGhost("target"),
            br._G.UnitCanAttack("target", "player"),
            br.GetObjectExists("target"),
            br._G.UnitIsPlayer("target")
        debuff = br.player.debuff
        energy = br.player.power.energy
   --wrong     energyRegen =  br.player.power.energy.regen()
    --wrong    energyDeficit =  br.player.power.energy.deficit()
        enemies = br.player.enemies
        falling, swimming, flying = br.getFallTime(), br._G.IsSwimming(), br._G.IsFlying()
        flaskBuff = br.getBuffRemain("player", br.player.flask.wod.buff.agilityBig)
        gcd = br.player.gcdMax
        hasMouse = br.GetObjectExists("mouseover")
        healPot = br.getHealthPot()
        inCombat = br.player.inCombat
        essence = br.player.essence
        inInstance = br.player.instance == "party"
        inRaid = br.player.instance == "raid"
        level = br.player.level
        lossPercent = br.getHPLossPercent("player", 5)
        lowest = br.friend[1]
        mode = br.player.ui.mode
        moving = br.isMoving("player")
        unit = br.player.unit
       -- php = br.player.health
        playerMouse = br._G.UnitIsPlayer("mouseover")
        rage = br.player.power.rage
        --wrong ragemax, ragegen, rageDeficit = br.player.power.rage.amount(), br.player.power.rage.max(), br.player.power.rage.regen(), br.player.power.rage.deficit()
        pullTimer = br.DBM:getPulltimer()
        racial = br.player.getRacial()
        solo = br.player.instance == "none"
        snapLossHP = 0
        spell = br.player.spells
        talent = br.player.talent
        tanks = br.getTanksTable()
        traits = br.player.traits
        travel, flight, bear, cat, noform =
            br.player.buff.travelForm.exists(),
            br.player.buff.flightForm.exists(),
            br.player.buff.bearForm.exists(),
            buff.catForm.exists(),
            br._G.GetShapeshiftForm() == 0
        trinketProc = false
        ttd = br.getTTD
        ttm = br.player.power.rage.ttm
        unit = br.player.unit
        units = br.player.units
        ui = br.player.ui
        use = br.player.use
        hasAggro = br._G.UnitThreatSituation("player")

   
   
        if hasAggro == nil then
            hasAggro = 0
        end

        --wipe timers table
        if br.timersTable then
            br._G.wipe(br.timersTable)
        end

 
        
    units.get(5)
    units.get(8)
    units.get(40)
    enemies.get(5)
    enemies.get(5, "player", false, true)
    enemies.get(8)                         -- makes enemies.yards8
    enemies.get(8, "player", false, true)  -- makes enemies.yards8f
    enemies.get(8, "target")               -- makes enemies.yards8t
    enemies.get(10)
    enemies.get(13)
    enemies.get(20)
    enemies.get(30)
    enemies.get(40)

    if br.leftCombat == nil then
        br.leftCombat = br._G.GetTime()
    end
    if br.profileStop == nil then
        br.profileStop = false
    end
    if br.lastForm == nil then
        br.lastForm = 0
    end

    local Incap_unitList = {
        [131009] = "Spirit of Gold",
        [134388] = "A Knot of Snakes",
        [129758] = "Irontide Grenadier"
    }

    local function actionList_Extras()
        -- Bear Form when not in combat and target selected and within 20yrds
        if
            (mode.forms == 1 or (mode.forms == 2 and not br.SpecificToggle("Travel Key") and not br.SpecificToggle("Cat Key") and not br._G.GetCurrentKeyBoardFocus())) and
                br.GetObjectExists("target") and
                br._G.UnitCanAttack("player", "target") and
                not br.GetUnitIsDeadOrGhost("target") and
                not bear and
                ((unit.distance("target") < 30 and not unit.swimming()) or (unit.distance("target") < 10 and unit.swimming()))
         then
            --unit.cancelForm()
            if cast.bearForm("player") then
                br.addonDebug("Casting Bear Form [Target In 20yrds]")
                return true
            end
        end
        -- Flight Form
        if mode.forms == 1 then
            if
                not travel and #enemies.yards10 == 0 and not unit.swimming() and unit.level() >= 24 and not buff.prowl.exists() and br._G.IsOutdoors() and
                    not ((unit.distance("target") < 30 and not unit.swimming()) or (unit.distance("target") < 10 and unit.swimming()))
             then
                if br.timer:useTimer("Travel Delay", 1) then
                    -- if unit.form() ~= 0 and not cast.last.travelForm() then
                    unit.cancelForm()
                    --     br.addonDebug("Cancel Form [Flying]")
                    -- elseif unit.form() == 0 then
                    if cast.travelForm("player") then
                        br.addonDebug("Casting Travel Form [Flying]")
                        return true
                    end
                end
            -- end
            end
            -- Aquatic Form
            if unit.swimming() and not buff.travelForm.exists() and not buff.prowl.exists() and unit.moving() then
                if unit.form() ~= 0 and not cast.last.travelForm() then
                    unit.cancelForm()
                    br.addonDebug("Cancel Form [Swimming]")
                elseif unit.form() == 0 then
                    if cast.travelForm("player") then
                        br.addonDebug("Casting Travel From [Swimming]")
                        return true
                    end
                end
            end
            -- Cat Form
            if not buff.catForm.exists() and #enemies.yards10 == 0 and not unit.mounted() and not  unit.flying() and not ((unit.distance("target") < 30 and not unit.swimming()) or (unit.distance("target") < 10 and unit.swimming()))
             then
                -- Cat Form when not swimming or flying or stag and not in combat
                if unit.moving() and not unit.swimming() and not unit.flying() and not br._G.IsOutdoors() and not buff.travelForm.exists() and not buff.soulshape.exists() then
                    if cast.catForm("player") then
                        br.addonDebug("Casting Cat Form [No Swim / Travel / Combat]")
                        return true
                    end
                end
                -- Cat Form - Less Fall Damage
                if
                    (not br.canFly() or unit.inCombat() or unit.level() < 24 or not br._G.IsOutdoors()) and
                        (not unit.swimming() or (not unit.moving() and unit.swimming() and #enemies.yards5f > 0)) and
                        br.fallDist > 90
                 then --falling > ui.value("Fall Timer")
                    if cast.catForm("player") then
                        br.addonDebug("Casting Cat Form [Reduce Fall Damage]")
                        return true
                    end
                end
            end
        end
        if ui.checked("Revive") and not inCombat and not br.isMoving("player") and br.timer:useTimer("Resurrect", 4) then
            if ui.value("Revive") == 1 and br._G.UnitIsPlayer("target") and br.GetUnitIsDeadOrGhost("target") and br.GetUnitIsFriend("target", "player") then
                if cast.revive("target", "dead") then
                    br.addonDebug("Casting Revive")
                    return true
                end
            end
            if ui.value("Revive") == 2 and br._G.UnitIsPlayer("mouseover") and br.GetUnitIsDeadOrGhost("mouseover") and br.GetUnitIsFriend("mouseover", "player") then
                if cast.revive("mouseover", "dead") then
                    br.addonDebug("Casting Revive")
                    return true
                end
            end
            if ui.value("Revive") == 3 then
                for i = 1, #br.friend do
                    if br._G.UnitIsPlayer(br.friend[i].unit) and br.GetUnitIsDeadOrGhost(br.friend[i].unit) then
                        if cast.revive(br.friend[i].unit, "dead") then
                            br.addonDebug("Casting Revive (Auto)")
                            return true
                        end
                    end
                end
            end
        end
    end

    local function actionList_OOC()
        -- Swiftmend
        if ui.checked("OOC Swiftmend") and unit.hp() <= ui.value("OOC Swiftmend") and not inCombat and cast.able.swiftmend() then
            if wmbapi then
                unit.cancelForm()
            end
            if cast.swiftmend("player") then
                return
            end
        end
        -- Rejuvenation
        if ui.checked("OOC Rejuvenation") 
            and unit.hp() <= ui.value("OOC Rejuvenation")
            and not buff.rejuvenation.exists("player") 
            and not inCombat 
            and cast.able.rejuvenation("player") 
        then
            if wmbapi then
                unit.cancelForm()
            end
            if cast.rejuvenation("player") then
                return
            end
        end
        -- Regrowth
        if ui.checked("OOC Regrowth") and not moving and unit.hp() <= ui.value("OOC Regrowth") and not inCombat then
            if wmbapi then
                unit.cancelForm()
            end
            if cast.regrowth("player") then
                return
            end
        end
        -- Wild Growth
        if ui.checked("OOC Wild Growth") and not moving then
            for i = 1, #br.friend do
                if br._G.UnitInRange(br.friend[i].unit) then
                    local lowHealthCandidates = br.getUnitsToHealAround(br.friend[i].unit, 30, ui.value("OOC Wild Growth"), #br.friend)
                    if (#lowHealthCandidates >= ui.value("Friendly Targets")) and not moving then
                        if wmbapi then
                            unit.cancelForm()
                        end
                        if cast.wildGrowth(br.friend[i].unit) then
                            return true
                        end
                    end
                end
            end
        end
        if
            ui.checked("Auto Engage On Target") and debuff.moonfire.count() < ui.value("Max Moonfire Targets") and not debuff.moonfire.exists() and solo and
                br.isValidTarget("target") and
                (br._G.UnitIsEnemy("target", "player"))
         then
            if cast.moonfire() then
                return true
            end
        end
    end

    local function actionList_BigHit()
        -- Barkskin
        if not buff.survivalInstincts.exists()  then
            if cast.barkskin() then
                br.addonDebug("Casting Barkskin (Big Hit)")
                return
            end
        end
        -- Trinkets
        if (ui.value("Trinket Use") == 1 or (ui.value("Trinket Use") == 2 and br.useCDs())) then
            if ui.checked("Trinket 1") and ui.value("Trinket Type") == 2 and unit.hp() <= ui.value("Trinket 1") and use.able.slot(13) then
                use.slot(13)
            elseif ui.checked("Trinket 2") and ui.value("Trinket Type") == 2 and unit.hp() <= ui.value("Trinket 2") and use.able.slot(14) then
                use.slot(14)
            end
        end
        -- Survival Instincts
        if not buff.barkskin.exists() then
            if cast.survivalInstincts() then
                br.addonDebug("Casting Survival Instincts (Big Hit)")
                return
            end
        end
        -- Renewal   
        --why heal before damage?
  --      if not buff.frenziedRegeneration.exists() then
   --         if cast.renewal() then
   --             br.addonDebug("Casting Renewal (Big Hit)")
   --             return
    --        end
   --     end
        -- Ironfur
        -- Lets dump all Rage on Ironfur if big hit  off GCD

            if cast.ironfur() then
                br.addonDebug("Casting Ironfur (Big Hit IF Expiring)")
                return
            end


        -- Bristling Fur
        if talent.bristlingFur and not buff.survivalInstincts.exists() and not buff.barkskin.exists() then
            if cast.bristlingFur() then
                br.addonDebug("Casting Bristling Fur (Big Hit)")
                return
            end
        end
    end

    local function actionList_Defensive()
        if br.useDefensive() then
            -- Rebirth
            if ui.checked("Rebirth") and not moving then
                if
                    ui.value("Rebirth") == 1 and -- Target
                        br._G.UnitIsPlayer("target") and
                        br.GetUnitIsDeadOrGhost("target") and
                        br.GetUnitIsFriend("target", "player")
                 then
                    if cast.rebirth("target", "dead") then
                        br.addonDebug("Casting Rebirth")
                        return true
                    end
                end
                if
                    ui.value("Rebirth") == 2 and -- Mouseover
                        br._G.UnitIsPlayer("mouseover") and
                        br.GetUnitIsDeadOrGhost("mouseover") and
                        br.GetUnitIsFriend("mouseover", "player")
                 then
                    if cast.rebirth("mouseover", "dead") then
                        br.addonDebug("Casting Rebirth")
                        return true
                    end
                end
                if ui.value("Rebirth") == 3 then -- Tank
                    for i = 1, #tanks do
                        if
                            br._G.UnitIsPlayer(tanks[i].unit) and br.GetUnitIsDeadOrGhost(tanks[i].unit) and br.GetUnitIsFriend(tanks[i].unit, "player") and
                                br.getDistance(tanks[i].unit) <= 40
                         then
                            if cast.rebirth(tanks[i].unit, "dead") then
                                br.addonDebug("Casting Rebirth")
                                return true
                            end
                        end
                    end
                end
                if ui.value("Rebirth") == 4 then -- Healer
                    for i = 1, #br.friend do
                        if
                            br._G.UnitIsPlayer(br.friend[i].unit) and br.GetUnitIsDeadOrGhost(br.friend[i].unit) and br.GetUnitIsFriend(br.friend[i].unit, "player") and
                                (br._G.UnitGroupRolesAssigned(br.friend[i].unit) == "HEALER" or br.friend[i].role == "HEALER")
                         then
                            if cast.rebirth(br.friend[i].unit, "dead") then
                                br.addonDebug("Casting Rebirth")
                                return true
                            end
                        end
                    end
                end
                if ui.value("Rebirth") == 5 then -- Tank/Healer
                    for i = 1, #br.friend do
                        if
                            br._G.UnitIsPlayer(br.friend[i].unit) and br._G.UnitIsDeadOrGhost(br.friend[i].unit) and br.GetUnitIsFriend(br.friend[i].unit, "player") and
                                (br._G.UnitGroupRolesAssigned(br.friend[i].unit) == "HEALER" or br.friend[i].role == "HEALER" or br.friend[i].role == "TANK" or
                                    br._G.UnitGroupRolesAssigned(br.friend[i].unit) == "TANK")
                         then
                            if cast.rebirth(br.friend[i].unit, "dead") then
                                br.addonDebug("Casting Rebirth")
                                return true
                            end
                        end
                    end
                end
                if ui.value("Rebirth") == 6 then -- Any
                    for i = 1, #br.friend do
                        if br._G.UnitIsPlayer(br.friend[i].unit) and br._G.UnitIsDeadOrGhost(br.friend[i].unit) and br.GetUnitIsFriend(br.friend[i].unit, "player") then
                            if cast.rebirth(br.friend[i].unit, "dead") then
                                br.addonDebug("Casting Rebirth")
                                return true
                            end
                        end
                    end
                end
            end
            if ui.checked("Incarnation/Berserk") and unit.hp() <= ui.value("Incarnation/Berserk") then
                if talent.incarnationGuardianOfUrsoc then
                    -- Incarnation
                    if cast.incarnationGuardianOfUrsoc() then
                        br.addonDebug("Casting Incarnation")
                        return
                    end
                else
                    -- Berserk
                    if cast.berserk() then
                        br.addonDebug("Casting Berserk")
                        return
                    end
                end
            end
            -- Survival Instincts
            if ui.checked("Survival Instincts") then
                if unit.hp() <= ui.value("Survival Instincts") and inCombat and not buff.survivalInstincts.exists() then
                    if cast.survivalInstincts() then
                        return
                    end
                end
            end
            -- Barkskin
            if ui.checked("Barkskin") then
                if unit.hp() <= ui.value("Barkskin") and not buff.survivalInstincts.exists() then
                    if cast.barkskin() then
                        return
                    end
                end
            end
            -- Renewal
            if ui.checked("Renewal") and unit.hp() <= ui.value("Renewal") and not buff.frenziedRegeneration.exists() then
                if cast.renewal() then
                    return
                end
            end
            -- Ironfur
            if ui.checked("Ironfur") and bear 
                then
                if (buff.ironfur.stack() < ui.value("Ironfur") or ui.value("Ironfur") == 0) 
                then
                    if  buff.ironfur.remain() < 1  then
                    --and (hasAggro >= 2 or (ui.checked("Ironfur (No Aggro)") and not (hasAggro >= 1) and unit.hp() <= ui.value("Ironfur (No Aggro)")))
                        if cast.ironfur() then
                            br.addonDebug("Casting Iron Fur Stacks")
                            return
                        end
                    end
              
                end
            end
            -- Bristlingfur
            if mode.bristlingFur == 1 and rage().amount() < 40 and (hasAggro >= 2) then
                if cast.bristlingFur() then
                    return
                end
            end
            -- Frenzied Regeneration
            if
                ui.checked("Frenzied Regeneration") 
                and not buff.frenziedRegeneration.exists() 
               and ((charges.frenziedRegeneration.count() > 1 
               and unit.hp() < ui.value("FR - HP Interval (2 Charge)")) or (charges.frenziedRegeneration.count() >= 1 and unit.hp() < ui.value("FR - HP Interval (1 Charge)")))
             then
                if cast.frenziedRegeneration() then
                    return
                end
           end
            -- Auto Soothe
            if ui.checked("Auto Soothe") then
                for i = 1, #enemies.yards40 do
                    local thisUnit = enemies.yards40[i]
                    if br.canDispel(thisUnit, spell.soothe) then
                        if cast.soothe(thisUnit) then
                            return
                        end
                    end
                end
            end
            -- Remove Corruption
            if ui.checked("Remove Corruption") and ((mode.forms == 1 and ((mode.travel == 2 and travel) or (mode.travel == 1 and not travel))) or mode.forms ~= 1) then
                if ui.value("Remove Corruption - Target") == 1 and br.canDispel("player", spell.removeCorruption) then
                    if cast.removeCorruption("player") then
                        return
                    end
                end
                if ui.value("Remove Corruption - Target") == 2 and br.canDispel("target", spell.removeCorruption) then
                    if cast.removeCorruption("target") then
                        return
                    end
                end
                if ui.value("Remove Corruption - Target") == 3 and br.canDispel("mouseover", spell.removeCorruption) then
                    if cast.removeCorruption("mouseover") then
                        return
                    end
                end
            end
        end
    end
    -- Incap Logic
    local function actionList_Interrupts()
        if br.useInterrupts() then
            if ui.checked("Incapacitating Roar Logic (M+)") then
                if cast.able.incapacitatingRoar() then
                    local Incap_list = {
                        274400,
                        274383,
                        257756,
                        276292,
                        268273,
                        256897,
                        272542,
                        272888,
                        269266,
                        258317,
                        258864,
                        259711,
                        258917,
                        264038,
                        253239,
                        269931,
                        270084,
                        270482,
                        270506,
                        270507,
                        267433,
                        267354,
                        268702,
                        268846,
                        268865,
                        258908,
                        264574,
                        272659,
                        272655,
                        267237,
                        265568,
                        277567,
                        265540,
                        268202,
                        258058,
                        257739
                    }
                    for i = 1, #enemies.yards10 do
                        local thisUnit = enemies.yards10[i]
                        local distance = br.getDistance(thisUnit)
                        for _, v in pairs(Incap_list) do
                            if
                                (Incap_unitList[br.GetObjectID(thisUnit)] ~= nil or br._G.UnitCastingInfo(thisUnit) == br._G.GetSpellInfo(v) or
                                    br._G.UnitChannelInfo(thisUnit) == br._G.GetSpellInfo(v)) and
                                    br.getBuffRemain(thisUnit, 226510) == 0 and
                                    distance <= 20
                             then
                                if cast.incapacitatingRoar(thisUnit) then
                                    return
                                end
                                if br.player.race == "Tauren" and not moving then
                                    if br.castSpell("player", racial, false, false, false) then
                                        return
                                    end
                                end
                            end
                        end
                    end
                end
            end

            local radar = "off"

            --Building root list
            local root_UnitList = {}
            if ui.checked("KR - Root Minions of Zul") then
                root_UnitList[133943] = "minion-of-zul"
                radar = "on"
            end
            if ui.checked("All - Root the thing") then
                root_UnitList[161895] = "the thing from beyond"
                radar = "on"
            end
            if ui.checked("FH - Root grenadier") then
                root_UnitList[129758] = "grenadier"
                radar = "on"
            end
            if ui.checked("KR - Root Spirit of Gold") then
                root_UnitList[131009] = "the thing from beyond"
                radar = "on"
            end
            if ui.checked("KR - Animated gold") then
                root_UnitList[135406] = "animated gold"
                radar = "on"
            end
            if 1 == 2 then
                root_UnitList[143647] = "my little friend"
                radar = "on"
            end

            if radar == "on" then
                local root = "Entangling Roots"
                local root_range = 35
                if talent.massEntanglement and cast.able.massEntanglement then
                    root = "Mass Entanglement"
                    root_range = 30
                end

                for i = 1, br._G.GetObjectCount() do
                    local object = br._G.GetObjectWithIndex(i)
                    local ID = br._G.ObjectID(object)
                    if
                        root_UnitList[ID] ~= nil and br.getBuffRemain(object, 226510) == 0 and br.getHP(object) > 90 and not br.isLongTimeCCed(object) and
                            (br.getBuffRemain(object, 102359) < 2 or br.getBuffRemain(object, 339) < 2)
                     then
                        local x1, y1, z1 = br._G.ObjectPosition("player")
                        local x2, y2, z2 = br._G.ObjectPosition(object)
                        local distance = math.sqrt(((x2 - x1) ^ 2) + ((y2 - y1) ^ 2) + ((z2 - z1) ^ 2))
                        if distance <= 8 and talent.mightyBash then
                            br._G.CastSpellByName("Mighty Bash", object)
                            return true
                        end
                        if distance < root_range and not br.isLongTimeCCed(object) then
                            br._G.CastSpellByName(root, object)
                        end
                    end
                end -- end root
            end -- end radar
            -- Skull Bash

            if ui.checked("Skull Bash") and not cd.skullBash.exists() then
                for i = 1, #enemies.yards8f do
                    local thisUnit = enemies.yards8f[i]
                    if br.canInterrupt(thisUnit, ui.value("Interrupt At")) and br.timer:useTimer("Interrupt", 0.5) then
                        if cast.skullBash(thisUnit) then
                            return
                        end
                    end
                end
            end
            if ui.checked("Mighty Bash") and talent.mightyBash and (cd.skullBash.exists() or level < 70) then
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if br.canInterrupt(thisUnit, ui.value("Interrupt At")) and br.timer:useTimer("Interrupt", 0.5) then
                        if cast.mightyBash(thisUnit) then
                            return
                        end
                    end
                end
            end
            if ui.checked("Incapacitating Roar") and (cd.skullBash.exists() or level < 70) then
                for i = 1, #enemies.yards10 do
                    local thisUnit = enemies.yards10[i]
                    if br.canInterrupt(thisUnit, ui.value("Interrupt At")) and br.timer:useTimer("Interrupt", 0.5) then
                        if cast.incapacitatingRoar("player") then
                            return
                        end
                    end
                end
            end
        end
    end


    local function actionList_Bearmode()
        if (mode.forms == 1 and ((mode.travel == 2 and travel) or (mode.travel == 1 and not travel))) or mode.forms ~= 1 then
            if not bear and not buff.prowl.exists() and not cast.last.bearForm() then
                if cast.bearForm() then
                    return true
                end
            end
        end
        if bear then --print(rage())
            if mode.taunt == 1 and inInstance and combatTime > 5 then
                for i = 1, #enemies.yards30 do
                    local thisUnit = enemies.yards30[i]
                    if br._G.UnitThreatSituation("player", thisUnit) ~= nil and br._G.UnitThreatSituation("player", thisUnit) <= 2 and br._G.UnitAffectingCombat(thisUnit) then
                        if cast.growl(thisUnit) then
                            return
                        end
                    end
                end
            elseif mode.taunt == 2 and combatTime > 5 then
                for i = 1, #enemies.yards30 do
                    local thisUnit = enemies.yards30[i]
                    if br._G.UnitThreatSituation("player", thisUnit) ~= nil and br._G.UnitThreatSituation("player", thisUnit) <= 2 and br._G.UnitAffectingCombat(thisUnit) then
                        if cast.growl(thisUnit) then
                            return
                        end
                    end
                end
            end
            if ui.useCDs() and cast.able.rageOfTheSleeper() then
                if cast.rageOfTheSleeper()  then
                    ui.debug("Rage Of The Sleeper [Cds]")
                    return true
                end
            end
            -- Trinkets
            if (ui.value("Trinket Use") == 1 or (ui.value("Trinket Use") == 2 and br.useCDs())) then
                if ui.checked("Trinket 1") and (ui.value("Trinket Type") == 1 or (ui.value("Trinket Type") == 2 and unit.hp() <= ui.value("Trinket 1"))) and use.able.slot(13) then
                    use.slot(13)
                elseif ui.checked("Trinket 1") and (ui.value("Trinket Type") == 1 or (ui.value("Trinket Type") == 2 and unit.hp() <= ui.value("Trinket 1"))) and use.able.slot(14) then
                    use.slot(14)
                end
            end
            -- Racial
            if ui.checked("Racial") and (br.player.race == "Orc" or br.player.race == "Troll" or br.player.race == "BloodElf") and ui.useCDs() then
                if br.castSpell("player", racial, false, false, false) then
                    return
                end
            end
            -- Pulverize
            if talent.pulverize then
                for i = 1, #enemies.yards5 do
                    local thisUnit = enemies.yards5[i]
                    if debuff.thrashBear.stack(thisUnit) >= 3 then
                        if not cast.last.pulverize() then
                            if cast.pulverize(thisUnit) then
                                br.addonDebug("Casting Pulverize")
                                return
                            end
                        end
                    end
                end
            end
            -- Moonfire
            if talent.galacticGuardian and buff.galacticGuardian.remain() < 3 then
                for i = 1, #enemies.yards40 do
                    local thisUnit = enemies.yards40[i]
                    if not debuff.moonfire.exists(thisUnit) or (debuff.moonfire.remain(thisUnit) <= debuff.moonfire.duration(thisUnit) * 0.3) then
                        if cast.moonfire(thisUnit) then
                            br.addonDebug("Casting Moonfire (Refresh) Buff is about to go out")
                            return
                        end
                    end
                end
            end
            if cast.able.raze() and #enemies.yards8f > 1 and (not cast.able.mangle() or rage() > 80)  then
                if cast.raze() then
                    print(rage())
                    br.addonDebug("Casting Raze [Combat]")
                    return 
                end
            end
            -- Maul
            if mode.maul == 1 and #enemies.yards8 < 2 
                then
                if talent.toothAndClaw and buff.toothAndClaw.exists() and not debuff.toothAndClaw.exists("target") and rage() > 60 
                    then
                    if cast.maul() then
                        br.addonDebug("Casting Maul (Tooth and Claw)")
                        return
                    end
                end
                if  not buff.toothAndClaw.exists() and rage() > 60 and unit.hp() >= 75 
                    then
                    if cast.maul() then
                        br.addonDebug("Casting Maul")
                        return
                    end
                end
            end
            -- Ironfur so we dont overcap Rage
  --          if  rage() > 80 and (cast.able.mangle() or cast.able.thrash()) then
  --              cast.ironfur() 
   --             br.player.ui.debug("Casting IronFur To Avoid Cap Rage Manble/Thrash) ")
   --             return
    --        end 
            -- Thrash
            if cast.thrash() then
                br.addonDebug("Casting Thrash")
                return
            end
            -- Mangle
            if cast.able.mangle() and rage() > 80  then
                    cast.mangle() 
                    br.player.ui.debug("Casting  Mangle ")
                    return
            end  
            if cast.able.mangle() and rage() > 80 and buff.gore.exists() then
                    cast.mangle() 
                    br.player.ui.debug("Casting Mangle Gore Buff")
                return
            end           
            -- Mangle
            if cast.able.mangle() and rage() < 80 then
                if cast.mangle() then
                    br.player.ui.debug("Casting Mangle")
                    return
                end
            end
    
  --          print(unit.gcd(true))
  --          print(cd.mangle.remain())
  --          print(cd.thrash.remain())
            if cd.mangle.remain() > unit.gcd(true) and not buff.gore.exists() and rage() < 40 --and cd.thrash.remain() > unit.gcd(true)        
                then
                    -- Moonfire
                    if debuff.moonfire.count() < ui.value("Max Moonfire Targets") then
                        for i = 1, #enemies.yards40 do
                            local thisUnit = enemies.yards40[i]
                            if not debuff.moonfire.exists(thisUnit) or (debuff.moonfire.remain(thisUnit) <= debuff.moonfire.duration(thisUnit) * 0.3) then
                                if cast.moonfire(thisUnit) then
                                    br.addonDebug("Casting Moonfire (Refresh)")
                                    return
                                end
                            end
                        end
                    end
                    -- Swipe
                    if cast.swipe() then
                        br.addonDebug("Casting Swipe")
                        return
                    end
            end
            -- Start Attack
            if br.getDistance("target") < 5 then
                br._G.StartAttack()
            end
        end
    end

    -----------------
    --- Rotations ---
    -----------------
    -- Pause
    if br.pause() or mode.rotation == 2 then
        return
    else
        ---------------------------------
        --- Out Of Combat - Rotations ---
        ---------------------------------
        if not inCombat and not br.UnitBuffID("player", 115834) then
            if mode.forms == 2 and not br._G.GetCurrentKeyBoardFocus() then
                if br.SpecificToggle("Cat Key") then
                    cat_form()
                elseif br.SpecificToggle("Travel Key") then
                    travel_form()
                end
            end
            actionList_Extras()
            actionList_OOC()
        end -- End Out of Combat Rotation
        -----------------------------
        --- In Combat - Rotations ---
        -----------------------------
        if inCombat and not br.UnitBuffID("player", 115834) then
            if mode.forms == 2 then
                if br.SpecificToggle("Cat Key") and not br._G.GetCurrentKeyBoardFocus() and talent.feralAffinity then
                    cat_dps()
                    return
                elseif br.SpecificToggle("Cat Key") and not br._G.GetCurrentKeyBoardFocus() then
                    cat_form()
                    return
                elseif br.SpecificToggle("Travel Key") and not br._G.GetCurrentKeyBoardFocus() then
                    travel_form()
                    return
                end
            end
            actionList_Interrupts()
            actionList_Defensive()
            if ui.checked("Big Hit Oh Shit!") and br.SpecificToggle("Big Hit Oh Shit!") and not br._G.GetCurrentKeyBoardFocus() and bear then
                if br.timer:useTimer("Big Hit Delay", 2) then
                    actionList_BigHit()
                end
            end
            actionList_Bearmode()
        end
    end -- End In Combat Rotation
end -- End runRotation
local id = 104
br.rotations[id] = br.rotations[id] or {}
br._G.tinsert(br.rotations[id], {
    name = rotationName,
    toggles = createToggles,
    options = createOptions,
    run = runRotation,
})
