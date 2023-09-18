RegisterCommand('license', function(source, args)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local license = xPlayer.identifier
	TriggerClientEvent('cmds:licensecopy', src, license)
end)

RegisterCommand('cash', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local cashamount = xPlayer.getMoney()
       local datacash = {
       title = 'Liquide',
       description = "Vous avez actuellement " .. cashamount .. "€ sur vous.",
       type = 'inform'
       }
       TriggerClientEvent('ox_lib:notify', source, datacash)
end)

RegisterCommand('black_money', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
  local black_money = xPlayer.getInventoryItem('black_money').count
       local datablack_money = {
       title = 'Argent sale',
       description = "Vous avez actuellement " .. black_money .. "€ d'argent sale sur vous.",
       type = 'inform'
       }
       TriggerClientEvent('ox_lib:notify', source, datablack_money)
end)


RegisterCommand('bank', function(source, args)
local xPlayer = ESX.GetPlayerFromId(source)
local bankamount = xPlayer.getAccount('bank').money
   local databank = {
   title = 'Banque',
   description = "Vous avez actuellement " .. bankamount .. "€ sur votre compte banquaire.",
   type = 'inform'}
   TriggerClientEvent('ox_lib:notify', source, databank)
end)

RegisterCommand('huddev', function(source, args)
    TriggerClientEvent("ps-hud:ToggleDevmode", source)
end)

RegisterCommand('ping', function(source, args, raw)
	local src = source
	local ping = GetPlayerPing(src)
  local dataping = {
  title = 'Ping',
  description = "Votre ping est de : "..ping.."ms",
  type = 'inform'}
  TriggerClientEvent('ox_lib:notify', source, dataping)
end)

ESX.RegisterServerCallback('cmds:getping', function(source, cb)
	local src = source
	local ping = GetPlayerPing(src)
	cb(ping)
end)

TriggerClientEvent('chat:addSuggestion', -1, '/ping', 'Affiche votre ping', {})

print('Ox Menu loaded.')
