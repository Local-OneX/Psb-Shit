-- OneX Was Here 
warn("Bee Games Is Cool!")
 
-- OneX WAS HERE LOL

local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"));
while not v1.Loaded do
	game:GetService("RunService").Heartbeat:Wait();
end;
function Travel()
	if v1.Shared.IsHardcoreUnlocked == true then
	if v1.Message.New("Are you sure you want to enter Hardcore mode? Your won't lose any progress.", true) then
		v1.WorldCmds.Load("SpawnHC");
		end;
	 else
	 	v1.Message.New("You must have 25% of the Mastery complete to unlock Hardcore Mode.")
	end
 end;
local u1 = nil;
function OpenPortal()
	local l__CENTER__2 = u1:FindFirstChild("CENTER");
	v1.Audio.Play(8803688837, l__CENTER__2, 1, 1.5, 500);
	v1.Functions.FastTween(l__CENTER__2, {
		Color = Color3.new(0.75, 0.75, 0.75)
	}, { 1, "Expo", "Out" }).Completed:Wait();
	while true do
		if u1 then

		else
			break;
		end;
		if u1.Parent then

		else
			break;
		end;
		v1.Functions.FastTween(l__CENTER__2, {
			Color = Color3.new(0.8, 0.8, 0.8)
		}, { 1.5, "Sine", "InOut" }).Completed:Wait();
		v1.Functions.FastTween(l__CENTER__2, {
			Color = Color3.new(0.65098, 0.592157, 0.690196)
		}, { 2, "Sine", "InOut" }).Completed:Wait();
		v1.RenderStepped();	
	end;
end;
 
function Clicked()
	if v1.Save.Get().HackerPortalUnlocked then
		Travel();
		return;
	end;
end;
local u2 = false;
function Setup()
	local v10, v11 = v1.Interact.Add(u1:FindFirstChild("Door").CFrame.p, {
		dist = 18
	});
	v10:Connect(function()
		if not u2 then
			u2 = true;
			Clicked();
			u2 = false;
		end;
	end);
	if v1.Save.Get().HackerPortalUnlocked then
		OpenPortal();
	end;
end;
function Check()
	local v12 = v1.WorldCmds.GetMap();
	if v12:FindFirstChild("Interactive") then
		u1 = v12.Interactive:FindFirstChild("Hardcore Portal");
		if u1 then

		else
			return;
		end;
	else
		return;
	end;
	Setup();
end;
v1.Signal.Fired("World Changed"):Connect(function()
	Check();
end);
 
 

--[[local v1 = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Libary"));
local v2
while not v1.Loaded do
	game:GetService("RunService").Heartbeat:Wait();
end
function Request()
	if not v1.WorldCmds.CanDoAction() then
		return;
	end
	if not v1.Save.Get() then
		return;
	end
	if v1.Shared.IsHardcore then
		local v2 = "Return back to normal mode?";
	else
		v2 = "Are you sure you want to enter Hardcore mode? Your won't lose any progress."
	end;
	if not v1.Message.New(v2, true) then
		return;
	end;
	v1.Variables.LoadingWorld = true;
	local v3, v4 = v1.Network.Invote("Toggle Hardcore Mode")
	if v3 then
		
	else
		v1.Variables.LoadingWorld = false;
		v1.Message.New(v4 and "Failed to enter Hardcore Mode.")
		return;
	end;
	if v1.Shared.IsHardcore then
		v1.GUIFX.Loading("Normal Mode")
		return;
	end;
	v1.GUIFX.Loading("Hardcore Mode")
end;

local u1 = nil;
local u2 = nil;
local u3 = nil;
local u4 = false;

function Setup()
	local v5, v6 = v1.Interact.Add(u3, {
	dist = 18	
	})
--	u1 = v5;
	--u2 = v6;
	u1:Connect(function()
		if not u4 then
			u4 = true
			--local v7 = v1.Save.Get();
			--if v7 then
				--if v7.HardcoreUnlocked then
					Request();
				--else
				--	v1.Message.New("You must have 25% of the Mastery complete to unlock Hardcore Mode.")
				--end;
			--end;
			u4 = false;
		end;
	end);
end;

function Check()
	local v8 = v1.WorldCmds.GetMap();
	if v8:FindFirstChild("Interactive") then
		u3 = v8.Interactive:FindFirstChild("Hardcore Portal");
		if u3 then
			Setup();
		end;
	end;
end;

v1.Signal.Fired("World Changed"):Connect(function()
	if u2 then
		u2();
		u2 = nil
	end;
	Check();
end);

 ]]