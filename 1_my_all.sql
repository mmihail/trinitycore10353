update battleground_template set MinPlayersPerTeam=2 where id in (1,2,3,7,9,10,11,30,32);

update battleground_template set Weight=9 where id=1;
UPDATE `creature_template` SET `ScriptName`='npc_cult_adherent' WHERE `entry` IN(37949,38010,38136);
UPDATE `creature_template` SET `ScriptName`='npc_cult_fanatic' WHERE `entry` IN (37890,38009,38135);
update creature_template set ScriptName='npc_vengeful_shade' where entry=38222;
# fanatic
update creature_template set faction_A=21,faction_H=21 where entry in (38009,38398,38630,38631,37890,38393,38628,38629,38135,38395,38634,38635);

# adherent
update creature_template set faction_A=21,faction_H=21 where entry in (37949,38394,38625,38626,38136,38396,38632,38633,38010,38397,39000,39001);
# 10 ob
DELETE FROM creature_loot_template WHERE entry=39863;
INSERT INTO `creature_loot_template` VALUES (39863,49426,100,1,0,3,3);
INSERT INTO `creature_loot_template` VALUES (39863,53119,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53115,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53111,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53118,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53117,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53112,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53116,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53103,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53110,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53121,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53114,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39863,53113,0,1,1,1,1);

# 10 ger
DELETE FROM creature_loot_template WHERE entry=39944;
INSERT INTO `creature_loot_template` VALUES (39944,49426,100,1,0,3,3);
INSERT INTO `creature_loot_template` VALUES (39944,54559,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54565,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54562,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54566,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54567,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54556,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54557,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54558,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54560,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54561,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54563,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39944,54564,0,1,2,1,1);

# 25 ob
DELETE FROM creature_loot_template WHERE entry=39864;
INSERT INTO `creature_loot_template` VALUES (39864,53486,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,54572,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,54569,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,54573,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53133,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53489,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,54571,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53125,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53126,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53132,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53127,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53488,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53490,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53134,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53487,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,53129,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39864,49426,100,1,0,3,3);

# 25 ger
DELETE FROM creature_loot_template WHERE entry=39945;
INSERT INTO `creature_loot_template` VALUES (39945,54582,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54588,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54583,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54589,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54580,0,1,1,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54590,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54591,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54576,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54581,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54578,0,1,2,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54585,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54587,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54584,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54579,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54586,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,54577,0,1,3,1,1);
INSERT INTO `creature_loot_template` VALUES (39945,49426,100,1,0,3,3);
UPDATE `creature_template` SET `lootid` = 28859 WHERE `entry` = 28859;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(28859,40511,0,1,1,1),
(28859,40486,0,1,1,1),
(28859,40488,0,1,1,1),
(28859,40526,0,1,1,1),
(28859,40519,0,1,1,1),
(28859,40491,0,2,1,1),
(28859,40489,0,2,1,1),
(28859,40475,0,2,1,1),
(28859,40497,0,2,1,1),
(28859,40474,0,2,1,1),
(28859,45624,100,0,2,2),
(28859,43953,1,0,1,1),
(28859,44650,-100,0,1,1);
UPDATE `creature_template` SET `lootid` = 31734  WHERE `entry` = 31734;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(31734,40566,0,1,1,1),
(31734,40594,0,1,1,1),
(31734,40560,0,1,1,1),
(31734,40592,0,1,1,1),
(31734,40589,0,1,1,1),
(31734,40555,0,2,1,1),
(31734,40590,0,2,1,1),
(31734,40543,0,2,1,1),
(31734,40561,0,2,1,1),
(31734,40588,0,2,1,1),
(31734,40541,0,3,1,1),
(31734,40564,0,3,1,1),
(31734,40591,0,3,1,1),
(31734,40194,0,3,1,1),
(31734,40532,0,3,1,1),
(31734,40562,0,3,1,1),
(31734,40539,0,4,1,1),
(31734,40531,0,4,1,1),
(31734,40549,0,4,1,1),
(31734,40558,0,4,1,1),
(31734,40474,0,4,1,1),
(31734,40526,0,4,1,1),
(31734,45624,100,0,2,2),
(31734,43952,1,0,1,1),
(31734,44650,-100,0,1,1);

delete from gameobject where id in (201886,201887,201868) and map=631;

update creature set spawntimesecs=86400 where id in (36724,36725);
update item_template set Duration=0 where entry=46104;

