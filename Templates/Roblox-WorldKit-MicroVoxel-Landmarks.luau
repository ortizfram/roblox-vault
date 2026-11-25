-- TEMPLATE (roblox-vault, 2026-11-25). Copied from STOMPIES_GAME (SAVE RARE ANIMALS!): original code of the
-- owner's project. See Playbooks/Roblox-World-Building-Macro-Landmarks-2026-11-25.md. Adapt Palettes, Budget and
-- landmarkFor() to the new game; keep the rules: own geometry, hard part budget, no collisions, seed = same landmark.
-- SAVE RARE ANIMALS! · WorldKit (owner 2026-11-25). Original micro-voxel LANDMARKS made of Parts.
-- Method: the roblox-world-builder skill (github.com/benigeci/roblox-world-builder, MIT, commit 301b66d; installed in
-- .claude/skills/roblox-world-builder). Its diagnosis of these maps: the meso and micro scales exist (road props, fences,
-- plaza) but the MACRO scale is missing - nothing to read from far away, a flat sea to the horizon. So this kit only
-- builds big silhouettes: stepped masses -> stepped secondary forms -> a few cubic accents, 3-5 tones per material.
--  * Nothing is a model from somebody else: every piece is boxes placed by this code from a seed.
--  * Skyline only: anchored, nothing to collide with, touch or query; small pieces cast no shadow. A hard part budget
--    per landmark (Budget.macro) keeps phones safe.
--  * Same seed -> same landmark. WorldKitTest.
local WK = {}

WK.Budget = { macro = 44 }
-- where the run's landmarks stand: studs from the road's centre, and studs of road between two of them
WK.Run = { offMin = 72, offMax = 118, everyMin = 170, everyMax = 260, heightMin = 46, heightMax = 92 }

local rgb = Color3.fromRGB
WK.Palettes = {
	rock = { mat = Enum.Material.Slate, tones = { rgb(86, 92, 110), rgb(104, 110, 128), rgb(70, 76, 94), rgb(124, 128, 142) }, accent = rgb(150, 220, 120), accentMat = Enum.Material.Grass },
	sea = { mat = Enum.Material.Slate, tones = { rgb(92, 104, 124), rgb(112, 122, 140), rgb(74, 86, 106), rgb(136, 142, 152) }, accent = rgb(120, 200, 110), accentMat = Enum.Material.Grass },
	ice = { mat = Enum.Material.Ice, tones = { rgb(170, 220, 255), rgb(200, 236, 255), rgb(132, 190, 240), rgb(232, 248, 255) }, accent = rgb(255, 255, 255), accentMat = Enum.Material.Snow },
	ruin = { mat = Enum.Material.Cobblestone, tones = { rgb(150, 142, 126), rgb(170, 162, 146), rgb(126, 118, 104), rgb(190, 184, 170) }, accent = rgb(96, 150, 84), accentMat = Enum.Material.Grass },
	swamp = { mat = Enum.Material.Slate, tones = { rgb(78, 92, 74), rgb(96, 108, 86), rgb(62, 74, 60), rgb(112, 122, 96) }, accent = rgb(150, 110, 200), accentMat = Enum.Material.Neon },
	bark = { mat = Enum.Material.Wood, tones = { rgb(96, 66, 44), rgb(112, 78, 52), rgb(80, 54, 36) } },
	leaf = { mat = Enum.Material.Grass, tones = { rgb(52, 132, 96), rgb(66, 152, 108), rgb(40, 110, 84), rgb(84, 170, 120) } },
}

local function builder(seed: number)
	local m = Instance.new("Model")
	local rng = Random.new(seed)
	local n = 0
	local function box(size: Vector3, pos: Vector3, color: Color3, mat: Enum.Material, yawDeg: number?)
		if n >= WK.Budget.macro then
			return nil
		end
		n += 1
		local p = Instance.new("Part")
		p.Anchored, p.CanCollide, p.CanTouch, p.CanQuery = true, false, false, false
		p.TopSurface, p.BottomSurface = Enum.SurfaceType.Smooth, Enum.SurfaceType.Smooth
		p.CastShadow = math.max(size.X, size.Y, size.Z) >= 10
		p.Size = size
		p.CFrame = CFrame.new(pos) * CFrame.Angles(0, math.rad(yawDeg or 0), 0)
		p.Color = color
		p.Material = mat
		p.Parent = m
		return p
	end
	return m, rng, box
end

