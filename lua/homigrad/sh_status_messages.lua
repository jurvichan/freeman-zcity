
local allowedchars = {
	"ah",
	"AH",
	"ghh",
	"GH",
	"AHHH",
}

local audible_pain = {
	"AAAAAGH..KAHRETSIN.. YANIYORUM.",
	"ARTIK DAYANAMIYORUM!",
    "DURSUN DURSUN DURDURUN",
    "NEDEN DURMUYOR",
    "BAYILTIN BENİ. LÜTFEN",
    "Neden bunu hissetmek için doğdum neden...",
    "Durması için her şeyi yapardım... HER ŞEYİ.",
    "Bu yaşamak değil bu İŞKENCE",
    "Artık umurumda değil sadece DURDURUN ŞU ACIY",
    "Hiçbir şey önemli değil DURDURMAK DIŞINDA...",
    "Her saniye bir ATEŞ ebediyeti.",
    "ÖLMEK ŞİMDİ MERHAMET OLURDU...",
    "Sadece acısız bir an..",
	"ŞİMDİ YANIMDA AĞRI KESİCİ OLSAYDI. KAHRETSIN.",
}

local sharp_pain = {
	"AAAHH",
	"AAAH",
	"AAaaAH",
	"AAaaAH",
	"AAaaAAAGH",
	"AAaaAH",
	"AAaAaaH",
	"AAAAAaaH",
	"AAaaAHHHH",
	"AAaAA",
	"AAAAAa",
	"AAAAaAAAaaaaghh",
	"AAAaaAa",
	"AaaAAaghf",
	"aaAaaAaff",
	"aaahhh",
	"AAAaaGHHH",
	"AAAaaAAHH",
	"AAAaaAAAAAaGHHHH",
	"AAAaaAAAAAaGHAAAHHH",
	"AAAaaAAAAAaGHHAAAAAAHH",
	"AAAaaAAAAAaGHHHH",
	"AAAaaAAAaaAAAaGHHHH",
	"AAAaaAAAaaAAAaAAAAAAAGHHHH",
	"AAAaaAAAAAaGHHHH",
	"AAAaaAAAAAAAAAHHH",
	"AAAaaAAAAAaGHAaaaHH",
	"AAAaaAAAAAaAaaaaaAAAAHH",
	"AAAaaAAAAAaAAAAAAAADGHHHH",
	"AAAaaAAAaaAAAaAAAAAAAAAAAAGGGGGGAGHHHH",
	"AAAaaAAAaaAAAaAAAAAAAAAAAAAAAAAAH",
}

hg.sharp_pain = sharp_pain

local random_phrase = {
	"Burada biraz soğuk...",
	"Her şey fazla sessiz gibi...",
	"Nefes almak şu an garip biçimde tatmin edici.",
	"Ya bu sessizlik sonsuza kadar sürerse?",
	"Neden hiçbir şey olmuyor?",
}

local fear_hurt_ironic = {
	"Burada bir ders vardır mutlaka... eğer hayatta kalırsam.",
	"Biyografimi yazan buna inanmaz.",
	"Eh, bu aptalca bir ölüm şekli.",
	"En azından hayatım sıkıcı değildi.",
	"Kendime not: Bunu bir daha yapma.",
	"Ölmek için daha kötü günler olabilirdi.",
}

local fear_phrases = {
	"O kadar da kötü değil... değil mi?",
	"Böyle ölmek istemiyorum.",
	"Bu gerçekten böyle mi bitiyor?",
	"Bu iyi değil.",
	"Bu gerçekten böyle mi bitiyor?",
	"Böyle ölmek istemiyorum.",
	"Bir çıkış yolu olsaydı.",
	"Çok şeyden pişmanım.",
	"Bu olamaz.",
	"Buna inanamıyorum.",
	"Bunu daha ciddiye almalıydım.",
	"Ya çıkamazsam..?",
	"Düşündüğümden daha kötü.",
	"Bu çok adaletsiz.",
	"Henüz pes edemem.",
	"Böyle olacağını hiç düşünmemiştim.",
	"İçgüdülerime kulak verseydim.",
	"Nefes al. Sadece nefes al.",
	"Soğuk eller. Sakin eller.",
}