-- Ulduar
-- Open All Door
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 0 WHERE `entry` IN (194905, 194416, 194556, 194255, 194750);
-- Open Base Teleport (only for MaNGOS)
#DELETE FROM areatrigger_teleport WHERE id = '5420';
#INSERT INTO areatrigger_teleport VALUES (5420, "Ulduar (base teleport)", 5420, 603, 1498.09, -24.246, 421.366, 0);
##INSERT INTO areatrigger_teleport VALUES (5420, "Ulduar (base teleport)", 0, 0, 0, 0, 0, 0, 0, "", 603, 1498.09, -24.246, 421.366, 0);
#UPDATE `gameobject` SET `state` = 0 WHERE `guid` = 73286;
-- Boss Recipes
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33360, 45089, 5, 0, -45089, 1),
(32846, 45089, 5, 0, -45089, 1),
(33147, 45089, 5, 0, -45089, 1),
(33350, 45089, 5, 0, -45089, 1),
(11999, 45089, 5, 0, -45089, 1);
-- Algalon
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194822);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194822;
UPDATE `creature_template` SET `lootid` = 32871 WHERE `entry` = 32871;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32871, 45624, 100, 0, 1, 2),
(32871, 46052, 100, 0, 1, 1),
(32871, 46051, 0, 1, 1, 1),
(32871, 46045, 0, 1, 1, 1),
(32871, 46040, 0, 1, 1, 1),
(32871, 46048, 0, 1, 1, 1),
(32871, 46039, 0, 1, 1, 1),
(32871, 46038, 0, 2, 1, 1),
(32871, 46042, 0, 2, 1, 1),
(32871, 46043, 0, 2, 1, 1),
(32871, 46046, 0, 2, 1, 1),
(32871, 46044, 0, 2, 1, 1),
(32871, 46047, 0, 3, 1, 1),
(32871, 46037, 0, 3, 1, 1),
(32871, 46041, 0, 3, 1, 1),
(32871, 46050, 0, 3, 1, 1),
(32871, 46049, 0, 3, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194821);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194821;
UPDATE `creature_template` SET `lootid` = 33070 WHERE `entry` = 33070;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33070, 45624, 100, 0, 1, 2),
(33070, 46053, 100, 0, 1, 1),
(33070, 45665, 0, 1, 1, 1),
(33070, 45611, 0, 1, 1, 1),
(33070, 45594, 0, 1, 1, 1),
(33070, 45610, 0, 1, 1, 1),
(33070, 45587, 0, 1, 1, 1),
(33070, 45609, 0, 2, 1, 1),
(33070, 45612, 0, 2, 1, 1),
(33070, 45617, 0, 2, 1, 1),
(33070, 45615, 0, 2, 1, 1),
(33070, 45599, 0, 2, 1, 1),
(33070, 45570, 0, 3, 1, 1),
(33070, 45611, 0, 3, 1, 1),
(33070, 45616, 0, 3, 1, 1),
(33070, 45620, 0, 3, 1, 1),
(33070, 45619, 0, 3, 1, 1);
-- Mimiron Normal
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194789);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194789;
UPDATE `creature_template` SET `lootid` = 33350 WHERE `entry` = 33350;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33350, 45624, 100, 0, 1, 2),
(33350, 45649, 100, 0, -45649, 1),
(33350, 45976, 0, 1, 1, 1),
(33350, 45973, 0, 1, 1, 1),
(33350, 45974, 0, 1, 1, 1),
(33350, 45972, 0, 1, 1, 1),
(33350, 45975, 0, 1, 1, 1),
(33350, 45993, 0, 1, 1, 1),
(33350, 45982, 0, 1, 1, 1),
(33350, 45989, 0, 1, 1, 1),
(33350, 45990, 0, 1, 1, 1),
(33350, 45787, -100, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194956);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194956;
UPDATE `creature_template` SET `lootid` = 11999 WHERE `entry` = 11999;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(11999, 45624, 100, 0, 1, 2),
(11999, 45643, 100, 0, -45643, 1),
(11999, 45490, 0, 1, 1, 1),
(11999, 45491, 0, 1, 1, 1),
(11999, 45492, 0, 1, 1, 1),
(11999, 45493, 0, 1, 1, 1),
(11999, 45489, 0, 1, 1, 1),
(11999, 45496, 0, 1, 1, 1),
(11999, 45816, -100, 0, 1, 1),
(11999, 45087, 33, 0, 1, 1),
(11999, 45038, 10, 0, 1, 1);
-- Thorim
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194313);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194313;
UPDATE `creature_template` SET `lootid` = 32865 WHERE `entry` = 32865;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32865, 45624, 100, 0, 1, 1),
(32865, 45661, 100, 0, -45661, 1),
(32865, 45893, 100, 0, -45893, 1),
(32865, 45928, 100, 0, -45928, 1),
(32865, 45784, -100, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194315);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194315;
UPDATE `creature_template` SET `lootid` = 33147 WHERE `entry` = 33147;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33147, 45624, 100, 0, 1, 2),
(33147, 45640, 100, 0, -45640, 2),
(33147, 45467, 100, 0, -45467, 1),
(33147, 45474, 100, 0, -45474, 1),
(33147, 45817, -100, 0, 1, 1),
(33147, 45087, 33, 0, 1, 1),
(33147, 45038, 10, 0, 1, 1);
-- Hodir
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194307);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194307;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194200);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194200;
UPDATE `creature_template` SET `lootid` = 32845 WHERE `entry` = 32845;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32845, 45652, 100, 0, -45652, 1),
(32845, 45872, 0, 1, 1, 1),
(32845, 45464, 0, 1, 1, 1),
(32845, 45458, 0, 1, 1, 1),
(32845, 45874, 0, 1, 1, 1),
(32845, 45873, 0, 1, 1, 1),
(32845, 45624, 100, 0, 1, 2),
(32845, 45786, -100, 0, 1, 1),
(32845, 45888, 0, 2, 1, 1),
(32845, 45886, 0, 2, 1, 1),
(32845, 45887, 0, 2, 1, 1),
(32845, 45877, 0, 2, 1, 1),
(32845, 45876, 0, 2, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194308);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194308;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194201);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194201;
UPDATE `creature_template` SET `lootid` = 32846 WHERE `entry` = 32846;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32846, 45634, 100, 0, -45634, 2),
(32846, 45624, 100, 0, 1, 1),
(32846, 45087, 33, 0, 1, 1),
(32846, 45038, 10, 0, 1, 1),
(32846, 45453, 0, 1, 1, 1),
(32846, 45450, 0, 1, 1, 1),
(32846, 45454, 0, 1, 1, 1),
(32846, 45452, 0, 1, 1, 1),
(32846, 45451, 0, 1, 1, 1),
(32846, 45815, -100, 0, 1, 1),
(32846, 45461, 0, 2, 1, 1),
(32846, 45457, 0, 2, 1, 1),
(32846, 45459, 0, 2, 1, 1),
(32846, 45612, 0, 2, 1, 1),
(32846, 45460, 0, 2, 1, 1),
(32846, 45462, 0, 2, 1, 1);
-- Freya
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194324);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194324;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194325);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194325;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194326);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194326;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194327);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194327;
UPDATE `creature_template` SET `lootid` = 32906 WHERE `entry` = 32906;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32906, 45947, 100, 0, -45947, 1),
(32906, 45943, 100, 0, -45943, 1),
(32906, 45934, 100, 0, -45934, 1),
(32906, 45646, 100, 0, -45646, 1),
(32906, 46110, 75, 0, 1, 1),
(32906, 45624, 100, 0, 4, 4),
(32906, 45788, -100, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194328);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194328;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194329);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194329;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194330);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194330;
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194331);
UPDATE `gameobject_template` SET `data1` = 0 WHERE `entry` = 194331;
UPDATE `creature_template` SET `lootid` = 33360 WHERE `entry` = 33360;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33360, 45488, 100, 0, -45488, 1),
(33360, 45479, 100, 0, -45479, 1),
(33360, 45481, 100, 0, -45481, 1),
(33360, 45655, 100, 0, -45655, 1),
(33360, 46110, 75, 0, 1, 1),
(33360, 45038, 20, 0, 1, 1),
(33360, 45087, 100, 0, 2, 2),
(33360, 45624, 100, 0, 4, 5),
(33360, 45814, -100, 0, 1, 1);
-- Kologarn
UPDATE `gameobject` SET `spawntimesecs` = 604800 WHERE `guid` IN (40129, 40130);

# with AC2 don't work "An End To All Things..."
update quest_template set method=0 where entry= 12779;
delete from spell_linked_spell where spell_effect= 69706;

# delete Tirion in ICC

delete from  creature where id=38995;
