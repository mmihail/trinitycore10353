/* Game Objects  */
DELETE FROM `gameobject` WHERE `map`=649;
INSERT INTO `gameobject` VALUES
(500000,195527,649,15,1,563.678,177.284,398.621,1.57047,0,0,0,0,0,100,0), /* Argent Coliseum Floor */
(500001,195647,649,15,1,563.678,199.329,394.766,1.58619,0,0,0,0,0,100,1), /* Main Gate */
(500002,195650,649,15,1,624.656,139.342,395.261,0.00202179,0,0,0,0,0,100,1), /* South Portcullis */
(500003,195648,649,15,1,563.671,78.459,395.261,4.69083,0,0,0,0,0,100,0), /* East Portcullis */
(500004,195649,649,15,1,502.674,139.302,395.26,3.14933,0,0,0,0,0,100,1), /* North Portcullis */
(500046,195594,649,1,1,563.72,77.1442,396.336,1.559,0,0,0.715397,-0.698718,300,0,1), /* Portal 10 normal */
(500048,195595,649,2,1,563.72,77.1442,396.336,1.559,0,0,0.715397,-0.698718,300,0,1), /* Portal 25 normal */
(500050,195596,649,8,1,563.72,77.1442,396.336,1.559,0,0,0.715397,-0.698718,300,0,1), /* Portal 25 hc */
(500052,195593,649,4,1,563.72,77.1442,396.336,1.559,0,0,0.715397,-0.698718,300,0,1); /* Portal 10 hc */

/* Creatures */
DELETE FROM `creature` WHERE `map`=649;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(604905,34990,649,15,1,0,0,624.633,139.386,418.209,3.15008,300,0,0,8367000,0,0,0), /* King Varian Wrynn */
(604903,34996,649,15,1,0,547,563.697,78.3457, 418.21,1.55937,300,0,0,13945000,4258,0,0), /* Hight Lord Tirion Fordring */
(604907,34995,649,15,1,0,0,502.825,139.407,418.211,0.0163429,300,0,0,1394500,0,0,0), /* Garrosh Hellscream */
/*(604909,35458,649,15,1,0,2106,622.6,112.19,419.705,2.62386,300,0,0,100000,90000,0,0), /* Wilfred Fizzlebang */
(604911,34816,649,15,1,0,0,556.27,89.0785,395.241,1.05514,300,0,0,126000,0,0,0), /* Barrett Ramsey */
(504913,34564,649,15,1,0,0,783.237,133.477,142.576,3.06614,300,0,0,4183500,0,0,0); /* Anubarak */

