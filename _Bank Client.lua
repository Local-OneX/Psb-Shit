-- OneX Was Here

local _L = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
while not _L.Loaded do
	game:GetService('RunService').Heartbeat:Wait()
end

-- Main Variables
local BankGui = _L.GUI.Bank
local SettingsGui = BankGui.Container.Settings
local BottomGui = BankGui.Container.Bank.Bottom
local DebouceThing = false

-- Main Update Bank Function
function UpdateBank()
	local Bank = BankGui.Container.Bank
	local Balance = Bank.Bottom.Balance
	local Top = Bank.Top
	local Pets = Bank.Pets
	local function Process()
		
	end
	
end

-- Main Switch Windows
function SwitchWindow(Window) 
	if Window == 'Settings' then
		SwitchSettingsWindow('Info')
	end
	for a, b in ipairs(BankGui.Container:GetChildren()) do
		if b.ClassName == 'Frame' then
			b.Visible = b.Name == Window
		end
	end
	if Window ~= 'Empty' then
		
	else
		BankGui.BankTitle.Visible = false
		BankGui.Title.Visible = true
		return
	end
	BankGui.BankTitle.Tier.Text = 'Tier ' .. '1' .. ' Bank'
	coroutine.wrap(function()
		BankGui.BankTitle.Owner.Text = '@' .. game:GetService('Players').LocalPlayer.Name --_L.Functions.UserIdToUsername(game:GetService('Players').LocalPlayer.UserId) or '???'
	end)()
	BankGui.BankTitle.Visible = true
	BankGui.Title.Visible = false
end

-- Function Settings Switch Windows
function SwitchSettingsWindow(Window)
	for c, d in ipairs(SettingsGui:GetChildren()) do
		if d.ClassName ~= 'Frame' then
			if d.ClassName == 'ScrollingFrame' then
				d.Visible = Window == d.Name
			end
		else
			d.Visible = Window == d.Name
		end
	end
end

-- Update Setting Upgrades
function UpdateUpgrades()
	local UpgradesGui = SettingsGui.Upgrades
	local PlayerTierData = _L.Directory.Banks[1]
	local NextTierData = _L.Directory.Banks[1 + 1]
	local MaxTier = not NextTierData
	UpgradesGui.CostFrame.isMax.Visible = MaxTier
	UpgradesGui.CostFrame.Cost.Visible = not MaxTier
	UpgradesGui.CostFrame.Currency.Visible = not MaxTier
	UpgradesGui.Buttons.Visible = not MaxTier
	UpgradesGui.Info.Current.Tier.Text = 'Tier ' .. PlayerTierData.Tier
	UpgradesGui.Info.Current.Title.Text = PlayerTierData.Title
	if not MaxTier then
		UpgradesGui.Info.New.Tier.Text = 'Tier ' .. NextTierData.Tier
		UpgradesGui.Info.New.Title.Text = NextTierData.Title
		UpgradesGui.CostFrame.Cost.Text = _L.Functions.NumberShorten(NextTierData.Cost, false)
		if NextTierData.ProductId ~= 0 then
			UpgradesGui.Buttons.BuyRobux.Robux.Text = _L.Functions.Commas(_L.Functions.GetPrice(NextTierData.ProductId, true))
			UpgradesGui.Buttons.BuyRobux.Visible = true
		else
			UpgradesGui.Buttons.BuyRobux.Visible = false
		end
	else
		UpgradesGui.Info.New.Tier.Text = 'Max'
		UpgradesGui.Info.New.Title.Text = 'You have the best bank!'
	end
	for e, f in ipairs(UpgradesGui.Stats:GetChildren()) do
		if f.ClassName == 'Frame' then
			if f.Name == 'MaxDiamonds' then
				f.Old.Amount.Text = _L.Functions.NumberShorten(PlayerTierData.MaxDiamonds, false) .. ' Cap'
				local text1
				if MaxTier then
					text1 = 'Max'
				else
					text1 = _L.Functions.NumberShorten(NextTierData.MaxDiamonds, false) .. ' Cap'
				end
				f.New.Amount.Text = text1
			elseif f.Name == 'Interest' then
				local text2
				if PlayerTierData.Interest == 0 then
					text2 = 'None'
				else
					text2 = PlayerTierData.Interest .. '%'
				end
				f.Old.Amount.Text = text2
				local text3
				if MaxTier then
					text3 = 'Max'
				else
					text3 = NextTierData.Interest .. '%'
				end
				f.New.Amount.Text = text3
			elseif f.Name == 'MaxPlayers' then
				f.Old.Amount.Text = PlayerTierData.MaxPlayers .. ' Players'
				local text4
				if MaxTier then
					text4 = 'Max'
				else
					text4 = NextTierData.MaxPlayers .. ' Players'
				end
				f.New.Amount.Text = text4
			elseif f.Name == 'PetSlots' then
				f.Old.Amount.Text = PlayerTierData.PetSlots .. ' Pets'
				local text5
				if MaxTier then
					text5 = 'Max'
				else
					text5 = NextTierData.PetSlots .. ' Pets'
				end
				f.New.Amount.Text = text5
			end
		end	
	end