local is_aimed_at_phrases = {
    "Tanrım. Geldi işte.",
    "Kıpırda. ma.",
    "Gerçekten böyle mi ölüyorum?",
    "Kaçmalıydım. Neden kaçmadım?",
    "Tetikle dokunma lütfen. Lütfen.",
    "Parmağını tetikte görebiliyorum.",
    "Ölmek istemiyorum. Bu şekilde değil.",
    "Yalvarsam daha mı kötü olur?",
    "Bu gerçek olamaz. Bu gerçek olamaz.",
    "Biri yardım etsin. Lütfen. Biri.",
    "Böyle bir yerde ölmek istemiyorum.",
    "Son düşüncem korku olmasın.",
    "Ölmek istemiyorum.",
}

local near_death_poetic = {
	"Ayağa kalkmaya çalışıyorum... ama bir türlü...",
	"Nefes almak artık boşluğun küçük yudumları...",
	"Gözlerimin açık mı kapalı mı olduğunu anlayamıyorum...",
	"Tadacağım son şey kendi kanım ve bakır.",
	"Gözlerim nesnelerin üzerinden kayıp gidiyor.",
	"Ayakta durmanın nasıl bir şey olduğunu unuttum.",
	"Her şey kafamın içinde yankılanıyor.",
	"Göz kırpınca görüntü bir türlü geri gelmiyor.",
	"Parmaklarım hiçbir şeyi kavrayamıyor.",
	"Akciğerlerim dolmayı reddediyor.",
	"Pişmanlıkların artık anlamı yok.",
}

local near_death_positive = {
	"Ölmek istemiyorum.",
	"Hayatta kalmam lazım.",
	"Hâlâ bir şans var.",
	"Korkuya yenik düşemem.",
	"Bir deneme daha.",
	"Burada ölmeyi reddediyorum.",
	"Tamam... bunu düşün.",
	"Dur be. Hareket etmek daha kötü yapar.",
	"Yavaş nefes al. Panik işe yaramaz.",
	"Bitmeden bitmez.",
	"Acı sadece bir sinyal. Yoksay.",
	"Eğer buysa... en azından çabuk olur.",
	"Daha kötüsünden kurtuldum. Muhtemelen.",
	"Böyle hayal etmemiştim.",
}

local broken_limb = {
	"KAHRETSIN. KAHRETSIN. KESİNLİKLE KIRIK!",
	"KEMİK PARÇALARININ HAREKET ETTİĞİNİ HİSSEDEBİLİYORUM!",
	"KAHRETSIN KIRIK. SANIYORUM..",
	"Sadece düşünmek bile acıtıyor. Kesinlikle kırık.",
	"Buradan bükülmemesi lazımdı.",
	"Ah lanet. Kopmuş.",
	"Açık kırık göremiyorum ama bir şey kırdığımı hissediyorum.",
}

local dislocated_limb = {
	"Evet orası böyle bükülmemeli.",
	"Şu kemiği yerine oturtmam lazım.",
	"Hayır... Yerine oturtmam gerekiyor.",
	"O kadar çok acıtıyor ki. Bir doktora gitmem gerekebilir.",
	"Uzvum yerinden çıkmış.",
}

local hungry_a_bit = {
    "Mgh, acıktım...",
    "Bir şeyler yesem iyi olur...",
    "Acıktım...",
    "Bir şeyler yemeliyim.",
}

local very_hungry = {
    "Midem... Ah...",
    "Yemezsem daha kötü hissederim...",
    "Mide... Kahretsin... Midem bulanıyor",
}

local after_unconscious = {
    "Ne oldu? Acıyor...",
	"Neredeyim? Neden acıyor...",
	"Öl-ölecektim sanmıştım...",
	"Kafam... Ne oldu?",
	"Az önce neredeyse ölüyor muydum?",
	"Öldüm gibi hissettim.",
	"Allah almadı mı beni?",
	"Ohh-kahretsin... kafam zonkluyor...",
	"Oh şu an kalkmak zor olacak... ama kalkmalıyım...",
	"Burayı hiç tanımıyorum... ya da tanıyor muyum?",
	"BUNU BİR DAHA YAŞAMAK İSTEMİYORUM!",
}

local slight_braindamage_phraselist = {
	"Anlamıyorum...",
	"Bir anlamı yok...",
	"Neredeyim?",
	"Ha? Bu ne..?",
	"Ne olduğunu bilmiyorum...",
	"Merhaba?",
	"Ughhh ohhhh...      ha...",
	"Ne... oluyor?",
}