/* Texts (yells) */
SET @id := -1760000;
DELETE FROM `script_texts` WHERE `entry` BETWEEN @id-76 AND @id;
INSERT INTO `script_texts` (npc_entry, entry, content_default, sound, type, language, emote, comment) VALUES
(34995, @id, "Welcome champions, you have heard the call of the Argent Crusade and you have boldly answered. It is here in the crusaders coliseum that you will face your greatest challenges. Those of you who survive the rigors of the coliseum will join the Argent Crusade on its marsh to ice crown citadel.", 16036, 1, 0, 0, "Trial of the Crusader - welcome"),
(36095, @id-1, "Hailing from the deepest, darkest carverns of the storm peaks, Gormok the Impaler! Battle on, heroes!", 16038, 1, 0, 0, "Gormok the Impaler - intro"),
(36095, @id-2, "Steel yourselves, heroes, for the twin terrors Acidmaw and Dreadscale. Enter the arena!", 16039, 1, 0, 0, "Acidmaw and Dreadscale - intro"),
(34799, @id-3, "At its companion perishes, %s becomes enraged!", 0, 3, 0, 0, "Acidmaws adn dreadscales enrage emote"),
(36095, @id-4, "The air freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!", 16040, 1, 0, 0, "Icehowl - intro"),
(34995, @id-5, "The monstrous menagerie has been vanquished!", 16041, 1, 0, 0, "Beasts of Northrend - victory"),
(36095, @id-6, "Tragic... They fought valiantly, but the beasts of Northrend triumphed. Let us observe a moment of silence for our fallen heroes.", 16042, 1, 0, 0, "Raid wipe"),
(36095, @id-7, "Grand Warlock Wilfred Fizzlebang will summon forth your next challenge. Stand by for his entry!", 16043, 1, 0, 0, "Lord Jaraxxus - intro"),
(35458, @id-8, "Thank you, Highlord! Now challengers, I will begin the ritual of summoning! When I am done, a fearsome Doomguard will appear!", 16268, 1, 0, 0, "Lord Jaraxxus - intro2"),
(35458, @id-9, "Prepare for oblivion!", 16269, 1, 0, 0, "Wilfred Fizzlebang - summoning"),
(35458, @id-10, "Ah ha! Behold the absolute power of Wilfred Fizzlebang, master summoner! You are bound to ME, demon!", 16270, 1, 0, 0, "Lord Jaraxxus - portal"),
(34780, @id-11, "Trifling gnome, your arrogance will be your undoing!", 16143, 1, 0, 0, "Lord Jaraxxus - intro3"),
(35458, @id-12, "But I'm in charge her-", 16271, 1, 0, 0, "Wilfred Fizzlebang - die"),
(36095, @id-13, "Quickly, heroes! Destroy the demon lord before it can open a portal to its twisted demonic realm!", 16044, 1, 0, 0, "Lord Jaraxxus - intro4"),
(34780, @id-14, "You face Jaraxxus, eredar lord of the Burning Legion!", 16144, 1, 0, 0, "Lord Jaraxxus - aggro"),
(34780, @id-15, "FLESH FROM BONE!", 16149, 1, 0, 0, "Lord Jaraxxus - Incinerate Flesh"),
(34780, @id-16, "$n has |cFF00FFFFIncinerate flesh!|R Heal $ghim:her;!", 0, 3, 0, 0, "Lord Jaraxxus - incinerate flesh's emote for players"),
(34780, @id-17, "Come forth, sister! Your master calls!", 16150, 1, 0, 0, "Lord Jaraxxus - Summoning Mistress of Pain"),
(34780, @id-18, "INFERNO!", 16151, 1, 0, 0, "Lord Jaraxxus - Summoning Infernals"),
(34780, @id-19, "Insignificant gnat!", 16145, 1, 0, 0, "Lord Jaraxxus - killing a player1"),
(34780, @id-20, "Banished to the Nether!", 16146, 1, 0, 0, "Lord Jaraxxus - killing a player2"),
(34780, @id-21, "Another will take my place. Your world is doomed.", 16147, 1, 0, 0, "Lord Jaraxxus - death"),
(36095, @id-22, "The loss of Wilfred Fizzlebang, while unfortunate, should be a lesson to those that dare dabble in dark magic. Alas, you are victorious and must now face the next challenge.", 16045, 1, 0, 0, "Lord Jaraxxus - outro"),
(34995, @id-23, "Treacherous Alliance dogs! You summon a demon lord against warriors of the Horde!? Your deaths will be swift!", 16021, 1, 0, 0, "Garrosh Hellscream - Jaraxxus outro"),
(34990, @id-24, "The Alliance doesn't need the help of a demon lord to deal with Horde filth. Come, pig!", 16064, 1, 0, 0, "Varian Wrynn - Jaraxxus outro"),
(36095, @id-25, "Everyone, calm down! Compose yourselves! There is no conspiracy at play here. The warlock acted on his own volition - outside of influences from the Alliance. The tournament must go on!", 16046, 1, 0, 0, "Lord Jaraxxus - intro"),
(36095, @id-26, "The next battle will be against the Argent Crusade's most powerful knights! Only by defeating them will you be deemed worthy...", 16047, 1, 0, 0, "Faction Champions - intro"),
(34995, @id-27, "The Horde demands justice! We challenge the Alliance. Allow us to battle in place of your knights, paladin. We will show these dogs what it means to insult the Horde!", 16023, 1, 0, 0, "Faction Champions - intro2, Ally"),
(34990, @id-28, "Our honor has been besmirched! They make wild claims and false accusations against us. I demand justice! Allow my champions to fight in place of your knights, Tirion. We challenge the Horde!", 16066, 1, 0, 0, "Faction Champions - intro2, Horda"),
(36095, @id-29, "Very well, I will allow it. Fight with honor!", 16048, 1, 0, 0, "Faction Champions - intro3"),
(34995, @id-30, "Show them no mercy, Horde champions! LOK'TAR OGAR!", 16022, 1, 0, 0, "Faction Champions - intro4, Ally"),
(34995, @id-31, "Fight for the glory of the Alliance, heroes! Honor your king and your people!", 16065, 1, 0, 0, "Faction Champions - intro4, Horda"),
(34995, @id-32, "Weakling!", 16017, 1, 0, 0, "Faction Champions - killing an alliance player1"),
(34995, @id-33, "Pathetic!", 16018, 1, 0, 0, "Faction Champions - killing an alliance player2"),
(34995, @id-34, "Overpowered.", 16019, 1, 0, 0, "Faction Champions - killing an alliance player3"),
(34995, @id-35, "Lok'tar!", 16020, 1, 0, 0, "Faction Champions - killing an alliance player4"),
(34990, @id-36, "HAH!", 16060, 1, 0, 0, "Faction Champions - killing an horde player1"),
(34990, @id-37, "Hardly a challenge!", 16061, 1, 0, 0, "Faction Champions - killing an horde player2"),
(34990, @id-38, "Worthless scrub.", 16062, 1, 0, 0, "Faction Champions - killing an horde player3"),
(34990, @id-39, "Is this the best the Horde has to offer?", 16063, 1, 0, 0, "Faction Champions - killing an horde player4"),
(34990, @id-40, "Glory to the Alliance!", 16067, 1, 0, 0, "Faction Champions - victory as ally"),
(34995, @id-41, "That was just a taste of what the future brings. FOR THE HORDE!", 16024, 1, 0, 0, "Faction Champions - victory as horde"),
(36095, @id-42, "A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death.", 16049, 1, 0, 0, "Faction Champions - outro"),
(36095, @id-43, "Only by working together will you overcome the final challenge. From the depths of Icecrown come two of the Scourge's most powerful lieutenants: fearsome val'kyr, winged harbingers of the Lich King!", 16050, 1, 0, 0, "Twin Valkyrs - intro"),
(36095, @id-44, "Let the games begin!", 16037, 1, 0, 0, "Twin Valkyrs - intro2"),
(34497, @id-45, "In the name of our dark master. For the Lich King. You. Will. Die.", 16272, 1, 0, 0, "Fjola - aggro"),
(34496, @id-46, "In the name of our dark master. For the Lich King. You. Will. Die.", 16272, 1, 0, 0, "Eydis - aggro"),
(34497, @id-47, "CHAOS!", 16274, 1, 0, 0, "Fjola - casting twins pact"),
(34496, @id-48, "CHAOS!", 16274, 1, 0, 0, "Eydis - casting twins pact"),
(34497, @id-49, "Let the dark consume you!", 16278, 1, 0, 0, "Fjola - casting dark vortex"),
(34496, @id-50, "Let the dark consume you!", 16278, 1, 0, 0, "Eydis - casting dark vortex"),
(34497, @id-51, "Let the light consume you!", 16279, 1, 0, 0, "Fjola - casting light vortex"),
(34496, @id-52, "Let the light consume you!", 16279, 1, 0, 0, "Eydis - casting light vortex"),
(34497, @id-53, "UNWORTHY!", 16277, 1, 0, 0, "Fjola - killing a player1"),
(34496, @id-54, "UNWORTHY!", 16277, 1, 0, 0, "Eydis - kiling a player1"),
(34497, @id-56, "You have been measured, and found wanting!", 16276, 1, 0, 0, "Fjola - killing a player2"),
(34496, @id-57, "You have been measured, and found wanting!", 16276, 1, 0, 0, "Eydis - kiling a player2"),
(34497, @id-58, "You are finished!", 16273, 1, 0, 0, "Fjola - berserk"),
(34496, @id-59, "You are finished!", 16273, 1, 0, 0, "Eydis - berserk"),
(34497, @id-60, "The Scourge cannot be stopped...", 16275, 1, 0, 0, "Fjola - death"),
(34496, @id-61, "The Scourge cannot be stopped...", 16275, 1, 0, 0, "Eydis - death"),
(34995, @id-62, "Do you still question the might of the Horde, paladin? We will take on all comers!", 16025, 1, 0, 0, "Twin Valkyrs - victory as horde"),
(34990, @id-63, "Not even the Lich King most powerful minions can stand against the Alliance! All hail our victors!", 16068, 1, 0, 0, "Twin Valkyrs - victory as alliance"),
(36095, @id-64, "A mighty blow has been dealt to the Lich King! You have proven yourselves as able bodied champions of the Argent Crusade. Together we will strike at Icecrown Citadel and destroy what remains of the Scourge! There is no challenge that we cannot face united!", 16051, 1, 0, 0, "Anub'arak - intro1"),
(35877, @id-65, "You will have your challenge, Fordring.", 16321, 1, 0, 0, "Anub'arak - intro2"),
(36095, @id-66, "Arthas! You are hopelessly outnumbered! Lay down Frostmourne and I will grant you a just death.", 16052, 1, 0, 0, "Anub'arak - intro3"),
(35877, @id-67, "The Nerubians built an empire beneath the frozen wastes of Northrend. An empire that you so foolishly built your structures upon. MY EMPIRE.", 16322, 1, 0, 0, "Anub'arak - intro4"),
(35877, @id-68, "The souls of your fallen champions will be mine, Fordring.", 16323, 1, 0, 0, "Anub'arak - intro5"),
(34564, @id-69, "Ahhh... Our guests arrived, just as the master promised.", 16235, 1, 0, 0, "Anub'arak - intro6"),
(34564, @id-70, "This place will serve as your tomb!", 16234, 1, 0, 0, "Anub'arak - aggro"),
(34564, @id-71, "Auum na-l ak-k-k-k, isshhh. Rise, minions. Devour...", 16240, 1, 0, 0, "Anub'arak - submerge"),
(34564, @id-72, "The swarm shall overtake you!", 16241, 1, 0, 0, "Anub'arak - leeching swarm"),
(34564, @id-73, "F-lakkh shir!", 16236, 1, 0, 0, "Anub'arak - killing a player1"),
(34564, @id-74, "Another soul to sate the host.", 16237, 1, 0, 0, "Anub'arak - killing a player2"),
(34564, @id-75, "I have failed you, master....", 16238, 1, 0, 0, "Anub'arak - death"),
(36095, @id-76, "Champions, you're alive! Not only have you defeated every challenge of the Trial of the Crusader, but thwarted Arthas directly! Your skill and cunning will prove to be a powerful weapon against the Scourge. Well done! Allow one of my mages to transport you back to the surface!", 0, 1, 0, 0, "Anub'arak - outro");