end

-- Bank Interest
function CollectInterest()
	_L.Message.New("This is temporarily disabled!");
end;

-- Update Settings
function UpdateSettings()
	UpdateUpgrades()
	SwitchWindow('Settings')
end

-- Reset Everything
function Reset()
	BankGui.Deposit.Visible = false
	SwitchWindow('Bank')
end

-- Button Commands
_L.GUIFX.ButtonFX(BankGui.Close)
BankGui.Close.Activated:Connect(function()
	BankGui.Gui.Enabled = false
end)

_L.GUIFX.ButtonFX(BottomGui.Settings)
_L.GUIFX.Tooltip(BottomGui.Settings, 'Settings')
BottomGui.Settings.Activated:Connect(function()
	if not DebouceThing then
		DebouceThing = true
		UpdateSettings()
		DebouceThing = false
	end
end)

_L.GUIFX.ButtonFX(SettingsGui.Back)
SettingsGui.Back.Activated:Connect(function()
	if not DebouceThing then
		DebouceThing = true
		if not SettingsGui.Info.Visible then
			SwitchSettingsWindow('Info')
		else
			SwitchWindow('Bank')
		end
		DebouceThing = false
	end
end)

_L.GUIFX.ContentScale(SettingsGui.Info)
_L.GUIFX.ContentScale(SettingsGui.Upgrades)
_L.GUIFX.ContentScale(SettingsGui.Members)
_L.GUIFX.ContentScale(SettingsGui.History)
for g, h in ipairs(SettingsGui.Info:GetChildren()) do
	local Button = h:FindFirstChild('Button')
	if h.ClassName == 'Frame' and Button then
		_L.GUIFX.ButtonFX(Button)
		Button.Activated:Connect(function()
			if not DebouceThing then
				DebouceThing = true
				if h.Name == 'Interest' then
					CollectInterest()
				else
					SwitchSettingsWindow(h.Name)
				end
				DebouceThing = false
			end
		end)
	end
end

-- Pad Gui Setting Things
local function PadGui()
	local WorldCmds = _L.WorldCmds.GetMap()
	if workspace:FindFirstChild('Interactive') then
		if not WorldCmds.Interactive:FindFirstChild('Bank') then
			return
		end
	else
		return
	end
	local Audio = _L.Audio.Play('rbxassetid://8168486040', WorldCmds.Interactive:FindFirstChild('Bank').PrimaryPart, 1, 0.15, nil, nil, true)
	Audio.RollOffMaxDistance = 90
	Audio.RollOffMinDistance = 35
end

-- IMPORTANT THINGYS
_L.Signal.Fired('World Changed'):Connect(function()
	PadGui()
end)

_L.Signal.Fired('Window Closed'):Connect(function(Window)
	if Window == BankGui.Gui then
		_L.Variables.BankOpen = false
		Reset()
	end
end)