local braindamage_phraselist = {
	"Bbbee.. wheea mgh?!",
	"Bmmeee... mehk...",
	"Mm--hhhh. Mmm?",
	"Ghmgh whhh...",
	"Ahgg...mg?",
	"Hgghh... D-Dmmh.",
	"Lmmmphf, mp-hf!",
	"Heeelllhhpphp...",
	"Nghh... Gmh?",
	"Ggg... Bgh..",
	"Bhrhraihin.",
}

local cold_phraselist = {
	"Çok soğumaya başladı..",
	"Benim için fazla soğuk.",
	"Titrek titrek, kahretsin.",
	"Burada son derece soğuk..",
	"Isınmam lazım...",
	"Oldukça üşüdüm...",
	"Soğuktan hasta gibi hissediyorum, kahretsin."
}

local freezing_phraselist = {
	"V-v-vücudumu h-his-sedemiyorum..",
	"Bacaklarımı h-hissedemiyorum...",
	"D-don-nuyorum ka-kahretsin..",
	"S-sanırım yü-yüzüm u-uyu-uştu..",
	"So-soğuk..",
	"H-hiç-bir şey h-hissedemiyorum..",
}

local numb_phraselist = {
	"Artık soğuk değil..",
	"Neden... sıcak hissettiriyor..?",
	"Sanırım iyiyim... sanırım...",
	"Sonunda biraz sıcaklık...",
	"Yeniden sıcağım... Bir şekilde...",
	"Az önce donuyordum... Bu sıcaklık nereden geldi..?",
}

local hot_phraselist = {
	"Ter içindeyim..",
	"Bu sıcak beni öldürüyor..",
	"Kıyafetlerim tere battı, kahretsin.",
	"Terim kahretsin kokuyor. Gerçekten serinlemem lazım...",
	"Biraz fazla sıcak, kahretsin.",
	"Gerçekten çok ısınıyorum...",
	"Burada neden bu kadar sıcak?",
}

local heatstroke_phraselist = {
	"SU LAZIM BANA!!",
	"Lütfen... su...",
	"Başım dönüyor... Kahret-",
	"KAFAM!- Acıyor..",
	"Kafam zonkluyor..",
}

local heatvomit_phraselist = {
	"O sıcak..- Kusacağım-",
	"Ugghhh... Neredeyse kusuyorum-",
	"Kahret.. Ugghh.. İyi his-"
}

local hg_showthoughts = ConVarExists("hg_showthoughts") and GetConVar("hg_showthoughts") or CreateClientConVar("hg_showthoughts", "1", true, true, "Toggle thoughts of your character", 0, 1)