/* Creature/Instance Templates */
UPDATE creature_template SET ScriptName="boss_gormok_the_impaler" WHERE entry=34796; /* gormok the impaler */
UPDATE creature_template SET ScriptName="boss_acidmaw" WHERE entry=35144; /* acidmaw */
UPDATE creature_template SET ScriptName="boss_dreadscale" WHERE entry=34799; /* dreascale */
UPDATE creature_template SET scriptname="mob_slime_pool" WHERE entry = 35176; /* slime pool - acidmaw's and dreadscale's add */
UPDATE creature_template SET ScriptName="boss_icehowl" WHERE entry=34797; /* icehowl */
UPDATE creature_template SET ScriptName="mob_snobold" WHERE entry=34800; /* Snobold */
UPDATE creature_template SET ScriptName="boss_lord_jaraxxus" WHERE entry=34780; /* Lord Jaraxxus */
UPDATE creature_template SET scriptname="mob_misstress_of_pain" WHERE entry=34826; /* Misstress of pain (Jaraxxus' add) */
UPDATE creature_template SET scriptname="mob_felflame_infernal" WHERE entry=34815; /* Felflame Infernal (Jaraxxus' add) */
UPDATE creature_template SET scriptname="mob_jaraxxus_vulcan" WHERE entry=34813; /* Vulcan, summoned by Lord Jaraxxus, summoning Felflame Infernals */
UPDATE creature_template SET scriptname="mob_jaraxxus_portal" WHERE entry=34825; /* Nether Portal, summoned by Lord Jaraxxus, summonig Misstress of pain */
UPDATE creature_template SET scriptname="mob_legion_flame" WHERE entry = 34784; /* Jaraxxus' spell's effect - summon legion fire, deal damage every sec */

