if select(3, UnitClass("player")) == 1 then

    function WarriorArmsToggles()
        if GetSpecialization() == 1 then

            if AoEModesLoaded ~= "Rotation Mode" then
              CustomAoEModes = {
                [1] = { mode = "Auto", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 0, icon = _SweepingStrikes },
                [2] = { mode = "Mult", value = 2 , overlay = "Multiple Target Rotation", tip = "Multiple target rotation used.", highlight = 0, icon = _Whirlwind },
                [3] = { mode = "Sing", value = 3 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = _MortalStrike }
              };
              AoEModes = CustomAoEModes
              CreateButton("AoE",1,0)
              AoEModesLoaded = "Rotation Mode";
            end

            -- Cooldowns Button
            if CooldownsModesLoaded ~= "Cooldown Mode" then
              CustomCooldownsModes = {
                [1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = _Recklessness },
                [2] = { mode = "On", value = 2 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = _Recklessness },
                [3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = _Recklessness }
              };
              CooldownsModes = CustomCooldownsModes
              CreateButton("Cooldowns",2,0)
              CooldownsModesLoaded = "Cooldown Mode";
            end

            -- Defensive Button
            if DefensiveModesLoaded ~= "Defensive Mode" then
              CustomDefensiveModes = {
                [1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = _DiebytheSword },
                [2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = _DiebytheSword }
              };
              DefensiveModes = CustomDefensiveModes
              CreateButton("Defensive",3,0)
              DefensiveModesLoaded = "Defensive Mode";
            end

            -- Interrupts Button
            if InterruptsModesLoaded ~= "Interrupt Mode" then
              CustomInterruptsModes = {
                [1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = _Pummel },
                [2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = _Pummel }
              };
              InterruptsModes = CustomInterruptsModes
              CreateButton("Interrupts",4,0)
              InterruptsModesLoaded = "Interrupt Mode";
            end

            function SpecificToggle(toggle)
                if getOptionValue(toggle) == 1 then
                    return IsLeftControlKeyDown();
                elseif getOptionValue(toggle) == 2 then
                    return IsLeftShiftKeyDown();
                elseif getOptionValue(toggle) == 3 then
                    return IsRightControlKeyDown();
                elseif getOptionValue(toggle) == 4 then
                    return IsRightShiftKeyDown();
                elseif getOptionValue(toggle) == 5 then
                    return IsRightAltKeyDown();
                elseif getOptionValue(toggle) == 6 then
                    return false
                end
            end

                --AoE Key Toggle
            if AOETimer == nil then AOETimer = 0; end
            if SpecificToggle("Rotation Mode") and not GetCurrentKeyBoardFocus() and GetTime() - AOETimer > 0.25 then
                AOETimer = GetTime()
                UpdateButton("AoE")
            end

            --Cooldown Key Toggle
            if CDTimer == nil then CDTimer = 0; end
            if SpecificToggle("Cooldown Mode") and not GetCurrentKeyBoardFocus() and GetTime() - CDTimer > 0.25 then
                CDTimer = GetTime()
                UpdateButton("Cooldowns")
            end

            --Defensive Key Toggle
            if DefTimer == nil then DefTimer = 0; end
            if SpecificToggle("Defensive Mode") and not GetCurrentKeyBoardFocus() and GetTime() - DefTimer > 0.25 then
                DefTimer = GetTime()
                UpdateButton("Defensive")
            end

            --Interrupt Key Toggle
            if IntTimer == nil then IntTimer = 0; end
            if SpecificToggle("Interrupt Mode") and not GetCurrentKeyBoardFocus() and GetTime() - IntTimer > 0.25 then
                IntTimer = GetTime()
                UpdateButton("Interrupts")
            end
        end
    end
end