function string.Random(length)
	local length = tonumber(length)

    if length < 1 then return end

    local result = {}

    for i = 1, length do
        result[i] = allowedchars[math.random(#allowedchars)]
    end

    return table.concat(result)
end

function hg.nothing_happening(ply)
	if not IsValid(ply) then return end

	return ply.organism and ply.organism.fear < -0.6
end

function hg.fearful(ply)
	if not IsValid(ply) then return end

	return ply.organism and ply.organism.fear > 0.5
end

function hg.likely_to_phrase(ply)
	local org = ply.organism

	local pain = org.pain
	local brain = org.brain
	local blood = org.blood
	local fear = org.fear
	local temperature = org.temperature
	local broken_dislocated = org.just_damaged_bone and ((org.just_damaged_bone - CurTime()) < -3)

	return (broken_dislocated) and 5
		or (pain > 65) and 5
		or (temperature < 31 and 0.5)
		or (temperature > 38 and 0.5)
		or (blood < 3000 and 0.3)
		--or (fear > 0.5 and 0.7)
		or (brain > 0.1 and brain * 5)
		or (fear < -0.5 and 0.05)
		or -0.1
end

function IsAimedAt(ply)
    return ply.aimed_at or 0
end

local function get_status_message(ply)
	if not IsValid(ply) then
		if CLIENT then
			ply = lply
		else
			return
		end
	end

	local nomessage = hook.Run("HG_CanThoughts", ply) --ply.PlayerClassName == "Gordon" || ply.PlayerClassName == "Combine"
	if nomessage ~= nil and nomessage == false then return "" end

    if ply:GetInfoNum("hg_showthoughts", 1) == 0 then return "" end

	local org = ply.organism
	
	if not org or not org.brain then return "" end

	local pain = org.pain
	local brain = org.brain
	local temperature = org.temperature
	local blood = org.blood
	local hungry = org.hungry
	local broken_dislocated = org.just_damaged_bone and ((org.just_damaged_bone + 3 - CurTime()) < -3)

	if broken_dislocated and org.just_damaged_bone then
		org.just_damaged_bone = nil
	end
	
	local broken_notify = (org.rarm == 1) or (org.larm == 1) or (org.rleg == 1) or (org.lleg == 1)
	local dislocated_notify = (org.rarm == 0.5) or (org.larm == 0.5) or (org.rleg == 0.5) or (org.lleg == 0.5)
	local after_unconscious_notify = org.after_otrub

	if not isnumber(pain) then return "" end

	local str = ""

	local most_wanted_phraselist
	
	if temperature < 35 then
		most_wanted_phraselist = temperature > 31 and cold_phraselist or (temperature < 28 and numb_phraselist or freezing_phraselist)
	elseif temperature > 38 then
		most_wanted_phraselist = temperature < 40 and hot_phraselist or heatstroke_phraselist
	end

	if not most_wanted_phraselist and hungry and hungry > 25 and math.random(3) == 1 then
		most_wanted_phraselist = hungry > 45 and very_hungry or hungry_a_bit
	end

	if (blood < 3100) or (pain > 75) or (broken_dislocated) or (broken_notify) or (dislocated_notify) then
		if pain > 75 and (broken_dislocated) then
			most_wanted_phraselist = math.random(2) == 1 and audible_pain or (broken_notify and broken_limb or dislocated_limb)
		elseif pain > 75 then
			most_wanted_phraselist = audible_pain
		elseif broken_dislocated then
			most_wanted_phraselist = (broken_notify and broken_limb or dislocated_limb)
		end

		if pain > 100 then
			most_wanted_phraselist = sharp_pain
		end

		if not most_wanted_phraselist then
			if (broken_dislocated_notify) and (blood < 3100) then
				most_wanted_phraselist = blood < 2900 and (near_death_poetic) or (math.random(2) == 1 and (broken_notify and broken_limb or dislocated_limb) or near_death_poetic)
			--elseif(broken_dislocated_notify)then
				--most_wanted_phraselist = (broken_notify and broken_limb or dislocated_limb)
			elseif(blood < 3100)then
				most_wanted_phraselist = near_death_poetic
			end
		end
	elseif after_unconscious_notify then
		most_wanted_phraselist = after_unconscious
	elseif hg.nothing_happening(ply) then
		most_wanted_phraselist = random_phrase

		if hungry and hungry > 25 and math.random(5) == 1 then
			most_wanted_phraselist = hungry > 45 and very_hungry or hungry_a_bit
		end
	elseif hg.fearful(ply) then
		most_wanted_phraselist = ((IsAimedAt(ply) > 0.9) and is_aimed_at_phrases or (math.random(10) == 1 and fear_hurt_ironic or fear_phrases))
	end

	if brain > 0.1 then
		most_wanted_phraselist = brain < 0.2 and slight_braindamage_phraselist or braindamage_phraselist
	end
	
	if most_wanted_phraselist then
		str = most_wanted_phraselist[math.random(#most_wanted_phraselist)]

		return str
	else
		return ""
	end
end

local allowedlist_types = {
	heatvomit = heatvomit_phraselist,
}

function hg.get_phraselist(ply, type)
	if not IsValid(ply) then
		if CLIENT then
			ply = lply
		else
			return
		end
	end
	
	local nomessage = ply.PlayerClassName == "Gordon" || ply.PlayerClassName == "Combine"

	if nomessage then return "" end
    if ply:GetInfoNum("hg_showthoughts", 1) == 0 then return "" end

	local org = ply.organism	
	if not org or not org.brain then return "" end

	if not isstring(type) or not allowedlist_types[type] then return "" end

	local needed_list = allowedlist_types[type]

	local str = needed_list[math.random(#needed_list)]
	return str
end

function hg.get_status_message(ply)
	local txt = get_status_message(ply)

	return txt
end