UPDATE creature_template SET scriptname="mob_toc_warrior" WHERE entry IN (34475,34453);
UPDATE creature_template SET scriptname="mob_toc_mage" WHERE entry IN (34468,34449);
UPDATE creature_template SET scriptname="mob_toc_shaman" WHERE entry IN (34470,34444);
UPDATE creature_template SET scriptname="mob_toc_enh_shaman" WHERE entry IN (34463,34455);
UPDATE creature_template SET scriptname="mob_toc_hunter" WHERE entry IN (34467,34448);
UPDATE creature_template SET scriptname="mob_toc_rogue" WHERE entry IN (34472,34454);
UPDATE creature_template SET scriptname="mob_toc_priest" WHERE entry IN (34466,34447);
UPDATE creature_template SET scriptname="mob_toc_shadow_priest" WHERE entry IN (34473,34441);
UPDATE creature_template SET scriptname="mob_toc_dk" WHERE entry IN (34461,34458);
UPDATE creature_template SET scriptname="mob_toc_paladin" WHERE entry IN (34465,34445);
UPDATE creature_template SET scriptname="mob_toc_retro_paladin" WHERE entry IN (34471,34456);
UPDATE creature_template SET scriptname="mob_toc_druid" WHERE entry IN (34469,34459);
UPDATE creature_template SET scriptname="mob_toc_boomkin" WHERE entry IN (34460,34451);
UPDATE creature_template SET scriptname="mob_toc_warlock" where entry IN (34474,34450);
UPDATE creature_template SET scriptname="mob_toc_pet_warlock" WHERE entry IN (35465);
UPDATE creature_template SET scriptname="mob_toc_pet_hunter" WHERE entry IN (35610);

UPDATE creature_template SET ScriptName="boss_light_twin" WHERE entry=34497; /* Fjola Lightbane */
UPDATE creature_template SET ScriptName="boss_dark_twin" WHERE entry=34496; /* Eydis Darkbane */
UPDATE creature_template SET ScriptName="light_essence" WHERE entry=34568; /* Light Essence (twins' fight) */
UPDATE creature_template SET ScriptName="dark_essence" WHERE entry=34567; /* Dark Essence (twins' fight) */
UPDATE creature_template SET ScriptName="mob_concetrated_light" WHERE entry=34630; /* Concentrated Light (twins' fight) */
UPDATE creature_template SET ScriptName="mob_concetrated_dark" WHERE entry=34628; /* Concentrated Dark (twins' fight) */
UPDATE creature_template SET ScriptName="boss_anubarak_trial" WHERE entry=34564; /* Anubarak */
UPDATE creature_template SET ScriptName="mob_swarm_scarab" WHERE entry=34605; /* Anub's adds */
UPDATE creature_template SET ScriptName="mob_nerubian_burrower" WHERE entry=34607; /* Anub's adds */
UPDATE creature_template SET scriptname="mob_anubarak_spike" WHERE entry=34660;
UPDATE creature_template SET ScriptName="mob_frost_sphere" WHERE entry = 34606;
UPDATE creature_template SET ScriptName="toc_tirion_fordring" WHERE entry=34996; /* Tirion Fordring */
UPDATE creature_template SET ScriptName="toc_barrett_ramsey" WHERE entry=34816; /* Barrett Ramsey (Arena Master) */
UPDATE instance_template SET script="instance_trial_of_the_crusader" WHERE map=649; /* Instance */

/* Additional */
UPDATE creature_template SET npcflag=1 WHERE entry IN(34816, 3481601, 3481602, 3481603, 34568, 3456801, 3456802, 3456803, 34567, 3456701, 3456702, 3456703); /* Make Barrett Ramsey, Dark and Light Essenes gossip creatures */
UPDATE creature_template SET IconName="Interact" WHERE entry IN(34568, 3456801, 3456802, 3456803, 34567, 3456701, 3456702, 3456703); /* Change white chat bubble on interaction wheel when mouse-overing Light and Dark Essences */
UPDATE creature_template SET unit_flags=4 WHERE entry IN(34813, 3481301, 3481302, 3481303, 34825, 3482501, 3482502, 3482503); /* Disable move for Jaraxxus' portals and vulcans */
UPDATE creature_template SET unit_flags=unit_flags|4 WHERE entry in (34784, 3478401, 3478402, 3478403); /* Disable move for Jaraxxus' spell's Legion Fire */
UPDATE creature_template SET modelid1=30039, modelid2=30039 where entry IN (348125, 3482501, 3482502, 3482503);  /* Set correct model for Jaraxxus' portal */
UPDATE creature_template SET faction_A=189, faction_H=189 WHERE entry IN (34605, 3460501, 3460502, 3460503); /* Make swarm scarab's neutral for players, faction switch implemented in anub's script */
UPDATE creature_template SET flags_extra=2 WHERE entry IN (34630, 3463001, 3463002, 3463003, 34628, 3462801, 3462802, 3462803); /* Makes Concentraded Energies ignore aggro */

/* Loot and Tribute Chests (from TC forum, thanks Gyullo) */
-- Chest Templates (this are for 10 Heroic)
DELETE FROM `gameobject_template` WHERE entry IN (195665,195666,195667,195668);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
(195665, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27514, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723),
(195666, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27515, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723),
(195667, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27516, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723),
(195668, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27513, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);

-- Chest Templates (this are for 25 Heroic)
DELETE FROM `gameobject_template` WHERE entry IN (195669,195670,195671,195672);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
(195669, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27512, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723),
(195670, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27517, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723),
(195671, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27518, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723),
(195672, 3, 9069, 'Argent Crusade Tribute Chest', '', '', '', 0, 0, 1.5, 0, 0, 0, 0, 0, 0, 1634, 27511, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 11723);

