local game = gg.getTargetInfo()
local x64 = game.x64
local info = gg.getTargetInfo()
if not info then
gg.alert("⚠️ Run inside a game process!")
os.exit()
end
local ARCH = info.x64 and "arm64" or "arm32"
gg.toast("✅ Architecture Detected: " .. ARCH)
local cfg = loadfile(gg.EXT_CACHE_DIR .. '/' .. gg.getFile():match('[^/]+$'))
cfg = cfg and cfg().version == version and cfg() or {-77, 47, false, false}
credit = "REX Modder Lua"		
local Key = "https://t.me/ShivaRebornx \n 𝕮𝖔𝖓𝖙𝖆𝖈𝖙 𝖓𝖔 : 𝟵𝟰𝟵𝟲𝟵𝟯𝟰𝟵𝟯𝟲"
local GetKey = "https://yeumoney.com/AICzPy"
local API = "https://anotepad.com/notes/4ctr9s8k"
local savedKeyFile = "saved_key.txt"   
function ReadSavedKey()
local file = io.open(savedKeyFile, "r")
if file then
local savedKey = file:read("*a")
file:close()
return savedKey
end
return nil
end 
function SaveKey(key)
local file = io.open(savedKeyFile, "w")
if file then
file:write(key)
file:close()
gg.toast("Key saved successfully!")
end
end   
function DeleteKey()
os.remove(savedKeyFile)
gg.toast("Key deleted!")
end    
local GetData = (gg.makeRequest(API).content)
if not GetData then
gg.alert("ɴᴏ ɪɴᴛᴇʀɴᴇᴛ ᴄᴏɴɴᴇᴄᴛɪᴏɴ⚠️")
return
end   
KeyOnline = string.match(GetData, "Key:%s*([%w%d]+)")
ExpireDate = string.match(GetData, "ExpireDate:%s*(%d%d%d%d%-%d%d%-%d%d)")    
print("Key:", Key)
print("Expire Date:", ExpireDate)
if KeyOnline == nil then
gg.alert("⚠️█▓▒▒░░░ꜰᴏʀ ᴍᴀɪɴᴛᴇɴᴀɴᴄᴇ░░░▒▒▓█ ⚠️")
return
end
if ExpireDate == nil then
gg.alert("ᴇʀʀᴏʀ ꜰᴇᴛᴄʜɪɴɢ ᴇxᴘɪʀᴇ ᴅᴀᴛᴇ! ᴄʜᴇᴄᴋ ᴛʜᴇ ꜰᴏʀᴍᴀᴛ ɪɴ ᴛʜᴇ ᴘᴀɢᴇ ɴᴏᴛᴇ⚠️")
return
end    
local CurrentDate = os.date("%Y-%m-%d")
if CurrentDate > ExpireDate then
gg.alert("𝐒𝐂𝐑𝐈𝐏𝐓 𝐇𝐀𝐒 𝐄𝐗𝐏𝐈𝐑𝐄𝐃!\n𝐔𝐏𝐃𝐀𝐓𝐄 𝐒𝐎𝐎𝐍❤️‍🔥\n𝐂𝐎𝐍𝐓𝐀𝐂𝐓 𝐃𝐄𝐕𝐄𝐋𝐎𝐏𝐄𝐑: @ShivaRebornx  \n𝐄𝐗𝐏𝐈𝐑𝐄 𝐃𝐀𝐓𝐄: " .. ExpireDate)
os.exit()
end   
local savedKey = ReadSavedKey()
if savedKey and savedKey == KeyOnline then
gg.toast("Auto Login Success!\nExpire Date: " .. ExpireDate)
else
local Pastek = gg.prompt({"🔑ᴇɴᴛᴇʀ ᴋᴇʏ"}, nil, {"text"})
if Pastek == nil or Pastek[1] == "" then
gg.alert("ʏᴏᴜ ᴍᴜꜱᴛ ᴇɴᴛᴇʀ ᴀ ᴋᴇʏ⚠️")
return
end   
if Pastek[1] ~= KeyOnline then
local choice = gg.choice({"🔗ᴄᴏᴘʏ ʟɪɴᴋ", "ᴏᴋ✅"}, nil, "💢ᴘᴀꜱꜱᴡᴏʀᴅ ᴡʀᴏɴɢ!\n🔑ɢᴇᴛ ᴋᴇʏ ʜᴇʀᴇ:\n"..Key)
if choice == 1 then
gg.copyText(Key)
gg.toast("ʟɪɴᴋ ᴄᴏᴘɪᴇᴅ ᴛᴏ ᴄʟɪᴘʙᴏᴀʀᴅ!📋")
end
return
else      
local saveChoice = gg.choice({"🔐ꜱᴀᴠᴇ ᴋᴇʏ", "💢ᴅᴏ ɴᴏᴛ ꜱᴀᴠᴇ"}, nil, "ʟᴏɢɪɴ ꜱᴜᴄᴄᴇꜱꜱꜰᴜʟ!\nᴅᴏ ʏᴏᴜ ᴡᴀɴᴛ ᴛᴏ ꜱᴀᴠᴇ ᴛʜɪꜱ ᴋᴇʏ ꜰᴏʀ ɴᴇxᴛ ᴛɪᴍᴇ?📁")
if saveChoice == 1 then
SaveKey(Pastek[1])
end
end
end    
if gg.choice({"ᴅᴇʟᴇᴛᴇ ꜱᴀᴠᴇᴅ ᴋᴇʏ🔑", "ᴄᴏɴᴛɪɴᴜᴇ✅"}, nil, "ᴍᴀɴᴀɢᴇ ꜱᴀᴠᴇᴅ ᴋᴇʏ📁") == 1 then
DeleteKey()
end   
local SaveOFF = {}
local function hex2tbl(hex)
local ret = {}
hex:gsub('%S%S', function(ch)
ret[#ret + 1] = ch
return ''
end)
return ret
end
local function getValues(lib, address, length)
local values = {}
for i = 1, length do
values[i] = {
address = lib + address + i - 1,
flags = gg.TYPE_BYTE
}
end
return gg.getValues(values)
end
local function setValues(lib, address, values)
local set = {}
for i = 1, #values do
set[i] = {
address = lib + address + i - 1,
value = values[i],
flags = gg.TYPE_BYTE
}
end
gg.setValues(set)
gg.clearResults()
end
function SetValue(a, b, c)
local set = {}
local lib = gg.getRangesList(a)[1].start
local Hex = hex2tbl(c)
local V = {}
for i = 1, #Hex do
V[i] = tonumber(Hex[i], 16)
if V[i] > 127 then
V[i] = V[i] - 256
end
end
if not SaveOFF[b] then
local Z = {}
for i = 1, #Hex do
Z[i] = {
address = lib + b + i - 1,
flags = gg.TYPE_BYTE
}
end
SaveOFF[b] = gg.getValues(Z)
end
local R = getValues(lib, b, #Hex)
if R[1].value == V[1] and R[3].value == V[3] then
gg.setValues(SaveOFF[b])
else
setValues(lib, b, V)
end
end
local hello = gg.alert("🌐═══════════════════════════🌐\n\t\t\t💢━━━━━━━━━━━━━━━━━━━━━━━💢\n\t\t\t💀 𝐑𝐞𝐱 𝕷𝖚𝖆 𝕮𝖔𝖒𝖒𝖚𝖓𝖎𝖙𝐲 𝐏𝖆𝖎𝖉 𝕮𝖑𝖎𝖊𝖓𝖙 𝕾𝖈𝖗𝖎𝖕𝖙  💀\n\t\t\t💢━━━━━━━━━━━━━━━━━━━━━━━💢\n🌐═══════════════════════════🌐","🔑𝕷𝖔𝖌𝖎𝖓 𝕾𝖈𝖗𝖎𝖕𝖙","💢𝕿𝖝𝖎𝖙")
gg.toast("𝐓𝖆𝖕 𝕺𝖓 𝐈𝖈𝖔𝖓🔥")
if hello == 1 then
local GhostON = false
local FloatPatchON = false
local CamRightON = false
local SaveOFF = {}
local function hex2tbl(hex)
local ret = {}
hex:gsub('%S%S', function(ch)
local v = tonumber(ch, 16)
if v > 127 then v = v - 256 end
table.insert(ret, v)
end)
return ret
end
local function getLibBase(libname)
local ranges = gg.getRangesList(libname)
if not ranges or #ranges == 0 then return nil end
return ranges[1].start
end
local function readBytes(addr, n)
local req = {}
for i = 0, n - 1 do
req[#req + 1] = { address = addr + i, flags = gg.TYPE_BYTE }
end
return gg.getValues(req)
end
local function writeBytes(addr, bytes)
local set = {}
for i = 0, #bytes - 1 do
set[#set + 1] = { address = addr + i, flags = gg.TYPE_BYTE, value = bytes[i + 1] }
end
gg.setValues(set)
end
local function patchHex(libname, offset, hexstr)
local base = getLibBase(libname)
if not base then
gg.toast("❌ Library not found: " .. libname)
return false
end
local bytes = hex2tbl(hexstr)
writeBytes(base + offset, bytes)
return true
end
local G_LIB = "libil2cpp.so"
local G64_OFF = 0x33bd1f4
local G64_ON_HEX = "00 00 80 D2 C0 03 5F D6"
local G64_OFF_HEX = "02 00 80 D2 C0 03 5F D6"
local G32_OFF = 0x1f4d0ec
local G32_ON_HEX = "00 00 A0 E3 1E FF 2F E1"
local G32_OFF_HEX = "F0 4F 2D E9 1C B0 8D E2"
local function toggleGhost()
if ARCH == "arm64" then
if not GhostON then
if patchHex(G_LIB, G64_OFF, G64_ON_HEX) then
GhostON = true
gg.toast("👻 Ghost (arm64) ON ✅")
end
else
if patchHex(G_LIB, G64_OFF, G64_OFF_HEX) then
GhostON = false
gg.toast("👻 Ghost (arm64) OFF ❌")
end
end
else
if not GhostON then
if patchHex(G_LIB, G32_OFF, G32_ON_HEX) then
GhostON = true
gg.toast("👻 Ghost (arm32) ON ✅")
end
else
if patchHex(G_LIB, G32_OFF, G32_OFF_HEX) then
GhostON = false
gg.toast("👻 Ghost (arm32) OFF ❌")
end
end
end
end

local function FloatPatch()
gg.setRanges(gg.REGION_CODE_SYS | gg.REGION_CODE_APP)
if FloatPatchON then
gg.searchNumber("6.11142992e27", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("-6.11142992e27", gg.TYPE_FLOAT)
FloatPatchON = false
gg.toast("🌊 Float Patch OFF ❌")
else
gg.searchNumber("-6.11142992e27", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("6.11142992e27", gg.TYPE_FLOAT)
FloatPatchON = true
gg.toast("🌊 Float Patch ON ✅")
end
gg.clearResults()
end

local CAM_ORIG = 'h00 00 80 3F 00 00 00 00 00 00 00 00 00 00 80 BF 00 00 00 00 00 00 80 BF 00 00 00 00 00 00 00 00 00 00 80 3F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 3F 00 00 00 00 00 00 00 00 00 00 80 BF 00 00 80 7F 00 00 80 7F 00 00 80 7F 00 00 80 FF'
local CAM_MOD  = 'h22 8E C3 40 00 00 00 00 00 00 00 00 00 00 80 BF 00 00 00 00 00 00 80 BF 00 00 00 00 00 00 00 00 00 00 80 3F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 3F 00 00 00 00 00 00 00 00 00 00 80 BF 00 00 80 7F 00 00 80 7F 00 00 80 7F 00 00 80 FF'

local function RightCamera()
gg.setRanges(gg.REGION_ANONYMOUS)
if not CamRightON then
gg.searchNumber(CAM_ORIG, gg.TYPE_BYTE)
local r = gg.getResults(1500)
if #r == 0 then
gg.toast("❌ Camera pattern not found (ORIG)")
else
gg.editAll(CAM_ORIG, gg.TYPE_BYTE)
CamRightON = false
gg.toast("📷 Camera Right OFF ❌")
end
end
gg.clearResults()
end

function Headshot()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("h 08 00 00 00 00 00 60 40 CD CC 8C 3F 8F C2 F5 3C CD CC CC 3D 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 3F 33 33 13 40 00 00 B0 3F 00 00 80 3F 01", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("h 08 00 00 00 00 00 60 40 CD CC 8C 3F 8F C2 F5 3C CD CC CC 3D 06 00 00 00 00 00 80 3f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 33 33 13 40 00 00 B0 3F 00 00 80 3F 01", gg.TYPE_BYTE)
gg.clearResults()
gg.toast("💢 ΛЩM ΛIMBӨƬ σи💢")
end

function antenna()
gg.setRanges(32)
gg.searchNumber("h B4 42 96 00 00 00 00 00 00 00 00 00 00 3F 00 00 80 3E 00 00 00 00 04 00 00 00 00 00 80 3F 00 00 20 41 00 00 34 42 01", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("h B4 42 96 00 00 00 00 00 00 00 00 00 00 3B 00 00 80 3B 00 00 00 00 04 00 00 00 00 00 80 3F 00 00 20 41 00 00 34 42 01", 1)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("h 5C 43 00 00 28 42 00 00 B4 42 78 00 00 00 00 00 00 00 9A 99 19 3F 00 00 80 3E 00 00 00 00 04 00 00 00 00 00 80 3F 00 00 20 41 00 00 34 42 01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 80 3F", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("h 5C 43 00 00 28 42 00 00 B4 42 78 00 00 00 00 00 00 00 9A 99 19 3C 00 00 F5 3C 00 00 00 00 04 00 00 00 00 00 80 3F 00 00 20 41 00 00 34 42 01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 80 3F", 1)
gg.clearResults()
gg.toast("💢Uʅƚɾα Sɯιƚƈԋιɳɠ σи💢")
end

function night()
gg.setRanges(32)
gg.searchNumber(";bone_Spine",1,false,536870912,0,-1,0)
gg.getResults(300)
gg.editAll(";hip00",2)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("0.0;-0.03881515563;-0.00395374279:9", gg.TYPE_FLOAT)
gg.refineNumber("-0.03881515563", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(3)
gg.editAll("0.2", gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(32)
gg.searchNumber("0.07869631797;0.99689865112;1.0;1.0;1.0::17",16)
gg.getResults(300)
gg.editAll("-1.5",16)
gg.clearResults()
gg.searchNumber("0.98958933353;1.0;1.0;1.0::17",16)
gg.getResults(300)
gg.editAll("-1.5",16)
gg.clearResults()
gg.toast("💢𝕭𝖔𝖉у 𝐇𝖊𝖆𝖉𝖘𝖍𝖔𝖙 𝕺𝖓💢")
end

function Joystick()
gg.getTargetInfo()
gg.getRangesList("/data/app/~~tGpDHVPP3nLg-yqtPTyFeA==/com.gspace.android-Gm9GyFWD9g4rOeHn4KLgXg==/lib/arm64/libil2cpp.so")
gg.getTargetInfo()
gg.getRangesList("/data/app/~~tGpDHVPP3nLg-yqtPTyFeA==/com.gspace.android-Gm9GyFWD9g4rOeHn4KLgXg==/lib/arm64/libil2cpp.so")
gg.toast("💢 𝖏𝖔у𝖘𝖙𝖎𝖈𝖐 𝕾𝖕𝖊𝖊𝖉 𝕺𝖓💢")
gg.clearResults()
gg.processResume()
gg.setVisible(false)
gg.clearResults()
end

function Antena()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('-0.30576485395;0.01430506539;-0.73534429073;1::13', gg.TYPE_FLOAT)
gg.refineNumber('1', gg.TYPE_FLOAT)
gg.getResults(gg.getResultsCount())
gg.editAll('3000', gg.TYPE_FLOAT)
gg.clearResults()
gg.searchNumber('-0.2212036103;0.03038031235;-0.76885718107;1::13', gg.TYPE_FLOAT)
gg.refineNumber('1', gg.TYPE_FLOAT)
gg.getResults(gg.getResultsCount())
gg.editAll('3000', gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("💢𝐀𝖓𝖙𝖊𝖓𝖆 𝕾𝖍𝖔𝖚𝖑𝖉𝖊𝖗 𝕺𝖓💢")
end

function Loot()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(";ingame/pickup/pickup_awm", gg.TYPE_WORD, nil, nil, nil, nil)
gg.getResults(100)
gg.editAll(";effects/vfx_ingame_laser", gg.TYPE_WORD)
gg.clearResults()
gg.toast("AWM LOCATION ON🔴️")
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(";ingame/pickup/pickup_m24", gg.TYPE_WORD, nil, nil, nil, nil)
gg.getResults(100)
gg.editAll(";effects/vfx_ingame_laser", gg.TYPE_WORD)
gg.clearResults()
gg.toast("M24 LOCATION ON🟠️")
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(";ingame/pickup/pickup_bm94", gg.TYPE_WORD, nil, nil, nil, nil)
gg.getResults(100)
gg.editAll(";effects/vfx_ingame_laser", gg.TYPE_WORD)
gg.clearResults()
gg.toast("M82B LOCATION ON️🟡")
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.setVisible(false)
gg.searchNumber(";ingame/pickup/ammo/pickup_ammo_sng", gg.TYPE_WORD, nil, nil, nil, nil)
gg.getResults(100)
gg.editAll(";effects/vfx_inagme_laser_shop", gg.TYPE_WORD)
gg.clearResults()
gg.toast("AMMO LOCATION ON️🔵")
gg.setVisible(false)
gg.clearResults()
gg.toast("ꜱɴɪᴩᴇʀ ɢᴜɴ ʟᴏᴄᴀᴛɪᴏɴ❤️‍🔥 𝐎𝐍")
end

function white()
gg.setRanges(gg.REGION_VIDEO)
gg.searchNumber("1072216622", 4)
gg.getResults(gg.getResultsCount())
gg.editAll("1147786543", 4)
gg.clearResults(gg.getResultsCount())
gg.searchNumber("h 00 00 70 40 00 00 00 3F", 1)
gg.getResults(gg.getResultsCount())
gg.editAll("h 00 00 70 40 66 66 48 42", 1)
gg.clearResults(gg.getResultsCount())
gg.toast("💢ᴡʜɪᴛᴇʙᴏᴅʏ & ᴅᴀʀᴋꜱᴋʏ💢")
end

function invisible()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("7209065;6357095;6619245;6357039;7536755;7536745;6357108;7602286;7602281;7143525;6881327;6619235;6357111;7077996;6422623;7209077;6619243;114:69", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
revert = gg.getResults(99999, nil, nil, nil, nil, nil, nil, nil, nil)
gg.editAll(";effects/vfx_pet/vfx_petskill_robot", gg.TYPE_DWORD)
gg.clearResults()
gg.toast("💢ɪɴᴠɪꜱɪʙʟᴇ ɢʟᴏᴏ ᴡᴀʟʟ ᴏɴ💢")
gg.setVisible(false)
end

function aim()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("h 4E 65 63 6B 62 6F 6E 65 5F 53 70 69 6E 65 31 42 61 73 65", gg.TYPE_BYTE)
gg.getResults(1000)
gg.toast("No Results Found..")
gg.setRanges(gg.REGION_C_DATA)
gg.searchNumber("40", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1)
gg.editAll("360", gg.TYPE_FLOAT)
gg.clearResults()
gg.toast("𝐀𝖎𝖒 𝖋𝖔ν 360")
end

local function status(b) return b and "   ⃢♎" or "♓⃢   " end
local function HOME()
local menu = gg.choice({
"👻 Ghost (Auto "..ARCH..")  " .. status(GhostON) .. "",
"🪨 stone hack            " .. status(FloatPatchON) .. "",
"📷 Camera Right           " .. status(CamRightON) .. "",
"【⚕️】🎯ΛЩM ΛIMBӨƬ ˡᵒᵍⁱⁿ",
"【⚕️】⚡Uʅƚɾα Sɯιƚƈԋιɳɠ ˡᵒᵍⁱⁿ",
"【⚕️】😁𝖁𝖔𝖉у𝐇𝖊𝖆𝖉𝖘𝖍𝖔𝖙💀 ⁱⁿᵍᵃᵐᵉ",
"【⚕️】🕹️𝖏𝖔у𝖘𝖙𝖎𝖈𝖐 𝕾𝖕𝖊𝖊𝖉🕹️ ⁱⁿᵍᵃᵐᵉ",
"【⚕️】📍𝐀𝖓𝖙𝖊𝖓𝖆 𝕷𝖔𝖈𝖆𝖙𝖎𝖔𝖓📍ⁱⁿ ᵍᵃᵐᵉ",
"【⚕️】📤𝕾𝖓𝖎𝖕𝖊𝖗 𝕷𝖔𝖔𝖙 𝕷𝖔𝖈𝖆𝖙𝖎𝖔𝖓 ⁱⁿ ᵍᵃᵐᵉ",
"【⚕️】🥼🕶️𝐖𝖍𝖎𝐡𝖊𝖁𝖔𝖉𝐲&𝕯𝖆𝖗𝖐𝕾𝖐𝐲 ⁱⁿ ᵍᵃᵐᵉ",
"【⚕️】🧊𝐈𝖓𝖛𝖎𝖘𝖎𝖇𝖑𝖊 𝐆𝖑𝖔𝖔 ⁱⁿ ᵍᵃᵐᵉ",
"【⚕️】🎯𝐀𝖎𝖒 𝕱𝖔ν ⁱⁿ ᵍᵃᵐᵉ",
"【⚕️】💢 Exit"
}, nil, "\n    💢  𝐑𝖊𝖝 𝕷𝖚𝖆 𝐏𝖆𝖎𝖉 𝕾𝖈𝖗𝖎𝖕𝖙 💢   \n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n✘ 𝗖𝗿𝗲𝗮𝘁𝗼𝗿 : [🧩 > 𝐑ΣX   < 🧩]   ✘\n✘ 𝗩𝗲𝗿𝘀𝗶𝗼𝗻  : [🎮 > [ 𝖋𝖗𝖊𝖊 𝖋𝖎𝖗𝖊 ] < 🎮]  ✘ \n✘ 𝗘𝘅𝗽𝗶𝗿𝗲   : [⏰ > 𝕾𝖊𝖗𝖛𝖊𝖗 𝖁𝖆𝖘𝖊 < ⏰]✘\n✘ 𝕮𝖑𝖎𝖊𝖓𝖙 : [🩸 >  𝐑𝖊𝖓𝖏𝖎𝖙𝖍  < 🩸]   ✘\n✘ 𝕺𝖊𝖛𝖎𝖈𝖊 : [🦹‍♂️✡️ > 𝕾𝖎𝖓𝖌𝖑𝖊 <✡️]✘\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
if menu == 1 then toggleGhost() end
if menu == 2 then FloatPatch() end
if menu == 3 then RightCamera() end
if menu == 4 then Headshot() end
if menu == 5 then antenna() end
if menu == 6 then night() end
if menu == 7 then Joystick() end
if menu == 8 then Antena() end
if menu == 9 then Loot() end
if menu == 10 then white() end
if menu == 11 then invisible() end
if menu == 12 then aim() end
if menu == 13 then  gg.toast("🌐ɢᴏᴏᴅ ʙʏᴇ ᴏᴡɴᴇʀ ᴏꜰ ʀᴇx ʟᴜᴀ ᴄᴏᴍᴍᴜɴɪᴛʏ🌐")  os.exit() end
end

while true do
if gg.isVisible(true) then
gg.setVisible(false)
HOME()
end
gg.sleep(200)
end

else
os.exit()
end
