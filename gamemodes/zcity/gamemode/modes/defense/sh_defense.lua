local MODE = MODE

zb = zb or {}
zb.Points = zb.Points or {}

zb.Points.NPC_DEFENSE_SPAWN= zb.Points.NPC_DEFENSE_SPAWN or {}
zb.Points.NPC_DEFENSE_SPAWN.Color = Color(243,9,9)
zb.Points.NPC_DEFENSE_SPAWN.Name = "NPC_DEFENSE_SPAWN"

zb.Points.PLY_DEFENSE_SPAWN = zb.Points.PLY_DEFENSE_SPAWN or {}
zb.Points.PLY_DEFENSE_SPAWN.Color = Color(51,243,9)
zb.Points.PLY_DEFENSE_SPAWN.Name = "PLY_DEFENSE_SPAWN"

zb.Points.DEFENSE_POINT = zb.Points.DEFENSE_POINT or {}
zb.Points.DEFENSE_POINT.Color = Color(13,9,243)
zb.Points.DEFENSE_POINT.Name = "DEFENSE_POINT"


MODE.SUBMODES = {
    STANDARD = {
        name = "Standart",
        description = "Klasik 6 dalga Combine saldırısı",
        waves = 6,
        enemy_type = "combine"
    },
    EXTENDED = {
        name = "Genişletilmiş",
        description = "Genişletilmiş mod: Bosslar ve özel düşmanlarla 12 dalga",
        waves = 12,
        enemy_type = "combine"
    },
    ZOMBIE = {
        name = "Zombi",
        description = "6 dalga zombi kıyameti",
        waves = 6,
        enemy_type = "zombie"
    }
}