-- 10H mode (1-24 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27513;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27513,47242,100,1,0,2,2), -- 2 Trophys
(27513,47556,100,1,0,1,1); -- 1 Crusader Orb

-- 10H mode (25-44 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27514;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27514,47242,100,1,0,2,2), -- 2 Trophys
(27514,47556,100,1,0,1,1), -- 1 Crusader Orb
-- Alliance Loot (Handdle by conditions)
(27514,48713,0,1,1,1,1),
(27514,48711,0,1,1,1,1),
(27514,48712,0,1,1,1,1),
(27514,48714,0,1,1,1,1),
(27514,48709,0,1,1,1,1),
(27514,48710,0,1,1,1,1),
(27514,48708,0,1,1,1,1),
-- Horde Loot (Handdle by conditions)
(27514,48695,0,1,2,1,1),
(27514,48697,0,1,2,1,1),
(27514,48703,0,1,2,1,1),
(27514,48699,0,1,2,1,1),
(27514,48693,0,1,2,1,1),
(27514,48705,0,1,2,1,1),
(27514,48701,0,1,2,1,1);

-- 10H mode (45-49 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27515;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27515,47242,100,1,0,4,4), -- 4 Trophys
(27515,47556,100,1,0,1,1), -- 1 Crusader Orb
-- Alliance Loot (Handdle by conditions)
(27515,48713,0,1,1,1,1),
(27515,48711,0,1,1,1,1),
(27515,48712,0,1,1,1,1),
(27515,48714,0,1,1,1,1),
(27515,48709,0,1,1,1,1),
(27515,48710,0,1,1,1,1),
(27515,48708,0,1,1,1,1),
-- Horde Loot (Handdle by conditions)
(27515,48695,0,1,2,1,1),
(27515,48697,0,1,2,1,1),
(27515,48703,0,1,2,1,1),
(27515,48699,0,1,2,1,1),
(27515,48693,0,1,2,1,1),
(27515,48705,0,1,2,1,1),
(27515,48701,0,1,2,1,1);

-- 10H mode (50 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27516;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27516,47242,100,1,0,4,4), -- 4 Trophys
(27516,47556,100,1,0,1,1), -- 1 Crusader Orb
-- Alliance Loot (Handdle by conditions)
(27516,48713,0,1,1,1,1),
(27516,48711,0,1,1,1,1),
(27516,48712,0,1,1,1,1),
(27516,48714,0,1,1,1,1),
(27516,48709,0,1,1,1,1),
(27516,48710,0,1,1,1,1),
(27516,48708,0,1,1,1,1),
-- Horde Loot (Handdle by conditions)
(27516,48695,0,1,2,1,1),
(27516,48697,0,1,2,1,1),
(27516,48703,0,1,2,1,1),
(27516,48699,0,1,2,1,1),
(27516,48693,0,1,2,1,1),
(27516,48705,0,1,2,1,1),
(27516,48701,0,1,2,1,1),
-- Second Alliance Loot (Handdle by conditions)
(27516,49044,100,1,0,1,1),
(27516,48673,0,1,3,1,1),
(27516,48675,0,1,3,1,1),
(27516,48674,0,1,3,1,1),
(27516,48671,0,1,3,1,1),
(27516,48672,0,1,3,1,1),
-- Second Horde Loot (Handdle by conditions)
(27516,49046,100,1,0,1,1),
(27516,48668,0,1,4,1,1),
(27516,48670,0,1,4,1,1),
(27516,48669,0,1,4,1,1),
(27516,48666,0,1,4,1,1),
(27516,48667,0,1,4,1,1);

SET @RefTribute := 51000;

DELETE FROM `reference_loot_template` WHERE entry=@RefTribute;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@RefTribute,47557,0,1,1,1,1),
(@RefTribute,47558,0,1,1,1,1),
(@RefTribute,47559,0,1,1,1,1);

-- 25H mode (1-24 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27511;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27511,1,100,1,0,-@RefTribute,2); -- 2 Tokens

-- 25H mode (25-44 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27512;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27512,1,100,1,0,-@RefTribute,2), -- 2 Tokens

-- Alliance Loot (Handdle by conditions)
(27512,47521,0,1,1,1,1),
(27512,47526,0,1,1,1,1),
(27512,47519,0,1,1,1,1),
(27512,47524,0,1,1,1,1),
(27512,47517,0,1,1,1,1),
(27512,47506,0,1,1,1,1),
(27512,47515,0,1,1,1,1),

-- Horde Loot (Handdle by conditions)
(27512,47523,0,1,2,1,1),
(27512,47528,0,1,2,1,1),
(27512,47520,0,1,2,1,1),
(27512,47525,0,1,2,1,1),
(27512,47518,0,1,2,1,1),
(27512,47513,0,1,2,1,1),
(27512,47516,0,1,2,1,1);

-- 25H mode (45-49 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27517;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27517,1,100,1,0,-@RefTribute,2), -- 2 Tokens
(27517,2,100,1,0,-@RefTribute,2), -- 2 Tokens

-- Alliance Loot (Handdle by conditions)
(27517,47521,0,1,1,1,1),
(27517,47526,0,1,1,1,1),
(27517,47519,0,1,1,1,1),
(27517,47524,0,1,1,1,1),
(27517,47517,0,1,1,1,1),
(27517,47506,0,1,1,1,1),
(27517,47515,0,1,1,1,1),

-- Horde Loot (Handdle by conditions)
(27517,47523,0,1,2,1,1),
(27517,47528,0,1,2,1,1),
(27517,47520,0,1,2,1,1),
(27517,47525,0,1,2,1,1),
(27517,47518,0,1,2,1,1),
(27517,47513,0,1,2,1,1),
(27517,47516,0,1,2,1,1);