local function tone(pal, rng: Random): Color3
	return pal.tones[rng:NextInteger(1, #pal.tones)]
end

-- a stepped rock: big blocky mass, offset ledges, cubic chips at the edges, a green or snowy cap
local function spire(seed: number, H: number, pal)
	local m, rng, box = builder(seed)
	local levels = rng:NextInteger(6, 8)
	local W = H * rng:NextNumber(0.34, 0.46)
	local y, cx, cz = 0, 0, 0
	for i = 1, levels do
		local k = (i - 1) / (levels - 1)
		local h = H / levels * rng:NextNumber(0.9, 1.1)
		if i == levels then
			h = H - y
		end
		local w = W * (1 - k * 0.72) * rng:NextNumber(0.9, 1.08)
		local d = w * rng:NextNumber(0.8, 1.1)
		cx += rng:NextNumber(-1, 1) * W * 0.07
		cz += rng:NextNumber(-1, 1) * W * 0.07
		box(Vector3.new(w, h, d), Vector3.new(cx, y + h / 2, cz), tone(pal, rng), pal.mat, rng:NextInteger(0, 1) * 90)
		-- a ledge on two of every three levels: the stepped secondary form
		if i < levels and rng:NextNumber() < 0.7 then
			local side = rng:NextInteger(0, 3) * 90
			local off = CFrame.Angles(0, math.rad(side), 0) * Vector3.new(w * 0.42, 0, 0)
			local lw = w * rng:NextNumber(0.34, 0.5)
			box(Vector3.new(lw, h * rng:NextNumber(0.35, 0.6), lw), Vector3.new(cx + off.X, y + h * 0.3, cz + off.Z), tone(pal, rng), pal.mat)
		end
		y += h
	end
	-- cap + chips: the small cubic accents, only at the top and the foot
	box(Vector3.new(W * 0.26, H * 0.035, W * 0.24), Vector3.new(cx, H - H * 0.017, cz), pal.accent, pal.accentMat)
	for _ = 1, rng:NextInteger(4, 6) do
		local a = rng:NextNumber(0, math.pi * 2)
		local s = W * rng:NextNumber(0.1, 0.2)
		box(Vector3.new(s, s, s), Vector3.new(math.cos(a) * W * 0.62, s / 2, math.sin(a) * W * 0.62), tone(pal, rng), pal.mat, rng:NextInteger(0, 3) * 15)
	end
	return m
end

-- a giant blocky tree: flared roots, tapering trunk, a stepped canopy of big leaf blocks
local function giantTree(seed: number, H: number)
	local m, rng, box = builder(seed)
	local bark, leaf = WK.Palettes.bark, WK.Palettes.leaf
	local tw = H * 0.13
	for i = 0, 3 do
		local off = CFrame.Angles(0, math.rad(i * 90 + 45), 0) * Vector3.new(tw * 0.8, 0, 0)
		box(Vector3.new(tw * 0.7, H * 0.09, tw * 0.7), Vector3.new(off.X, H * 0.045, off.Z), tone(bark, rng), bark.mat, 45)
	end
	local y, trunkTop = 0, H * 0.58
	for i = 1, 4 do
		local h = trunkTop / 4
		local w = tw * (1 - (i - 1) * 0.14)
		box(Vector3.new(w, h, w), Vector3.new(rng:NextNumber(-0.4, 0.4), y + h / 2, rng:NextNumber(-0.4, 0.4)), tone(bark, rng), bark.mat)
		y += h
	end
	-- canopy: one core block reaching the full height, lobes around and below it, small leaf cubes on the rim
	local cw = H * rng:NextNumber(0.34, 0.42)
	local coreH = H - trunkTop + H * 0.06
	box(Vector3.new(cw, coreH, cw), Vector3.new(0, H - coreH / 2, 0), tone(leaf, rng), leaf.mat)
	for i = 1, rng:NextInteger(5, 7) do
		local a = (i / 6) * math.pi * 2 + rng:NextNumber(-0.3, 0.3)
		local r = cw * rng:NextNumber(0.5, 0.72)
		local s = cw * rng:NextNumber(0.42, 0.66)
		local yy = trunkTop + rng:NextNumber(0.02, 0.26) * H
		box(Vector3.new(s, s * rng:NextNumber(0.6, 0.85), s), Vector3.new(math.cos(a) * r, math.min(yy, H - s * 0.4), math.sin(a) * r), tone(leaf, rng), leaf.mat, rng:NextInteger(0, 1) * 45)
	end
	for _ = 1, rng:NextInteger(5, 7) do
		local a = rng:NextNumber(0, math.pi * 2)
		local s = cw * rng:NextNumber(0.12, 0.2)
		box(Vector3.new(s, s, s), Vector3.new(math.cos(a) * cw * 0.95, trunkTop + rng:NextNumber(0, 0.3) * H, math.sin(a) * cw * 0.95), tone(leaf, rng), leaf.mat)
	end
	return m
end

-- a ruin: two broken columns of stacked drums, a fallen lintel, rubble, moss
local function ruin(seed: number, H: number)
	local m, rng, box = builder(seed)
	local pal = WK.Palettes.ruin
	local cw = H * 0.16
	local gap = H * 0.34
	for sIdx, sx in ipairs({ -1, 1 }) do
		local colH = (sIdx == 1) and H or H * rng:NextNumber(0.5, 0.72) -- one stands whole, the other is broken
		box(Vector3.new(cw * 1.5, H * 0.06, cw * 1.5), Vector3.new(sx * gap, H * 0.03, 0), tone(pal, rng), pal.mat)
		local drums = (sIdx == 1) and 6 or 4
		local y = H * 0.06
		for i = 1, drums do
			local h = (colH - H * 0.06) / drums
			local w = cw * ((i % 2 == 0) and 0.9 or 1)
			box(Vector3.new(w, h, w), Vector3.new(sx * gap + rng:NextNumber(-0.3, 0.3), y + h / 2, rng:NextNumber(-0.3, 0.3)), tone(pal, rng), pal.mat)
			y += h
		end
		if sIdx == 1 then
			box(Vector3.new(cw * 1.4, H * 0.05, cw * 1.4), Vector3.new(sx * gap, H - H * 0.025, 0), tone(pal, rng), pal.mat) -- capital, at the very top
		end
	end
	-- the fallen lintel leaning on the broken column, rubble around, moss on the bases
	local lin = box(Vector3.new(gap * 1.5, cw * 0.7, cw * 0.9), Vector3.new(gap * 0.2, H * 0.3, cw * 0.4), tone(pal, rng), pal.mat)
	if lin then
		lin.CFrame = CFrame.new(gap * 0.2, H * 0.28, cw * 0.4) * CFrame.Angles(0, 0, math.rad(-24))
	end
	for _ = 1, rng:NextInteger(6, 8) do
		local s = cw * rng:NextNumber(0.3, 0.6)
		box(Vector3.new(s, s, s), Vector3.new(rng:NextNumber(-1.4, 1.4) * gap, s / 2, rng:NextNumber(-0.9, 0.9) * gap), tone(pal, rng), pal.mat, rng:NextInteger(0, 3) * 20)
	end
	for _, sx in ipairs({ -1, 1 }) do
		box(Vector3.new(cw * 1.1, H * 0.02, cw * 0.8), Vector3.new(sx * gap + cw * 0.3, H * 0.07, cw * 0.5), pal.accent, pal.accentMat)
	end
	return m
end

-- kind = "spire" | "giantTree" | "iceSpire" | "ruin"; opts.height (studs), opts.palette (a key of Palettes, spires only)
function WK.build(kind: string, seed: number, opts): Model
	local H = (opts and opts.height) or 60
	local m
	if kind == "spire" then
		m = spire(seed, H, WK.Palettes[(opts and opts.palette) or "rock"] or WK.Palettes.rock)
	elseif kind == "iceSpire" then
		m = spire(seed, H, WK.Palettes.ice)
	elseif kind == "giantTree" then
		m = giantTree(seed, H)
	elseif kind == "ruin" then
		m = ruin(seed, H)
	else
		error("WorldKit: unknown landmark kind " .. tostring(kind))
	end
	m.Name = "WK_" .. kind
	m.WorldPivot = CFrame.new(0, 0, 0)
	return m
end

-- the landmark of a run biome, by the material of its floor (RunnerConfig biomes); nil = none (Sky, unknown)
-- (measured in Play: the blocky giant tree clashed with the game's own rounded roadside trees, so the forest gets rock too;
-- "giantTree" stays in the kit for a project whose trees are voxel)
local BY_FLOOR = { Slate = "spire", Mud = "spire", Snow = "iceSpire", Cobblestone = "ruin" }
local PALETTE_BY_FLOOR = { Slate = "rock", Mud = "swamp" }
function WK.landmarkFor(floorMaterialName: string?): (string?, string?)
	if type(floorMaterialName) ~= "string" then
		return nil, nil
	end
	return BY_FLOOR[floorMaterialName], PALETTE_BY_FLOOR[floorMaterialName]
end

-- a composed ring of n landmarks around a round place: radii rMin..rMax, never inside the open view (degrees), never
-- closer than minGap degrees, heights spread on purpose. Returns { { deg, r, height, kind, seed } }.
function WK.ring(n: number, rMin: number, rMax: number, seed: number, opts)
	local rng = Random.new(seed)
	local open = opts and opts.open
	local minGap = (opts and opts.minGap) or 15
	local out = {}
	local tries = 0
	while #out < n and tries < 4000 do
		tries += 1
		local deg = rng:NextNumber(-180, 180)
		local ok = not (open and deg > open.from and deg < open.to)
		for _, it in ipairs(out) do
			if math.abs(((deg - it.deg + 180) % 360) - 180) < minGap then
				ok = false
				break
			end
		end
		if ok then
			local i = #out + 1
			-- every third piece is a tall one, the rest are low and mid: a skyline with a rhythm, not a fence
			local height = (i % 3 == 1) and rng:NextNumber(96, 128) or rng:NextNumber(46, 74)
			table.insert(out, { deg = deg, r = rng:NextNumber(rMin, rMax), height = height, kind = "spire", seed = seed * 31 + i })
		end
	end
	return out
end

return WK
