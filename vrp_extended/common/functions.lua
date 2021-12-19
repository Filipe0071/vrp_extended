local Charset = {}

for i = 48, 57 do
	table.insert(Charset, string.char(i))
end

for i = 65, 90 do
	table.insert(Charset, string.char(i))
end

for i = 97, 122 do
	table.insert(Charset, string.char(i))
end

vRPEXT.GetRandomString = function(length)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return vRPEXT.GetRandomString(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ""
	end
end

vRPEXT.GetConfig = function()
	return Config
end

vRPEXT.DumpTable = function(table, nb)
	if nb == nil then
		nb = 0
	end
	if type(table) == "table" then
		local s = ""
		for i = 1, nb + 1, 1 do
			s = s .. "    "
		end
		s = "{\n"
		for k,v in pairs(table) do
			if type(k) ~= "number" then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. "["..k.."] = " .. vRPEXT.DumpTable(v, nb + 1) .. ",\n"
		end
		for i = 1, nb, 1 do
			s = s .. ""
		end
		return s .. "}"
	else
		return tostring(table)
	end
end

vRPEXT.Round = function(value, numDecimalPlaces)
	return vRPEXT.Math.Round(value, numDecimalPlaces)
end