-- 25H mode (50 trys remaining)
DELETE FROM `gameobject_loot_template` WHERE entry=27518;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(27518,1,100,1,0,-@RefTribute,2), -- 2 Tokens
(27518,2,100,1,0,-@RefTribute,2), -- 2 Tokens
-- Alliance Loot (Handdle by conditions)
(27518,47521,0,1,1,1,1),
(27518,47526,0,1,1,1,1),
(27518,47519,0,1,1,1,1),
(27518,47524,0,1,1,1,1),
(27518,47517,0,1,1,1,1),
(27518,47506,0,1,1,1,1),
(27518,47515,0,1,1,1,1),
-- Horde Loot (Handdle by conditions)
(27518,47523,0,1,2,1,1),
(27518,47528,0,1,2,1,1),
(27518,47520,0,1,2,1,1),
(27518,47525,0,1,2,1,1),
(27518,47518,0,1,2,1,1),
(27518,47513,0,1,2,1,1),
(27518,47516,0,1,2,1,1),
-- Second Alliance Loot (Handdle by conditions)
(27518,49096,100,1,0,1,1),
(27518,47553,0,1,3,1,1),
(27518,47552,0,1,3,1,1),
(27518,47549,0,1,3,1,1),
(27518,47547,0,1,3,1,1),
(27518,47545,0,1,3,1,1),
-- Second Horde Loot (Handdle by conditions)
(27518,49098,100,1,0,1,1),
(27518,47554,0,1,4,1,1),
(27518,47551,0,1,4,1,1),
(27518,47550,0,1,4,1,1),
(27518,47548,0,1,4,1,1),
(27518,47546,0,1,4,1,1);

/* Achievements criteria (thanks Gyullo) */
-- 10 Normal
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11684,11685,11686,11687,11688);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Crusade (10 player)
(11684,12,0,0),
(11685,12,0,0),
(11686,12,0,0),
(11687,12,0,0),
(11688,12,0,0);

-- 10 Hero
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11690,11689,11682,11693,11691);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Grand Crusade (10 player)
(11690,12,2,0),
(11689,12,2,0),
(11682,12,2,0),
(11693,12,2,0),
(11691,12,2,0);

-- 25 normal
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11679,11683,11680,11682,11681);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Crusade (25 player)
(11679,12,1,0),
(11683,12,1,0),
(11680,12,1,0),
(11682,12,1,0),
(11681,12,1,0);

-- 25 Hero
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (11542,11546,11547,11549,11678,12350);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Call of the Grand Crusade (25 player)
(11542,12,3,0),
(11546,12,3,0),
(11547,12,3,0),
(11549,12,3,0),
(11678,12,3,0),
-- Realm First! Grand Crusader
(12350,12,3,0);

/* Immunes:
 * charm, cofused, disarm, distract, fear, root, pacifi, silence, sleep, snare, stun, freeze, knockout, polymorph, banish, shackle, horror, daze, sapped (in order)
 * For:
 * Gormok, Acidmaw, Dreadscale, Icehowl, Jaraxxus, Fjola, Eydis and Anubarak
 */
UPDATE creature_template SET mechanic_immune_mask=1|2|4|8|16|64|128|256|512|1024|2048|4096|8192|65536|131072|524288|8388608|67108864|536870912 WHERE entry IN
(34796, 3479601, 3479602, 3479603,
 35144, 3514401, 3514402, 3514403,
 34799, 3479901, 3479902, 3479903,
 34797, 3479701, 3479702, 3479703,
 34780, 3478001, 3478002, 3478003,
 34497, 3449701, 3449702, 3449703,
 34496, 3449601, 3449602, 3449603,
 34564, 3456401, 3456402, 3456403,
 34800, 3480001, 3480002, 3480003);

-- Last StartUP error fix. 
UPDATE creature_template SET ScriptName="mob_cat" WHERE entry=35610;

-- If you can`t Hit Anub. 
/* UPDATE `creature_template` SET `unit_flags` = '0' WHERE `creature_template`.`entry` =34564; */
-- REMOVE " /* */ " for use!

-- TOC original texts/sounds (thanks to griffonheart)
-- english translation by Cristy
-- reworked by rsa
-- reworked by JohnHoliver
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1649999 AND -1649000;
INSERT INTO `script_texts`
(`comment`,`sound`, `entry`,`type`,`language`,`emote`,`content_default`) VALUES
-- Northrend Beasts
-- Gormok
('34796','0','-1649000','3','0','0','My slaves! Destroy the enemy!'),
-- Acidmaw & Dreadscale
('34564','0','-1649010','3','0','0','%s buries itself in the earth!'),
('34564','0','-1649011','3','0','0','%s getting out of the ground!'),
('34799','0','-1649012','3','0','0','At its companion perishes, %s becomes enraged!'),
-- Icehowl
('34797','0','-1649020','3','0','0','%s looks at |3-3($n) and emits a guttural howl!'),
('34797','0','-1649021','3','0','0','%s crashes into a wall of the Colosseum and lose focus!'),
('34797','0','-1649022','3','0','0','|3-3(%s) covers boiling rage, and he tramples all in its path!'),
-- Jaraxxus
('34780','16143','-1649030','1','0','0','Trifling gnome, your arrogance will be your undoing!'),
('34780','16144','-1649031','1','0','0','You face Jaraxxus, eredar lord of the Burning Legion!'),
('34780','16147','-1649032','1','0','0','Another will take my place. Your world is doomed.'),
('34780','0','-1649033','3','0','0','$n has |cFF00FFFFIncinerate flesh!|R Heal $ghim:her;!'),
('34780','16149','-1649034','1','0','0','FLESH FROM BONE!'),
('34780','0','-1649035','3','0','0','|cFFFF0000Legion Flame|R on $n'),
('34780','0','-1649036','3','0','0','%s creates the gates of the Void!'),
('34780','16150','-1649037','1','0','0','Come forth, sister! Your master calls!'),
('34780','0','-1649038','3','0','0','%s creates an |cFF00FF00Infernal Volcano!|R'),
('34780','16151','-1649039','1','0','0','INFERNO!'),
-- Faction Champions
('34995','0','-1649115','1','0','0','Weakling!'),
('34995','0','-1649116','1','0','0','Pathetic!'),
('34995','0','-1649117','1','0','0','Overpowered.'),
('34995','0','-1649118','1','0','0','Lok\'tar!'),
('34990','0','-1649120','1','0','0','HAH!'),
('34990','0','-1649121','1','0','0','Hardly a challenge!'),
('34990','0','-1649122','1','0','0','Worthless scrub.'),
('34990','0','-1649123','1','0','0','Is this the best the Horde has to offer?'),
-- Twin Valkyrs
('34497','16272','-1649040','1','0','0','In the name of our dark master. For the Lich King. You. Will. Die.'),
('34496','16275','-1649041','1','0','0','The Scourge cannot be stopped...'),
('34497','16273','-1649042','1','0','0','YOU ARE FINISHED!'),
('34497','0','-1649043','3','0','0','%s begins to read the spell Treaty twins!'),
('34497','16274','-1649044','3','0','0','CHAOS!'),
('34496','16277','-1649045','1','0','0','UNWORTHY!'),
('34497','16276','-1649046','1','0','0','You appreciated and acknowledged nothing.'),
('34497','0','-1649047','3','0','0','%s begins to read a spell |cFFFFFFFFLight Vortex!|R switch to |cFFFFFFFFLight|r essence!'),
('34496','16279','-1649048','1','0','0','Let the light consume you!'),
('34496','0','-1649049','3','0','0','%s begins to read a spell |cFF9932CDBlack Vortex!|R switch to |cFF9932CDBlack|r essence!'),
('34496','16278','-1649050','1','0','0','Let the dark consume you!'),
-- Anub'arak
('34564','16235','-1649055','1','0','0','Ahhh... Our guests arrived, just as the master promised.'),
('34564','16234','-1649056','1','0','0','This place will serve as your tomb!'),
('34564','16236','-1649057','1','0','0','F-lakkh shir!'),
('34564','16237','-1649058','1','0','0','Another soul to sate the host.'),
('34564','16238','-1649059','1','0','0','I have failed you, master...'),
('34564','0','-1649060','3','0','0','%s spikes  pursuing $n!'),
('34564','16240','-1649061','1','0','0','Auum na-l ak-k-k-k, isshhh. Rise, minions. Devour...'),
('34564','0','-1649062','3','0','0','%s produces a swarm of beetles Peon to restore your health!'),
('34564','16241','-1649063','1','0','0','The swarm shall overtake you!'),
-- Event
-- Northrend Beasts
('34996','16036','-1649070','1','0','0','Welcome champions, you have heard the call of the Argent Crusade and you have boldly answered. It is here in the crusaders coliseum that you will face your greatest challenges. Those of you who survive the rigors of the coliseum will join the Argent Crusade on its marsh to ice crown citadel.'),
('34996','16038','-1649071','1','0','0','Hailing from the deepest, darkest carverns of the storm peaks, Gormok the Impaler! Battle on, heroes!'),
('34990','16069','-1649072','1','0','0','Your beast will be no match for my champions Tirion!'),
('34995','16026','-1649073','1','0','0','I have seen  more  worthy  challenges in the ring of blood, you waste our time paladin.'),
('34996','16039','-1649074','1','0','0','Steel yourselves, heroes, for the twin terrors Acidmaw and Dreadscale. Enter the arena!'),
('34996','16040','-1649075','1','0','0','The air freezes with the introduction of our next combatant, Icehowl! Kill or be killed, champions!'),
('34996','16041','-1649076','1','0','0','The monstrous menagerie has been vanquished!'),
('34996','16042','-1649077','1','0','0','Tragic... They fought valiantly, but the beasts of Northrend triumphed. Let us observe a moment of silence for our fallen heroes.'),
-- Jaraxxus
('34996','16043','-1649080','1','0','0','Grand Warlock Wilfred Fizzlebang will summon forth your next challenge. Stand by for his entry!'),
('35458','16268','-1649081','1','0','0','Thank you, Highlord! Now challengers, I will begin the ritual of summoning! When I am done, a fearsome Doomguard will appear!'),
('35458','16269','-1649082','1','0','0','Prepare for oblivion!'),
('35458','16270','-1649083','1','0','0','Ah ha! Behold the absolute power of Wilfred Fizzlebang, master summoner! You are bound to ME, demon!'),
('35458','16271','-1649084','1','0','0','But I am in charge here-'),
('35458','0','-1649085','1','0','0','...'),
('34996','16044','-1649086','1','0','0','Quickly, heroes! Destroy the demon lord before it can open a portal to its twisted demonic realm!'),
('34996','16045','-1649087','1','0','0','The loss of Wilfred Fizzlebang, while unfortunate, should be a lesson to those that dare dabble in dark magic. Alas, you are victorious and must now face the next challenge.'),
('34995','16021','-1649088','1','0','0','Treacherous Alliance dogs! You summon a demon lord against warriors of the Horde!? Your deaths will be swift!'),
('34990','16064','-1649089','1','0','0','The Alliance doesnt need the help of a demon lord to deal with Horde filth. Come, pig!'),
('34996','16046','-1649090','1','0','0','Everyone, calm down! Compose yourselves! There is no conspiracy at play here. The warlock acted on his own volition - outside of influences from the Alliance. The tournament must go on!'),
-- Faction Champions
('34996','16047','-1649091','1','0','0','The next battle will be against the Argent Crusades most powerful knights! Only by defeating them will you be deemed worthy...'),
('34990','16066','-1649092','1','0','0','Our honor has been besmirched! They make wild claims and false accusations against us. I demand justice! Allow my champions to fight in place of your knights, Tirion. We challenge the Horde!'),
('34995','16023','-1649093','1','0','0','The Horde demands justice! We challenge the Alliance. Allow us to battle in place of your knights, paladin. We will show these dogs what it means to insult the Horde!'),
('34996','16048','-1649094','1','0','0','Very well, I will allow it. Fight with honor!'),
('34990','16065','-1649095','1','0','0','Fight for the glory of the Alliance, heroes! Honor your king and your people!'),
('34995','16022','-1649096','1','0','0','Show them no mercy, Horde champions! LOK-TAR OGAR!'),
('34990','16067','-1649097','1','0','0','GLORY OF THE ALLIANCE!'),
('34995','16024','-1649098','1','0','0','LOK-TAR OGAR!'),
('34996','16049','-1649099','1','0','0','A shallow and tragic victory. We are weaker as a whole from the losses suffered today. Who but the Lich King could benefit from such foolishness? Great warriors have lost their lives. And for what? The true threat looms ahead - the Lich King awaits us all in death.'),
-- Twin Valkyrs
('34996','16050','-1649100','1','0','0','Only by working together will you overcome the final challenge. From the depths of Icecrown come two of the Scourges most powerful lieutenants: fearsome valkyr, winged harbingers of the Lich King!'),
('34996','16037','-1649101','1','0','0','Let the games begin!'),
('34990','16068','-1649102','1','0','0','Not even the Lich King most powerful minions can stand against the Alliance! All hail our victors!'),
('34995','16025','-1649103','1','0','0','Do you still question the might of the horde paladin? We will take on all comers.'),
-- Anub'arak
('34996','16051','-1649104','1','0','0','A mighty blow has been dealt to the Lich King! You have proven yourselves able bodied champions of the Argent Crusade. Together we will strike at Icecrown Citadel and destroy what remains of the Scourge! There is no challenge that we cannot face united!'),
('35877','16321','-1649105','1','0','0','You will have your challenge, Fordring.'),
('34996','16052','-1649106','1','0','0','Arthas! You are hopelessly outnumbered! Lay down Frostmourne and I will grant you a just death.'),
('35877','16322','-1649107','1','0','0','The Nerubians built an empire beneath the frozen wastes of Northrend. An empire that you so foolishly built your structures upon. MY EMPIRE.'),
('35877','16323','-1649108','1','0','0','The souls of your fallen champions will be mine, Fordring.'),
('36095','0','-1649109','1','0','0','Champions, you are alive! Not only have you defeated every challenge of the Trial of the Crusader, but thwarted Arthas directly! Your skill and cunning will prove to be a powerful weapon against the Scourge. Well done! Allow one of my mages to transport you back to the surface!'),
('36095','0','-1649110','1','0','0','Let me hand you the chests as a reward, and let its contents will serve you faithfully in the campaign against Arthas in the heart of the Icecrown Citadel!');

-- Faction Champions
UPDATE `creature_template` SET `scriptname`='mob_toc_warrior', `AIName` ='' WHERE `entry` IN (34475,34453);
UPDATE `creature_template` SET `scriptname`='mob_toc_mage', `AIName` ='' WHERE `entry` IN (34468,34449);
UPDATE `creature_template` SET `scriptname`='mob_toc_shaman', `AIName` ='' WHERE `entry` IN (34470,34444);
UPDATE `creature_template` SET `scriptname`='mob_toc_enh_shaman', `AIName` ='' WHERE `entry` IN (34463,34455);
UPDATE `creature_template` SET `scriptname`='mob_toc_hunter', `AIName` ='' WHERE `entry` IN (34467,34448);
UPDATE `creature_template` SET `scriptname`='mob_toc_rogue', `AIName` ='' WHERE `entry` IN (34472,34454);
UPDATE `creature_template` SET `scriptname`='mob_toc_priest', `AIName` ='' WHERE `entry` IN (34466,34447);
UPDATE `creature_template` SET `scriptname`='mob_toc_shadow_priest', `AIName` ='' WHERE `entry` IN (34473,34441);
UPDATE `creature_template` SET `scriptname`='mob_toc_dk', `AIName` ='' WHERE `entry` IN (34461,34458);
UPDATE `creature_template` SET `scriptname`='mob_toc_paladin', `AIName` ='' WHERE `entry` IN (34465,34445);
UPDATE `creature_template` SET `scriptname`='mob_toc_retro_paladin', `AIName` ='' WHERE `entry` IN (34471,34456);
UPDATE `creature_template` SET `scriptname`='mob_toc_druid', `AIName` ='' WHERE `entry` IN (34469,34459);
UPDATE `creature_template` SET `scriptname`='mob_toc_boomkin', `AIName` ='' WHERE `entry` IN (34460,34451);
UPDATE `creature_template` SET `scriptname`='mob_toc_warlock' WHERE `entry` IN (34474,34450);
UPDATE `creature_template` SET `scriptname`='mob_toc_pet_warlock', `AIName` ='' WHERE `entry` IN (35465);
UPDATE `creature_template` SET `scriptname`='mob_toc_pet_hunter', `AIName` ='' WHERE `entry` IN (35610);
