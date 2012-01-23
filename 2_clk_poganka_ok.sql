-- == ================= ==
-- ==     DROP LIST 27  ==
-- == ================= ==

-- Prevent query execution stop on '' statement
-- SET max_error_count=0;

-- Procedures
DROP PROCEDURE IF EXISTS `sp_CheckNPCOrGO`;
DROP PROCEDURE IF EXISTS `sp_CheckGobjEntry`;
DROP PROCEDURE IF EXISTS `sp_CheckNpcEntry`;
DROP PROCEDURE IF EXISTS `sp_CheckQuestEntry`;
DROP PROCEDURE IF EXISTS `sp_CheckTriggerId`;
DROP PROCEDURE IF EXISTS `sp_eai_CastSpellOnSpawn`;
DROP PROCEDURE IF EXISTS `sp_eai_KillCreditOnDeath`;
DROP PROCEDURE IF EXISTS `sp_eai_KillCreditOnSpellhit`;
DROP PROCEDURE IF EXISTS `sp_eai_selectID`;
DROP PROCEDURE IF EXISTS `sp_GetDifficultyEntry`;
DROP PROCEDURE IF EXISTS `sp_GetLootIdForChest`;
DROP PROCEDURE IF EXISTS `sp_GetReferenceId`;
DROP PROCEDURE IF EXISTS `sp_IgnoreAggro`;
DROP PROCEDURE IF EXISTS `sp_KillQuestgiver`;
DROP PROCEDURE IF EXISTS `sp_MakeAttackable`;
DROP PROCEDURE IF EXISTS `sp_MakeLootable`;
DROP PROCEDURE IF EXISTS `sp_MakeNotAttackable`;
DROP PROCEDURE IF EXISTS `sp_MakeNotLootable`;
DROP PROCEDURE IF EXISTS `sp_NotIgnoreAggro`;
DROP PROCEDURE IF EXISTS `sp_QuestRelations`;
DROP PROCEDURE IF EXISTS `sp_SetFaction`;
DROP PROCEDURE IF EXISTS `sp_SetLootId`;
DROP PROCEDURE IF EXISTS `sp_SetLootIdByList`;
DROP PROCEDURE IF EXISTS `sp_SetNotSelectable`;
DROP PROCEDURE IF EXISTS `sp_SetQuestlevel`;
DROP PROCEDURE IF EXISTS `sp_SetSelectable`;
DROP PROCEDURE IF EXISTS `sp_SpellScriptTarget`;
DROP PROCEDURE IF EXISTS `sp_TriggerSettings`;
DROP PROCEDURE IF EXISTS `sp_ReGuidAlterTables`;
DROP PROCEDURE IF EXISTS `sp_ReGuid`;
DROP PROCEDURE IF EXISTS `sp_eAI_SpawnOnSpellhit`;
DROP PROCEDURE IF EXISTS `sp_GetEntryList`;
DROP PROCEDURE IF EXISTS `sp_eAI_TablePhaseMask`;
DROP PROCEDURE IF EXISTS `sp_eAI_InversePhaseMask`;
DROP PROCEDURE IF EXISTS `sp_UpdateByList`;
DROP PROCEDURE IF EXISTS `sp_UpdateDifficultyEntries`;
DROP PROCEDURE IF EXISTS `sp_UpdateByMap`;

-- == =================== ==
-- ==   DROP LIST 29      ==
-- == =================== ==

DROP PROCEDURE IF EXISTS `sp_error_trigger`;
DROP PROCEDURE IF EXISTS `sp_error_entry`;
DROP PROCEDURE IF EXISTS `sp_error_guid`;
DROP PROCEDURE IF EXISTS `sp_set_npc_lootable_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_lootable`;
DROP PROCEDURE IF EXISTS `sp_set_npc_civilian_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_civilian`;
DROP PROCEDURE IF EXISTS `sp_set_npc_attackable`;
DROP PROCEDURE IF EXISTS `sp_set_npc_attackable_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_targetable`;
DROP PROCEDURE IF EXISTS `sp_set_npc_targetable_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_aggro`;
DROP PROCEDURE IF EXISTS `sp_set_npc_aggro_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_faction`;
DROP PROCEDURE IF EXISTS `sp_set_npc_faction_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_selectable`;
DROP PROCEDURE IF EXISTS `sp_set_npc_selectable_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_deadquest`;
DROP PROCEDURE IF EXISTS `sp_set_spell_target`;
DROP PROCEDURE IF EXISTS `sp_set_npc_trigger`;
DROP PROCEDURE IF EXISTS `sp_set_npc_trigger_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_lootid`;
DROP PROCEDURE IF EXISTS `sp_set_npc_lootid_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_npc_lootid_bytable`;
DROP PROCEDURE IF EXISTS `sp_set_npc_path`;
DROP PROCEDURE IF EXISTS `sp_set_item_money`;
DROP PROCEDURE IF EXISTS `sp_set_item_money_bylist`;
DROP PROCEDURE IF EXISTS `sp_set_entry_list`;
DROP PROCEDURE IF EXISTS `sp_set_quest_previous`;
DROP PROCEDURE IF EXISTS `sp_set_quest_next`;
DROP PROCEDURE IF EXISTS `sp_set_quest_level`;
DROP PROCEDURE IF EXISTS `sp_get_ref_id`;
DROP PROCEDURE IF EXISTS `sp_get_npc_diffentry`;
DROP PROCEDURE IF EXISTS `sp_get_go_lootid`;
DROP PROCEDURE IF EXISTS `sp_eai_inverse_phase_mask`;
DROP PROCEDURE IF EXISTS `sp_eai_table_phase_mask`;
DROP PROCEDURE IF EXISTS `sp_eai_select_id`;
DROP PROCEDURE IF EXISTS `sp_eai_quest_credit_on_spellhit`;
DROP PROCEDURE IF EXISTS `sp_eai_spawn_spellhit`;
DROP PROCEDURE IF EXISTS `sp_eai_cast_onspawn`;
DROP PROCEDURE IF EXISTS `sp_eai_kill_ondeath`;
DROP PROCEDURE IF EXISTS `sp_dev_re_guid`;
DROP PROCEDURE IF EXISTS `sp_dev_reguid_alter_tables`;
DROP PROCEDURE IF EXISTS `sp_dev_cleanup_world`;
DROP PROCEDURE IF EXISTS `sp_dev_cleanup_loot`;
DROP PROCEDURE IF EXISTS `sp_dev_cleanup_reference_loot`;
DROP PROCEDURE IF EXISTS `sp_delete_spell_area`;
DROP PROCEDURE IF EXISTS `sp_delete_spell_position`;
DROP PROCEDURE IF EXISTS `sp_delete_spell_position_bylist`;
DROP PROCEDURE IF EXISTS `sp_delete_spell_target`;
DROP PROCEDURE IF EXISTS `sp_delete_questgiver`;
DROP PROCEDURE IF EXISTS `sp_delete_questtaker`;
DROP PROCEDURE IF EXISTS `sp_delete_spawn`;
DROP PROCEDURE IF EXISTS `sp_delete_script`;
DROP PROCEDURE IF EXISTS `sp_delete_script_bylist`;
DROP PROCEDURE IF EXISTS `sp_delete_npc_trainer`;
DROP PROCEDURE IF EXISTS `sp_delete_npc_vendor`;
DROP PROCEDURE IF EXISTS `sp_delete_loot`;

-- == =================== ==
-- ==   UPDATEPACK 29     ==
-- == =================== ==

-- == =================== ==
-- == delete procedures   ==
-- == =================== ==

DELIMITER //

-- sp_delete_spell_area
CREATE PROCEDURE `sp_delete_spell_area`(IN spell_id INT(10), IN area_id INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: spell_area
 * PROCS USED:  none
 *
 * spell_id - NULLABLE. If present, deletes using the spell as a qualifier (if null, only uses area)
 * area_id - NULLABLE. If present, deletes using the area as a qualifier (if null, only uses spell)
 *
 * CALL `sp_delete_spell_area`(1000,NULL); -- delete spell_area entry for spell 1000
 * CALL `sp_delete_spell_area`(NULL,200); -- delete spell_area entry for area 200
 * CALL `sp_delete_spell_area`(1000,200); -- deletes spell_area entry for spell 1000 and area 200
 */ 
	IF spell_id IS NOT NULL OR area_id IS NOT NULL THEN
		DELETE FROM `spell_area` WHERE `spell`=IFNULL(spell_id,`spell`) AND `area`=IFNULL(area_id,`area`);
	ELSE
		CALL MUST_PROVIDE_SPELL_OR_AREA;
	END IF;
END //
	
-- sp_delete_spell_position
CREATE PROCEDURE `sp_delete_spell_position`(IN spell_id INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: spell_area
 * PROCS USED:  none
 *
 * CALL `sp_delete_spell_position` (1000); -- delete spell target position entry for spell 1000
 */
	DELETE FROM `spell_target_position` WHERE `id`=spell_id;
END //

-- sp_delete_spell_position_bylist
CREATE PROCEDURE `sp_delete_spell_position_bylist`(IN spell_list LONGTEXT)
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: spell_area
 * PROCS USED:  none
 *
 * CALL `sp_delete_spell_position` (1000); -- delete spell target position entry for spell 1000
 */
	CALL `sp_set_entry_list` (spell_list,null);

	DELETE FROM `spell_target_position` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);

	DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END //

-- sp_delete_spell_target
CREATE PROCEDURE `sp_delete_spell_target` (IN spell_id INT(10),IN target_entry INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: spell_script_target
 * PROCS USED:  none
 *
 * spell_id - NULLABLE. If present, the spell is used as a qualifier (if null, only use target)
 * target_entry - NULLABLE. If present, the target (either gobj or npc) is used as a qualifer (if null, only use spell)
 *
 * Remove quest relations for gameobject, example of use:
 * CALL `sp_delete_spell_target`(1000,NULL); -- deletes spell_script_target for spell 1000
 * CALL `sp_delete_spell_target`(NULL,200); -- deletes required targets with target entry of creature/gobj id 200
 * CALL `sp_delete_spell_target`(1000,200); -- deletes spell required target for spell id 1000 and creature/gobj entry of 200 only (safest way to delete spell target)
 */
	IF spell_id IS NOT NULL OR target_entry IS NOT NULL THEN
		DELETE FROM `spell_script_target` WHERE `entry`=IFNULL(spell_id,`entry`) AND `targetEntry`=IFNULL(target_entry,`targetEntry`);
	ELSE
		CALL MUST_PROVIDE_SPELL_OR_TARGET;
	END IF;
END //

-- sp_delete_questgiver	
CREATE PROCEDURE `sp_delete_questgiver`(IN qg_type VARCHAR(10),IN qg_entry INT(10), IN quest_entry INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: gameobject_questrelation
 * PROCS USED:  none
 *
 * qg_type - The type of quest giver. the only acceptable values are 'GO' and 'NPC'
 * qg_entry - NULLABLE. If present, entry of the gobj or npc whose questrelations is used as a qualifier (if null, only the quest_entry is used)
 * quest_entry - NULLABLE. If present, entry of the quest to use as a qualifier (if null, only the entry is used)
 *
 * CALL `sp_delete_questgiver`('GO',1000,NULL); -- deletes all quest given by object id 1000
 * CALL `sp_delete_questgiver`('GO',NULL,200); -- deletes all go relations to quest 200
 * CALL `sp_delete_questgiver`('NPC',1000,200); -- deletes where NPC 1000 gives quest 200
 */
	IF qg_entry IS NOT NULL OR quest_entry IS NOT NULL THEN
		CASE UCASE(qg_type)
			WHEN 'NPC' THEN BEGIN
				DELETE FROM `creature_questrelation` WHERE `id`=IFNULL(qg_entry,`id`) AND `quest`=IFNULL(quest_entry,`quest`);
			END;
			WHEN 'GO' THEN BEGIN
				DELETE FROM `gameobject_questrelation` WHERE `id`=IFNULL(qg_entry,`id`) AND `quest`=IFNULL(quest_entry,`quest`);
			END;
			ELSE CALL INVALID_ENTRY_TYPE;
		END CASE;
	ELSE CALL MUST_PROVIDE_ENTRY_OR_QUEST;
	END IF;
END //

-- sp_delete_questtaker
CREATE PROCEDURE `sp_delete_questtaker`(IN qt_type VARCHAR(10),IN qt_entry INT(10), IN quest_entry INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: gameobject_questrelation
 * PROCS USED:  none
 *
 * qt_type - The type of quest taker. the only acceptable values are 'GO' and 'NPC'
 * qt_entry - NULLABLE. If present, entry of the gobj or npc whose involvedrelations is used as a qualifier (if null, only the quest_entry is used)
 * quest_entry - NULLABLE. If present, entry of the quest to use as a qualifier (if null, only the entry is used)
 *
 * CALL `sp_delete_questtaker`('GO',1000,NULL); -- deletes all quest taken by object id 1000
 * CALL `sp_delete_questtaker`('GO',NULL,200); -- deletes all go involved gobjs to quest 200
 * CALL `sp_delete_questtaker`('NPC',1000,200); -- deletes where NPC 1000 takes quest 200
 */
	IF qt_entry IS NOT NULL OR quest_entry IS NOT NULL THEN
		CASE UCASE(qt_type)
			WHEN 'NPC' THEN BEGIN
				DELETE FROM `creature_involvedrelation` WHERE `id`=IFNULL(qt_entry,`id`) AND `quest`=IFNULL(quest_entry,`quest`);
			END;
			WHEN 'GO' THEN BEGIN
				DELETE FROM `gameobject_involvedrelation` WHERE `id`=IFNULL(qt_entry,`id`) AND `quest`=IFNULL(quest_entry,`quest`);
			END;
			ELSE CALL INVALID_ENTRY_TYPE;
		END CASE;
	ELSE CALL MUST_PROVIDE_ENTRY_OR_QUEST;
	END IF;
END //

-- sp_delete spawn
CREATE PROCEDURE `sp_delete_spawn`(IN spawn_type VARCHAR(10),IN spawn_guid INT(10), IN spawn_entry INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: gameobject
 * PROCS USED:  none
 *
 * spawn_type - Type of spawn to delete. The only acceptable values are 'GO' or 'NPC'
 * spawn_guid - NULLABLE. If present, the guid is used as a qualifier (if null, only use id and game_event_* is not affected)
 * spawn_entry - NULLABLE. If present, the id is used as a qualifier (if null, only use the guid)
 *
 * CALL `sp_delete_spawn` ('GO',20000,NULL); -- deletes gobj of guid 200000
 * CALL `sp_delete_spawn` ('GO',NULL,10000); -- deletes all gobj spawns of id 10000
 * CALL `sp_delete_spawn` ('NPC',20000,10000); -- deletes a specific npc spawn where guid is 20000 and id is 10000 (safest way to delete spawn)
 */
	IF spawn_guid IS NOT NULL OR spawn_entry IS NOT NULL THEN
		CASE UCASE(spawn_type)
			WHEN 'NPC' THEN BEGIN
				DELETE FROM `creature` WHERE `guid`=IFNULL(spawn_guid,`guid`) AND `id`=IFNULL(spawn_entry,`id`);
				DELETE FROM `game_event_creature` WHERE `guid`=IFNULL(spawn_guid,-1);
			END;
			WHEN 'GO' THEN BEGIN
				DELETE FROM `gameobject` WHERE `guid`=IFNULL(spawn_guid,`guid`) AND `id`=IFNULL(spawn_entry,`id`);
				DELETE FROM `game_event_gameobject` WHERE `guid`=IFNULL(spawn_guid,-1);
			END;
			ELSE CALL INVALID_SPAWN_TYPE;
		END CASE;
	ELSE 
		CALL MUST_PROVIDE_GUID_OR_ENTRY;
	END IF;
END //

-- sp_delete_script
CREATE PROCEDURE `sp_delete_script`(IN script_type VARCHAR(10), IN script_id INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: Any table with a name like *_scripts
 * PROCS USED:  none
 *
 * script_type - The type of script to delete (deterimines which table is modified). 
 *             - Only accetable values are 'EAI','GO','GOSSIP','Q_START','Q_END','SPELL', or 'WP'
 * script_id - ID associcated with the script to be deleted
 * 
 * CALL `sp_delete_script`('GO',1000); -- deletes the script of id=1000 from gameobject_scripts
 */
	CASE UCASE(script_type)
		WHEN 'EAI' THEN BEGIN
			DELETE FROM `creature_ai_scripts` WHERE `id`=script_id;
		END;
		WHEN 'GO' THEN BEGIN
			DELETE FROM `gameobject_scripts` WHERE `id`=script_id;
		END;
		WHEN 'GOSSIP' THEN BEGIN
			DELETE FROM `gossip_scripts` WHERE `id`=script_id;
		END;
		WHEN 'Q_START' THEN BEGIN
			DELETE FROM `quest_start_scripts` WHERE `id`=script_id;
		END;
		WHEN 'Q_END' THEN BEGIN
			DELETE FROM `quest_end_scripts` WHERE `id`=script_id;
		END;
		WHEN 'SPELL' THEN BEGIN
			DELETE FROM `spell_scripts` WHERE `id`=script_id;
		END;
		WHEN 'WP' THEN BEGIN
			DELETE FROM `waypoint_scripts` WHERE `id`=script_id;
		END;
		ELSE CALL INVALID_SCRIPT_TYPE;
	END CASE;
END //

-- sp_delete_script_bylist
CREATE PROCEDURE `sp_delete_script_bylist`(IN script_type VARCHAR(10), IN script_id_list LONGTEXT)
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: Any table with a name like *_scripts
 * PROCS USED:  none
 *
 * script_type - The type of script to delete (deterimines which table is modified). 
 *             - Only accetable values are 'EAI','GO','GOSSIP','Q_START','Q_END','SPELL', or 'WP'
 * script_id - ID associcated with the script to be deleted
 * 
 * CALL `sp_delete_script`('GO',1000); -- deletes the script of id=1000 from gameobject_scripts
 */
	CALL `sp_set_entry_list` (script_id_list,null);

	CASE UCASE(script_type)
		WHEN 'EAI' THEN BEGIN
			DELETE FROM `creature_ai_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		WHEN 'GO' THEN BEGIN
			DELETE FROM `gameobject_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		WHEN 'GOSSIP' THEN BEGIN
			DELETE FROM `gossip_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		WHEN 'Q_START' THEN BEGIN
			DELETE FROM `quest_start_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		WHEN 'Q_END' THEN BEGIN
			DELETE FROM `quest_end_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		WHEN 'SPELL' THEN BEGIN
			DELETE FROM `spell_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		WHEN 'WP' THEN BEGIN
			DELETE FROM `waypoint_scripts` WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		END;
		ELSE CALL INVALID_SCRIPT_TYPE;
	END CASE;

	DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END //

-- sp_delete_npc_trainer
CREATE PROCEDURE `sp_delete_npc_trainer`(IN npc_entry INT(10), IN spell_id INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: npc_trainer
 * PROCS USED:  none
 *
 * npc_entry - NULLABLE. If present, use entry as a qualifier (if null, only use spell)
 * spell_id - NULLABLE. If present, use spell as a qualifier (if null, only use entry)
 *
 * CALL `sp_delete_npc_trainer`(1000,NULL); -- removes entire trainer list for creature with ID 1000
 * CALL `sp_delete_npc_trainer`(NULL,200); -- deletes all trainer entries for spell 200
 * CALL `sp_delete_npc_trainer`(1000,200); -- deletes trainer list for npc 1000 and spell 200
 */
	IF spell_id IS NOT NULL OR npc_entry IS NOT NULL THEN
		DELETE FROM `npc_trainer` WHERE `entry`=IFNULL(npc_entry,`entry`) AND `spell`=IFNULL(spell_id,`spell`);
	ELSE 
		CALL MUST_PROVIDE_ENTRY_OR_SPELL;
	END IF;
END //

-- sp_delete_npc_vendor
CREATE PROCEDURE `sp_delete_npc_vendor`(IN npc_entry INT(10), IN item_entry INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: npc_trainer
 * PROCS USED:  none
 *
 * npc_entry - NULLABLE. If present, use entry as a qualifier (if null, only use item)
 * item_entry - NULLABLE. If present, use item as a qualifier (if null, only use entry)
 * 
 * CALL `sp_delete_npc_trainer`(1000,NULL); -- deletes vendor list for NPC 1000
 * CALL `sp_delete_npc_trainer`(NULL,200); -- deletes vendor entries for item 200
 * CALL `sp_delete_npc_trainer`(1000,200); -- deletes vendor list for npc 1000 and item 200
 */
	IF item_entry IS NOT NULL OR npc_entry IS NOT NULL THEN
		DELETE FROM `npc_vendor` WHERE `entry`=IFNULL(npc_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
	ELSE
		CALL MUST_PROVIDE_ENTRY_OR_ITEM;
	END IF;
END //

-- sp_delete_loot (bitchslap to this proc brought to you by denyde)
CREATE PROCEDURE `sp_delete_loot` (IN loot_type VARCHAR(10),IN loot_entry INT(10),IN item_entry INT(10))
BEGIN
/*
 * DEGREE: BASIC
 * TABLES AFFECTED: *_loot_template
 * PROCS USED:  none
 *
 * loot_type - Type of loot to delete
 *           - The only acceptable values are 'FISH','NPC','GO','ITEM','DISENCH','PROSPECT','MILL','PICKPOCKET','SKIN','QUEST', or 'REF'
 * loot_entry - NULLABLE. If present, use entry as a qualifier in the specified table (if null, only use item)
 * item_entry - NULLABLE. If present, use item as a qualifier in the specified table (if null, only use entry)
 *
 * CALL `sp_delete_loot`('GO',20000,NULL); -- deletes all loot of gobj whose type=3 (chest) and data1 is 20000
 * CALL `sp_delete_loot`('PROSPECT',NULL,10000); -- deletes all loot of item_template entry 10000 from prospecting loot
 * CALL `sp_delete_loot`('NPC',20000,10000); -- deletes a loot of an npc whose lootid=20000 and drops item 10000 directly from 
 */
	IF loot_entry IS NOT NULL OR item_entry IS NOT NULL THEN
		CASE UCASE(loot_type)
			WHEN 'FISH' THEN BEGIN
				DELETE FROM `fishing_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'NPC' THEN BEGIN
				DELETE FROM `creature_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'GO' THEN BEGIN
				DELETE FROM `gameobject_loot_template` WHERE `entry`=IFNUofcLL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'ITEM' THEN BEGIN
				DELETE FROM `item_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'DISENCH' THEN BEGIN
				DELETE FROM `disenchant_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'PROSPECT' THEN BEGIN
				DELETE FROM `propspecting_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'MILL' THEN BEGIN
				DELETE FROM `millling_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'PICKPOCKET' THEN BEGIN
				DELETE FROM `pickpocketing_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'SKIN' THEN BEGIN
				DELETE FROM `skinning_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'QUEST' THEN BEGIN
				DELETE FROM `quest_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			WHEN 'REF' THEN BEGIN
				IF loot_entry IS NOT NULL THEN
					DELETE FROM `creature_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `disenchant_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `fishing_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `gameobject_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `item_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `mail_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `milling_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `pickpocketing_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `prospecting_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `skinning_loot_template` WHERE `mincountOrRef`=-loot_entry;
					DELETE FROM `spell_loot_template` WHERE `mincountOrRef`=-loot_entry;
				END IF;
				
				DELETE FROM `reference_loot_template` WHERE `entry`=IFNULL(loot_entry,`entry`) AND `item`=IFNULL(item_entry,`item`);
			END;
			ELSE CALL INVALID_LOOT_TYPE;
		END CASE;
	ELSE 
		CALL MUST_PROVIDE_ENTRY_OR_ITEM;
	END IF;
END //


-- ------------------ --
-- EAI procedures     --
-- ------------------ --

CREATE PROCEDURE `sp_eai_select_id`(IN npc_entry INT(10), OUT event_id INT(10))
BEGIN
/**
 * DEGREE: UTILITY
 * TABLES AFFECT: creature_ai_scripts
 * PROCS USERD: none
 *
 * Check if eAI exists and add pick best id for new entries
 * To be used inside other eAI procs only!
 * 
 * ex: CALL `sp_eai_select_id` (257); -- selects new creature_ai_scripts.id for NPC entry 257 (Kobold Worker) and deletes old eAI added by procedures 
 */
	CALL `sp_error_entry`('NPC',npc_entry);
	SET event_id = (SELECT MAX(id)+1 FROM `creature_ai_scripts` WHERE `creature_id`=npc_entry);
    DELETE FROM `creature_ai_scripts` WHERE `creature_id`=npc_entry AND `comment` LIKE "Stored procedures eAI%";
END //

-- `eai_TablePhaseMask`
CREATE
    PROCEDURE `sp_eai_table_phase_mask`()
    BEGIN
 /*
 * DEGREE: UTILITY
 * TABLES AFFECTED: NONE
 * PROCS USED: NONE
 *
 * THIS PROCEDURE IS AN INTEGRAL PART OF `sp_eai_inverse_phase_mask` PROC. AND HAS NO OTHER USE!!!
 *
 */
CREATE TABLE `phase_mask`(
`phaseID` INT(2) NOT NULL DEFAULT '0' ,
`phase_mask` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
PRIMARY KEY (`phaseID`));
INSERT INTO phase_mask VALUES
(0,1),
(1,2),
(2,4),
(3,8),
(4,16),
(5,32),
(6,64),
(7,128),
(8,256),
(9,512),
(10,1024),
(11,2048),
(12,4096),
(13,8192),
(14,16384),
(15,32768),
(16,65536),
(17,131072),
(18,262144),
(19,524288),
(20,1048576),
(21,2097152),
(22,4194304),
(23,8388608),
(24,16777216),
(25,33554432),
(26,67108864),
(27,134217728),
(28,268435456),
(29,536870912),
(30,1073741824),
(31,2147483648);
    END//

CREATE
    PROCEDURE `sp_eai_inverse_phase_mask`(IN max_phase INT, IN phase_list VARCHAR(255))
    BEGIN
/*
 * DEGREE:UTILITY
 * TABLES AFFECTED: NONE
 * PROCS USED: sp_set_entry_list
 *
 *
 * Procedure to select value for field event_inverse_phase_mask in creature_ai_scripts table
 *
 * max_phase = number of maximum phase used for creature:
 * phase_list = list of phase IDs in which event will occur 
 * example call: CALL `sp_eai_inverse_phase_mask`(3,"2,1");
 * If creature will should enter phase: 0,1,2,3 - then max_phase value is 3
 * phase_list assigns in which phases event WILL occur
 * so if we want NPC using 3 phases (0-3) to take action from eAI while he's in phase 2 OR 3
 * the call for procedure would be: CALL `sp_eAI_InversePhaseMask`(3,"2,3");
 *
 */
DECLARE max_phase_mask INT;
DECLARE phase_yes INT;
DECLARE inverse_phase_mask INT;
CALL `sp_eai_table_phase_mask`();
CALL `sp_set_entry_list`(phase_list);
SET max_phase_mask = (SELECT SUM(phase_mask) FROM phase_mask WHERE phaseID <= max_phase);
SET phase_yes = (SELECT SUM(phase_mask) FROM phase_mask WHERE phaseID IN (SELECT `value` FROM tdb_entry_list));
SET inverse_phase_mask = (max_phase_mask - phase_yes);
DROP TABLE `tdb_entry_list`;
DROP TABLE `phase_mask`;
IF inverse_phase_mask < 0 THEN
SELECT "PhaseID is bigger then maximum phase entered" AS `inverse_phase_mask`;
ELSE IF phase_list="0" THEN
SELECT 0 AS `inverse_phase_mask`;
ELSE
SELECT inverse_phase_mask;
END IF;
END IF;
    END//

-- ------------------ --
--  SINGLE RUN PROC   --
-- ------------------ --

CREATE
    PROCEDURE `sp_dev_reguid_alter_tables`()
    BEGIN
/**
 * DEGREE: UTILITY
 * TABLES AFFECT: many
 * PROCS USERD: none
 *
 * THIS PROCEDURE IS A PART OF `sp_dev_re_guid` AND HAS NO OTHER USE!
 */
            CREATE TABLE `creature_temp` (
  `guid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
  `phaseMask` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '1',
  `modelid` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `equipment_id` MEDIUMINT(9) NOT NULL DEFAULT '0',
  `position_x` FLOAT NOT NULL DEFAULT '0',
  `position_y` FLOAT NOT NULL DEFAULT '0',
  `position_z` FLOAT NOT NULL DEFAULT '0',
  `orientation` FLOAT NOT NULL DEFAULT '0',
  `spawntimesecs` INT(10) UNSIGNED NOT NULL DEFAULT '120',
  `spawndist` FLOAT NOT NULL DEFAULT '5',
  `currentwaypoint` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `curhealth` INT(10) UNSIGNED NOT NULL DEFAULT '1',
  `curmana` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `DeathState` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `MovementType` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `old_guid` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=250001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';
        ALTER TABLE `creature_addon` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `creature_formations` ADD COLUMN `new_guid_leader` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `creature_formations` ADD COLUMN `new_guid_member` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `creature_linked_respawn` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `creature_linked_respawn` ADD COLUMN `new_linked_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `game_event_creature` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `pool_creature` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `game_event_model_equip` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `game_event_npc_gossip` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `game_event_npc_vendor` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `game_event_npcflag` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
        ALTER TABLE `npc_gossip` ADD COLUMN `new_guid` INT(10) UNSIGNED NOT NULL;
    END//
	
	
CREATE
    PROCEDURE `sp_dev_re_guid`(IN new_base_guid INT(10))
    BEGIN
/**
 * DEGREE: UTILITY
 * TABLES AFFECT: any with creature.guid value in use
 * PROCS USED: `sp_dev_re_guid_alter_tables`
 *
 * THIS PROCEDURE IS IN A TESTING PHASE, USE AT OWN RISK!
 * 
 * ex: CALL `sp_dev_re_guid`(1000); -- will renumber all existing guids in creature table starting with 1000 as initial
 */
    CALL `sp_dev_reguid_alter_tables`();
    SET @s = CONCAT("ALTER TABLE `creature_temp` AUTO_INCREMENT=",new_base_guid,";");
    PREPARE STM FROM @s;
    EXECUTE STM;
    INSERT INTO `creature_temp` (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType,old_guid)
    SELECT id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType,guid FROM `creature` ORDER BY `id` ASC;
    UPDATE `creature_temp` SET guid = old_guid WHERE `old_guid`>250000;    
		UPDATE game_event_npc_gossip p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE game_event_npc_vendor p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE game_event_npcflag p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE npc_gossip p
                INNER JOIN creature_temp pp
                ON p.npc_guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE game_event_model_equip p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE creature_addon p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE creature_formations p
                INNER JOIN creature_temp pp
                ON p.leaderGUID = pp.old_guid
                SET p.new_guid_leader = pp.guid;
                UPDATE creature_formations p
                INNER JOIN creature_temp pp
                ON p.memberGUID = pp.old_guid
                SET p.new_guid_member = pp.guid;
                UPDATE creature_linked_respawn p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE creature_linked_respawn p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_linked_guid = pp.guid;
                UPDATE game_event_creature p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                UPDATE pool_creature p
                INNER JOIN creature_temp pp
                ON p.guid = pp.old_guid
                SET p.new_guid = pp.guid;
                ALTER TABLE `creature_temp` DROP COLUMN `old_guid`;
                DROP TABLE `creature`;
                RENAME TABLE `creature_temp` TO `creature`;
                ALTER TABLE game_event_npc_gossip DISABLE KEYS;
                UPDATE `game_event_npc_gossip` SET `guid`=`new_guid`;        
                ALTER TABLE `game_event_npc_gossip` DROP COLUMN `new_guid`;
                ALTER TABLE game_event_npc_gossip ENABLE KEYS;
                ALTER TABLE game_event_npc_vendor DISABLE KEYS;
                UPDATE `game_event_npc_vendor` SET `guid`=`new_guid`;        
                ALTER TABLE `game_event_npc_vendor` DROP COLUMN `new_guid`;
                ALTER TABLE game_event_npc_vendor ENABLE KEYS;
                ALTER TABLE game_event_npcflag DISABLE KEYS;
                UPDATE `game_event_npcflag` SET `guid`=`new_guid`;        
                ALTER TABLE `game_event_npcflag` DROP COLUMN `new_guid`;
                ALTER TABLE game_event_npcflag ENABLE KEYS;
                ALTER TABLE `npc_gossip` DROP PRIMARY KEY;
                UPDATE `npc_gossip` SET `npc_guid`=`new_guid`;      
                SELECT npc_guid,new_guid FROM npc_gossip;  
                ALTER TABLE `npc_gossip` DROP COLUMN `new_guid`;
                ALTER TABLE `npc_gossip` ADD PRIMARY KEY(`npc_guid`);
                ALTER TABLE game_event_model_equip DISABLE KEYS;
                UPDATE `game_event_model_equip` SET `guid`=`new_guid`;        
                ALTER TABLE `game_event_model_equip` DROP COLUMN `new_guid`;
                ALTER TABLE game_event_model_equip ENABLE KEYS;
                ALTER TABLE `creature_addon` DROP PRIMARY KEY;
                UPDATE `creature_addon` SET `guid`=`new_guid`;        
                ALTER TABLE `creature_addon` DROP COLUMN `new_guid`;
                ALTER TABLE `creature_addon` ADD PRIMARY KEY(`guid`);
                ALTER TABLE creature_formations DISABLE KEYS;
                UPDATE `creature_formations` SET leaderGUID = new_guid_leader;
                ALTER TABLE `creature_formations` DROP COLUMN `new_guid_leader`;
                UPDATE `creature_formations` SET memberGUID = new_guid_member;
                ALTER TABLE `creature_formations` DROP COLUMN `new_guid_member`;
                ALTER TABLE creature_formations ENABLE KEYS;
                ALTER TABLE `creature_linked_respawn` DROP PRIMARY KEY;
                UPDATE `creature_linked_respawn` SET guid = new_guid;
                ALTER TABLE `creature_linked_respawn` DROP COLUMN `new_guid`;
                UPDATE `creature_linked_respawn` SET linkedGuid = new_linked_guid;
                ALTER TABLE `creature_linked_respawn` DROP COLUMN `new_linked_guid`;
                ALTER TABLE `creature_linked_respawn` ADD PRIMARY KEY(`guid`);
                ALTER TABLE `game_event_creature` DROP PRIMARY KEY;
                UPDATE `game_event_creature` SET guid = new_guid;
                ALTER TABLE `game_event_creature` DROP COLUMN `new_guid`;
                ALTER TABLE `game_event_creature` ADD PRIMARY KEY(`guid`);
                ALTER TABLE pool_creature DISABLE KEYS;
                UPDATE `pool_creature` SET guid = new_guid;
                ALTER TABLE `pool_creature` DROP COLUMN `new_guid`;
                ALTER TABLE pool_creature ENABLE KEYS;

    END //
	
	
CREATE
    PROCEDURE `sp_dev_cleanup_reference_loot`()
    BEGIN
/*SQL by Gyullo
 * Cleanup procedure for referenced loot tables
 * Remember to have backup before running!
 * Example call:
 * USE `your_world_db_name`;
 * CALL sp_dev_cleanup_reference_loot();
 * */
-- DROP TABLE IF EXISTS `RL_temp`;
CREATE TABLE `RL_temp` (
    `ref_id` INT(8) UNSIGNED NOT NULL PRIMARY KEY DEFAULT '0'
);
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `gameobject_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `item_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `creature_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `spell_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `prospecting_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `milling_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `mail_loot_template` WHERE `mincountOrRef` <0;
INSERT IGNORE INTO `RL_temp` SELECT DISTINCT(`mincountOrRef`)*-1 FROM `reference_loot_template` WHERE `mincountOrRef`<0;
DELETE FROM `reference_loot_template` WHERE `entry` NOT IN (SELECT `ref_id` FROM `RL_temp`);
DROP TABLE `RL_temp`;

    END //

	
CREATE
    PROCEDURE `sp_dev_cleanup_loot`()
    BEGIN
/*
 * Cleanup procedure for loot tables
 * Remember to have backup before running!
 * Example call:
 * USE `your_world_db_name`;
 * CALL sp_dev_cleanup_loot();
  */
-- DROP TABLE IF EXISTS `Loot_temp`;
CREATE TABLE `Loot_temp` (
    `lootid` INT(8) UNSIGNED NOT NULL PRIMARY KEY DEFAULT '0'
);
INSERT IGNORE INTO `Loot_temp` SELECT `entry` FROM `item_template`;
DELETE FROM `prospecting_loot_template` WHERE `entry` NOT IN (SELECT `lootid` FROM `Loot_temp`);
DELETE FROM `Loot_temp`;
INSERT IGNORE INTO `Loot_temp` SELECT `skinloot` FROM `creature_template` WHERE skinloot>0;
DELETE FROM `skinning_loot_template` WHERE `entry` NOT IN (SELECT `lootid` FROM `Loot_temp`);
DELETE FROM `Loot_temp`;
INSERT IGNORE INTO `Loot_temp` SELECT `lootid` FROM `creature_template` WHERE lootid>0;
DELETE FROM `creature_loot_template` WHERE `entry` NOT IN (SELECT `lootid` FROM `Loot_temp`);
DELETE FROM `Loot_temp`;
DROP TABLE `Loot_temp`;

DELETE FROM `disenchant_loot_template` WHERE `item` NOT IN (SELECT `entry` FROM `item_template`);
DELETE FROM `disenchant_loot_template` WHERE `entry` NOT IN (SELECT `disenchantid` FROM `item_template`);
DELETE FROM `pickpocketing_loot_template` WHERE `item` NOT IN (SELECT `entry` FROM `item_template`);
DELETE FROM `prospecting_loot_template` WHERE `entry` NOT IN (SELECT `entry` FROM `item_template`);
DELETE FROM `prospecting_loot_template` WHERE `item` NOT IN (SELECT `entry` FROM `item_template`);
DELETE FROM `mail_loot_template` WHERE `item` NOT IN (SELECT `entry` FROM `item_template`);
    END //
	
	
CREATE
    PROCEDURE `sp_dev_cleanup_world`()
    BEGIN
/* Procedure to clean world database
 *
 *Example call:
 * USE `your_world_db_name`;
 * CALL sp_dev_cleanup_world();
 *
 */
DELETE FROM `gameobject` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);
DELETE FROM `creature` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM areatrigger_involvedrelation WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `battlemaster_entry` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `battlemaster_entry` WHERE `bg_template` NOT IN (SELECT `id` FROM `battleground_template`);
UPDATE `creature` SET `equipment_id`=0 WHERE `equipment_id` NOT IN (SELECT `entry` FROM `creature_equip_template`) AND `equipment_id`!=0;
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `creature_formations` WHERE leaderGUID NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_formations` WHERE memberGUID NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_involvedrelation` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `creature_involvedrelation` WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `creature_linked_respawn` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_linked_respawn` WHERE `linkedGuid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `creature_questrelation` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `creature_questrelation` WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `creature_template_addon` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `game_event_creature_quest` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `game_event_creature_quest` WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `game_event_creature_quest` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_gameobject_quest` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);
DELETE FROM `game_event_gameobject_quest` WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `game_event_gameobject_quest` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_npc_gossip` WHERE `event_id` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_model_equip` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_battleground_holiday` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_condition` WHERE `event_id` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_creature` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_gameobject` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_npc_vendor` WHERE `item` NOT IN (SELECT `entry` FROM `item_template`);
DELETE FROM `game_event_npc_vendor` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_npcflag` WHERE `event_id` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_pool` WHERE `event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_prerequisite` WHERE `event_id` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_prerequisite` WHERE `prerequisite_event` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_quest_condition` WHERE `event_id` NOT IN (SELECT `entry` FROM `game_event`);
DELETE FROM `game_event_quest_condition` WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `gameobject_involvedrelation` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);
DELETE FROM `gameobject_involvedrelation` WHERE `quest` NOT IN (SELECT `entry` FROM `quest_template`);
DELETE FROM `item_required_target` WHERE `targetEntry` NOT IN (SELECT `entry` FROM `creature_template`) AND `type` IN (1,2);
DELETE FROM `mail_level_reward` WHERE `senderEntry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `npc_gossip` WHERE `npc_guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `npc_spellclick_spells` WHERE `quest_start` NOT IN (SELECT `entry` FROM `quest_template`) AND `quest_start`<>0;
DELETE FROM `npc_spellclick_spells` WHERE `quest_end` NOT IN (SELECT `entry` FROM `quest_template`) AND `quest_end`<>0;
DELETE FROM `npc_trainer` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `npc_vendor` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `npc_vendor` WHERE `item` NOT IN (SELECT `entry` FROM `item_template`);
DELETE FROM `pet_levelstats` WHERE `creature_entry` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `quest_end_scripts` WHERE `id` NOT IN (SELECT `CompleteScript` FROM `quest_template`);
DELETE FROM `quest_start_scripts` WHERE `id` NOT IN (SELECT `StartScript` FROM `quest_template`);
DELETE FROM `spell_script_target` WHERE `targetEntry` NOT IN (SELECT `entry` FROM `creature_template`) AND `type` IN (1,2,3) AND `targetEntry`!=0;
DELETE FROM `spell_script_target` WHERE `targetEntry` NOT IN (SELECT `entry` FROM `gameobject_template`) AND `type`=0 AND `targetEntry`!=0;
    END //
	

-- ------------------ --
--   ERROR HANDLERS   --
-- ------------------ --

-- sp_error_entry
CREATE PROCEDURE `sp_error_entry`(IN entry_type VARCHAR(10), IN e_entry INT(10))
BEGIN
/**
 * DEGREE: ERROR-HANDLING
 * TABLES AFFECTED: creature_template, gameobject_template
 * PROCS USED: none
 * 
 * Validate whether or not a entry for an npc/gameobject exists in its respective spawn table. Will error out if does not exist.
 *
 * e_entry - entry of the npc or gameobject you are validating
 * entry_type - 'NPC','GO','ITEM', and 'QUEST' are the only values accepted (for npc or gameobject)
 *
 * ex: CALL `sp_error_entry`('NPC',98753); -- make sure an npc spawn of entry 98753 exists in the db before performing actions using that entry
*/
	DECLARE check_entry INT;

	CASE UPPER(entry_type)
		WHEN 'NPC' THEN
			SET check_entry = (SELECT COUNT(`entry`) FROM `creature_template` WHERE `entry`=e_entry);
		WHEN 'GO' THEN
			SET check_entry = (SELECT COUNT(`entry`) FROM `gameobject_template` WHERE `entry`=e_entry);
		WHEN 'ITEM' THEN
			SET check_entry = (SELECT COUNT(`entry`) FROM `item_template` WHERE `entry`=e_entry);
		WHEN 'QUEST' THEN
			SET check_entry = (SELECT COUNT(`entry`) FROM `quest_template` WHERE `entry`=e_entry);
		ELSE
			CALL INCORRECT_ENTRY_TYPE;
	END CASE;
	
	IF check_entry=0 THEN
		CALL INCORRECT_ENTRY;
	END IF;
END//	
	
CREATE
    PROCEDURE `sp_error_trigger`(IN trigger_entry INT)
    BEGIN
/**
 * DEGREE: ERROR HANDLER
 * TABLES AFFECTED: quest_template
 * PROCS USED: none
 *
 * Error handling for TDB procedure: check if triggerID for eAI is objective of any quest
 *
 * trigger_id - ID to check against the db for quest objective
 *
 * ex: CALL `sp_error_trigger` (257); -- make sure trigger (creature_template.entry = 257) is requirement for a quest
 */
    DECLARE Check_trigger INT;
    SET Check_trigger = (SELECT COUNT(ReqCreatureOrGOId1) FROM `quest_template` WHERE `ReqCreatureOrGOId1`= trigger_entry)
    + (SELECT COUNT(ReqCreatureOrGOId2) FROM `quest_template` WHERE `ReqCreatureOrGOId2`= trigger_entry)
    + (SELECT COUNT(ReqCreatureOrGOId3) FROM `quest_template` WHERE `ReqCreatureOrGOId3`= trigger_entry)
    + (SELECT COUNT(ReqCreatureOrGOId4) FROM `quest_template` WHERE `ReqCreatureOrGOId4`= trigger_entry);
    IF Check_trigger = 0 THEN
        CALL NO_QUEST_WITH_REQUIREMENT();
    END IF;
    END//
	
-- sp_error_guid
CREATE PROCEDURE `sp_error_guid`(IN guid_type VARCHAR(10),IN npc_or_go_guid INT(10))
BEGIN
/**
 * DEGREE: ERROR-HANDLING
 * TABLES AFFECTED: creature, gameobject
 * PROCS USED: none
 * 
 * Validate whether or not a guid for an npc/gameobject exists in its respective spawn table. Will error out if does not exist.
 *
 * npc_or_go_guid - Guid of the npc or gameobject spawn you are validating
 * guid_type - 'NPC' or 'GO' are the only values accepted (for npc or gameobject)
 *
 * ex: CALL `sp_error_guid`('NPC',98753); -- make sure an npc spawn of guid 98753 exists in the db before performing actions using that guid
*/
	DECLARE check_guid INT;

	CASE UPPER(guid_type)
		WHEN 'NPC' THEN
			SET check_guid = (SELECT COUNT(`guid`) FROM `creature` WHERE `guid`=npc_or_go_guid);
		WHEN 'GO' THEN
			SET check_guid = (SELECT COUNT(`guid`) FROM `gameobject` WHERE `entry`=npc_or_go_entry);
		ELSE
			CALL INCORRECT_GUID_TYPE;
	END CASE;
	
	IF check_guid=0 THEN
		CALL INCORRECT_CREATURE_OR_GO_GUID;
	END IF;
END//

-- ------------------ --
--     UTILITIES      --
-- ------------------ --

-- sp_get_ref_id
CREATE PROCEDURE `sp_get_ref_id` (IN refType VARCHAR(10),OUT reference MEDIUMINT(5))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: reference_loot_template
 * PROCS USED: none
 *
 * Get a generated loot reference id based on the type of loot its to be used for
 *
 * refType - [SKIN,ITEM,FISH,MILL,RAID_GOBJ,MINE,PROSPECT,WORLD,RAID_CRE,DUNGEON]
 * reference - OUT. Variable that is filled with the desired reference id.
 *
 * ex: CALL `sp_get_util_refid`('RAID_CRE',@Test);
 *     SELECT @Test
 */
    CASE UCASE(refType)
        WHEN 'SKIN' THEN BEGIN
            SET @Low :=00000;
            SET @High :=1000;
        END;
        WHEN 'ITEM' THEN BEGIN
            SET @Low :=10000;
            SET @High :=10999;
        END;
        WHEN 'FISH' THEN BEGIN
            SET @Low :=11000;
            SET @High :=11799;
        END;
        WHEN 'MILL' THEN BEGIN
            SET @Low :=11800;
            SET @High :=11999;
        END;
        WHEN 'RAID_GOBJ' THEN BEGIN
            SET @Low :=12000;
            SET @High :=12899;
        END;
        WHEN 'MINE' THEN BEGIN
            SET @Low :=12900;
            SET @High :=12999;
        END;
        WHEN 'PROSPECT' THEN BEGIN
            SET @Low :=13000;
            SET @High :=13999;
        END;
        WHEN 'WORLD' THEN BEGIN
            SET @Low :=14000;
            SET @High :=29000;
        END;
        WHEN 'RAID_CRE' THEN BEGIN
            SET @Low :=34000;
            SET @High :=34999;
        END;
        WHEN 'DUNGEON' THEN BEGIN
            SET @Low :=35000;
            SET @High :=35999;
        END;
        ELSE CALL INVALID_REFERENCE_TYPE;
    END CASE;
    SET reference :=1+(SELECT `entry` FROM `reference_loot_template` WHERE `entry` BETWEEN @Low AND @High ORDER BY `entry` DESC LIMIT 1);
END//

-- ------------------ --
-- BASIC PROCEDURES   --
-- ------------------ --


-- sp_set_npc_path
CREATE PROCEDURE `sp_set_npc_path`(IN npc_guid INT(10),OUT path INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature, creature_addon
 * PROCS USED: sp_error_guid
 *
 * Set appropriate flags to enable a spawned creature to move along waypoints
 *
 * guid - Guid of the creature spawn you wish
 * path - OUT. Variable whose value represents the path_id assigned to the supplied guid
 * 
 * ex: CALL `sp_set_npc_path`(98753,@PATH); -- makes spawn 98753 (creature.guid=98753) able to move along waypoints
 *     SELECT @PATH; -- use the path_id in later queries
 */
	CALL `sp_error_guid`('NPC',npc_guid);
	
	SELECT npc_guid*10 INTO path;

	UPDATE `creature` SET `MovementType`=2,`spawndist`=0 WHERE `guid`=npc_guid;

	IF (SELECT COUNT(*) FROM `creature_addon` WHERE `guid`=npc_guid) > 0 THEN
		UPDATE `creature_addon` SET `path_id`=path WHERE `guid`=npc_guid;
	ELSE
		INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (npc_guid,path);
	END IF;
	
	DELETE FROM `waypoint_data` WHERE `id`=path;
END//

CREATE PROCEDURE `sp_set_quest_level`(IN quest_entry INT(10), IN quest_level INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: quest_template
 * PROCS USED: sp_error_entry
 *
 * Update quest to provided level
 * ONLY FOR SEASONAL QUESTS WHERE LEVELS ARE NOT CORRECT FROM WDB!
 *
 * quest_entry - ID of a quest from quest_template
 * quest_level - new MinLevel value
 * 
 * ex: CALL `quest_Level` (11335,30) - sets MinLevel of quest ID 11335 (Call to Arms: Arathi Basin) to 30
 */
CALL `sp_error_entry`('QUEST',quest_entry);
UPDATE `quest_template` SET `MinLevel`= quest_level WHERE `entry`= quest_entry;
END //


CREATE PROCEDURE `sp_set_quest_next`(IN quest_entry INT(10), IN next_quest INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: quest_template
 * PROCS USED: sp_error_entry
 *
 * Update next quest value
 *
 * quest_entry - ID of a quest from quest_template
 * next_quest - new NextQuestId
 * 
 * ex: CALL `quest_Level` (11335,11230) - sets NextQuestId after quest ID 11335 (Call to Arms: Arathi Basin) to 11230
 */
CALL `sp_error_entry`('QUEST',quest_entry);
UPDATE `quest_template` SET `NextQuestId`= next_quest WHERE `entry`= quest_entry;
END //


CREATE PROCEDURE `sp_set_quest_previous`(IN quest_entry INT(10), IN prev_quest INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: quest_template
 * PROCS USED: sp_error_entry
 *
 * Update prev quest value
 *
 * quest_entry - ID of a quest from quest_template
 * next_quest - new PrevQuestId
 * 
 * ex: CALL `quest_Level` (11335,11230) - sets PrevQuestId for quest ID 11335 (Call to Arms: Arathi Basin) to 11230
 */
CALL `sp_error_entry`('QUEST',quest_entry);
UPDATE `quest_template` SET `PrevQuestId`= prev_quest WHERE `entry`= quest_entry;
END //


-- sp_set_entry_list
CREATE PROCEDURE `sp_set_entry_list` (IN input LONGTEXT,IN appendExisting BIT) 
BEGIN
/**
 * DEGREE: UTILITY
 * TABLES AFFECTED: tdb_entry_list (temp)
 * PROCS USED: none
 *
 * Utility procedure to split a comma-delimited list into a temporary table to be used outside of the procedure.
 * ***USE WITH CARE! Drop up the temporary table after using it!***
 *
 * input - comma-delimited list of entries to be split and inserted individually into a temporary table
 * appendExisting - NULLABLE. If present and true, does not drop existing temp table, rather, appends the existing table
 *
 * ex: CALL sp_set_entry_list ('1,2,3,4,5,6',null);
 *     SELECT * FROM `tdb_entry_list`;
 *     DROP TABLE `tdb_entry_list`;
 */
    DECLARE cur_position INT DEFAULT 1;
    DECLARE remainder TEXT;
    DECLARE cur_string VARCHAR(10);
    DECLARE entry_count MEDIUMINT;

    IF appendExisting IS NULL OR appendExisting IS FALSE THEN
	CREATE TABLE `tdb_entry_list` (`value` INT NOT NULL PRIMARY KEY) ENGINE=MYISAM;
    END IF;

    SET remainder = input;
    WHILE CHAR_LENGTH(remainder) > 0 AND cur_position > 0 DO
        SET cur_position = INSTR(remainder, ',');
        IF cur_position = 0 THEN
            SET cur_string = remainder;
        ELSE
            SET cur_string = LEFT(remainder, cur_position-1);
        END IF;

        IF TRIM(cur_string) != '' AND(SELECT COUNT(*) FROM `tdb_entry_list` WHERE `value`=cur_string)=0 THEN
            INSERT INTO `tdb_entry_list` VALUES (cur_string);
        END IF;

        SET remainder = SUBSTRING(remainder, cur_position+1);
    END WHILE;
END//

-- sp_set_npc_aggro
CREATE PROCEDURE `sp_set_npc_aggro`(IN creature_entry INT(10),IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_CheckNpcEntry
 *
 * Update creature to ignore aggro
 *
 * creature_entry - ID of NPC from `creature_template`.`entry`
 * on_off - whether to turn aggro on or off
 * 
 * ex: CALL `sp_set_npc_aggro`(257,false); -- makes NPC with ID 257 ignore aggro
 */
	CALL `sp_error_entry`('NPC',creature_entry);
	IF on_off = 1 THEN
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`&~2 WHERE `entry`= creature_entry;
	ELSE 
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`= creature_entry;
	END IF;
END //

-- sp_set_npc_aggro_bylist
CREATE PROCEDURE `sp_set_npc_aggro_bylist`(IN entry_list LONGTEXT,IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_CheckNpcEntry
 *
 * Update creature to ignore aggro
 *
 * entry_list - Comma-delimited list of NPC IDs from `creature_template`.`entry`
 * on_off - whether to turn aggro on or off
 * 
 * ex: CALL `sp_set_npc_aggro`(257,false); -- makes NPC with ID 257 ignore aggro
 */
	CALL `sp_set_entry_list` (entry_list,null);

	IF on_off = 1 THEN
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`&~2 WHERE `entry` IN (SELECT * FROM `tdb_entry_list`);
	ELSE 
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry` IN (SELECT * FROM `tdb_entry_list`);
	END IF;

	DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END //

-- sp_set_npc_faction
CREATE PROCEDURE `sp_set_npc_faction`(IN npc_entry INT(10), factionA INT(10), factionH INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_CheckNpcEntry
 *
 * Update creature's faction
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * factionA - NULLABLE. Alliance faction to assign to the specified npc (if null, uses current value).
 * factionH - NULLABLE. Horde faction to assign to the specified npc (if null, uses current value).
 * 
 * ex: CALL `sp_set_npc_faction`(257,7,7); -- sets faction to 7 for NPC with ID 257 (Kobold Worker)
 */
	CALL `sp_error_entry`('NPC',npc_entry);
	UPDATE `creature_template` SET `faction_A`=IFNULL(factionA,`faction_A`),`faction_H`=IFNULL(factionH,`faction_A`) WHERE `entry`=npc_entry;
END //

-- sp_set_npc_faction_bylist
CREATE PROCEDURE `sp_set_npc_faction_bylist`(IN entry_list LONGTEXT, factionA INT(10), factionH INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_CheckNpcEntry
 *
 * Update creature's faction
 *
 * entry_list - Comma-delimited list of NPC IDs from `creature_template`.`entry`
 * factionA - NULLABLE. Alliance faction to assign to the specified npc (if null, uses current value).
 * factionH - NULLABLE. Horde faction to assign to the specified npc (if null, uses current value).
 * 
 * ex: CALL `sp_set_npc_faction`(257,7,7); -- sets faction to 7 for NPC with ID 257 (Kobold Worker)
 */
	CALL `sp_set_entry_list` (entry_list,null);

	UPDATE `creature_template` SET `faction_A`=IFNULL(factionA,`faction_A`),`faction_H`=IFNULL(factionH,`faction_A`) WHERE `entry` IN (SELECT * FROM `tdb_entry_list`);

	DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END //

-- sp_set_npc_selectable
CREATE PROCEDURE `sp_set_npc_selectable`(IN npc_entry INT(10),IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_CheckNpcEntry
 *
 * Update creature to make it selectable
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * on_off - whether or not the specified NPC should be selectable
 * 
 * ex: CALL `sp_set_npc_selectable`(257,true) - makes creature with ID 257 (Kobold Worker) selectable 
 */
	CALL `sp_error_entry`('NPC',npc_entry);
	IF on_off=1 THEN
		UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~33554432 WHERE `entry`=npc_entry;
	ELSE
		UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432 WHERE `entry`=npc_entry;
	END IF;
END //

-- sp_set_npc_selectable_bylist
CREATE PROCEDURE `sp_set_npc_selectable_bylist`(IN entry_list LONGTEXT,IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_CheckNpcEntry
 *
 * Update creature to make it selectable
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * on_off - whether or not the specified NPC should be selectable
 * 
 * ex: CALL `sp_set_npc_selectable_bylist`('257,3,6',true) - makes creature with IDs of 257,3, and 6 to be selectable 
 */
	CALL `sp_set_entry_list` (entry_list,null);

	IF on_off=1 THEN
		UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~33554432 WHERE `entry` IN (SELECT * FROM `tdb_entry_list`);
	ELSE
		UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432 WHERE `entry` IN (SELECT * FROM `tdb_entry_list`);
	END IF;

	DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END //

-- sp_set_npc_deadquest
CREATE PROCEDURE `sp_set_npc_deadquest`(IN npc_entry INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template_addon, creature
 * PROCS USED: sp_error_entry
 *
 * Update creature to appear death but still react to eAI / give or take quests
 *
 * creature_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_deadquest` (257); -- Makes creature with entry 257 appear dead but still albe to give / take quests or react to spellhits
 */
	DECLARE check_addon_exists INT;
	CALL `sp_error_entry`('NPC',npc_entry);

	UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`Deathstate`=0 WHERE `id`=npc_entry;
	UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`=npc_entry;
    
	-- if has creature_template_addon entry, update, else insert new row	
	SET check_addon_exists = (SELECT COUNT(`entry`) FROM `creature_template_addon` WHERE `entry`=npc_entry);
	IF check_addon_exists > 0 THEN 
		UPDATE `creature_template_addon` SET `bytes1`=7 WHERE `entry`=npc_entry;
	ELSE 
		INSERT INTO `creature_template_addon` VALUES (npc_entry,0,0,7,0,0, '');
	END IF;
END //

-- sp_set_npc_trigger
CREATE PROCEDURE `sp_set_npc_trigger` (IN npc_entry INT(10),IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature, creature_template
 * PROCS USED: sp_error_entry
 *
 * Sets NPC as a trigger (disable movements, ignore aggro, and disable targetting)
 *
 * npc_entry - Entry of the npc for whom template is updated
 * on_off - If true, sets all spawns to respond accordingly and updates the template, if false, removes flags
 *
 * ex: CALL `sp_tdb_TriggerSettings` (257,true); -- sets creature having `creature_template`.`entry` = 257 to act as trigger
 */
	CALL `sp_error_entry`('NPC',npc_entry);

	IF on_off=1 THEN
		UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `id`=npc_entry;
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2,`unit_flags`=`unit_flags`|33554432  WHERE `entry`=npc_entry;        
	ELSE
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`&~2,`unit_flags`=`unit_flags`&~33554432  WHERE `entry`=npc_entry; 
	END IF;
END //

-- sp_set_npc_trigger_bylist
CREATE PROCEDURE `sp_set_npc_trigger_bylist` (IN entry_list LONGTEXT,IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature, creature_template
 * PROCS USED: sp_error_entry
 *
 * Sets NPC as a trigger (disable movements, ignore aggro, and disable targetting)
 *
 * npc_entry - Entry of the npc for whom template is updated
 * on_off - If true, sets all spawns to respond accordingly and updates the template, if false, removes flags
 *
 * ex: CALL `sp_tdb_TriggerSettings` (257,true); -- sets creature having `creature_template`.`entry` = 257 to act as trigger
 */
	CALL `sp_set_entry_list` (entry_list,null);

	IF on_off=1 THEN
		UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `id` IN (SELECT * FROM `tdb_entry_list`);
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2,`unit_flags`=`unit_flags`|33554432  WHERE `entry` IN (SELECT * FROM `tdb_entry_list`);        
	ELSE
		UPDATE `creature_template` SET `flags_extra`=`flags_extra`&~2,`unit_flags`=`unit_flags`&~33554432  WHERE `entry` IN (SELECT * FROM `tdb_entry_list`); 
	END IF;

	DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END //

-- sp_set_npc_lootid
CREATE PROCEDURE `sp_set_npc_lootid` (IN npcEntry MEDIUMINT(5),IN lootID MEDIUMINT(5))
BEGIN    
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_error_entry
 *
 * Sets the loot id of a specified NPC
 *
 * npcEntry - Entry of the npc whose lootid you would like to set
 * loot - OPTIONAL. If provided, set the specified NPC's lootid to this value. If NULL, NPC uses its own entry.
 * 
 * ex: CALL `sp_set_npc_lootid` (99999,NULL); -- sets the lootid to its own entry number
 */
    CALL `sp_error_entry`('NPC',npcEntry);
    UPDATE `creature_template` SET `lootid`=IFNULL(lootID,npcEntry) WHERE `entry`=npcEntry;
END//

-- `sp_set_npc_lootid_bylist`
CREATE PROCEDURE `sp_set_npc_lootid_bylist` (IN entryList LONGTEXT,IN lootID MEDIUMINT(5))
BEGIN    
/**
 * DEGREE: AVERAGE
 * TABLES AFFECTED: creature_template, tdb_entry_list (temp)
 * PROCS USED: sp_set_entry_list
 *
 * Sets the loot id of a specified NPC
 *
 * npcEntry - Entry of the npc whose lootid you would like to set
 * loot - NULLABLE. If provided, set the specified NPC's lootid to this value. If NULL, NPC uses its own entry.
 * 
 * ex: CALL `sp_get_npc_lootid_bylist`('1,2,3,4,5','99999'); -- sets the loot id of 5 specified npcs to 99999
 */
    CALL `sp_set_entry_list` (entryList,null);
    UPDATE `creature_template` SET `lootid`=IFNULL(lootID,`entry`) WHERE `entry` IN (SELECT DISTINCT * FROM `tdb_entry_list`);
    
    DROP TABLE `tdb_entry_list`; -- dont forget the cleanup!
END//

-- sp_set_npc_lootid_bytable
CREATE PROCEDURE `sp_set_npc_lootid_bytable` (IN lootID MEDIUMINT(5))
BEGIN    
/**
 * DEGREE: AVERAGE
 * TABLES AFFECTED: creature_template, tdb_entry_list
 * PROCS USED: sp_set_entry_list
 *
 * Sets the loot id of specified NPCs based on entries in tdb_entry_list
 *
 * loot - NULLABLE. If provided, set the specified NPC's lootid to this value. If NULL, NPC uses its own entry.
 * 
 * ex: CALL `sp_get_npc_lootid_bytable`('99999'); -- sets the loot id of all npcs in tdb_entry_list to 99999
 */
    UPDATE `creature_template` SET `lootid`=IFNULL(lootID,`entry`) WHERE `entry` IN (SELECT DISTINCT * FROM `tdb_entry_list`);
END//

-- sp_get_npc_diffentry
CREATE PROCEDURE `sp_get_npc_diffentry` (IN normalEntry MEDIUMINT(5),IN difficulty TINYINT(1),OUT output MEDIUMINT(8))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_error_entry
 *
 * Retrieves the specified difficulty entry for a given NPC
 *
 * normalEntry - ID of the npc whose difficulty entry is to be 
 * difficulty - level of difficulty who entry should be retrieved
 * output - OUT. desired difficulty entry is placed in this variable for use by the caller
 *
 * ex: CALL `sp_get_npc_diffentry`(10184,1,@Test);
 *     SELECT @Test;
 */
    CALL `sp_error_entry`('NPC',normalEntry);

    CASE difficulty
        WHEN 1 THEN BEGIN 
            SELECT `difficulty_entry_1` FROM `creature_template` WHERE `entry`=normalEntry INTO output; 
        END;
        WHEN 2 THEN BEGIN 
            SELECT `difficulty_entry_2` FROM `creature_template` WHERE `entry`=normalEntry INTO output; 
        END;
        WHEN 3 THEN BEGIN 
            SELECT `difficulty_entry_3` FROM `creature_template` WHERE `entry`=normalEntry INTO output; 
        END;
        ELSE CALL INVALID_DIFFICULTY();
    END CASE;
END//

-- sp_set_spell_target
CREATE PROCEDURE `sp_set_spell_target`(IN target_type VARCHAR(10),IN target_entry INT(11),IN spell_id INT(11))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template, spell_script_target
 * PROCS USED: sp_error_entry
 *
 * Sets target requirement for spellcast
 *
 * target_type - [GO|NPC|DEAD_NPC|MINION]
 * target_entry - ID of creature or gameobject (if zero, spell focus object if type='GO', target player for AOE if type='NPC')
 * spell_id - ID of spell we want to set target for
 * 
 * ex: CALL `sp_set_spell_target` ('NPC',257,4444); -- allows spell 4444 to be cast only on living creature with `creature_template`.`entry` = 257
 */
    CASE UCASE(target_type)
        WHEN 'GO' THEN BEGIN
	    IF target_entry > 0 THEN 
		CALL `sp_error_entry`('GO',target_entry); 
	    END IF;
            DELETE FROM `spell_script_target` WHERE `entry`=spell_id;
            INSERT INTO `spell_script_target`(`entry`,`type`,`targetEntry`) VALUES (spell_id,0,target_entry);
        END;
        WHEN 'NPC' THEN BEGIN
	    IF target_entry > 0 THEN 
		CALL `sp_error_entry`('NPC',target_entry); 
	    END IF;
            DELETE FROM `spell_script_target` WHERE `entry`=spell_id;
            INSERT INTO `spell_script_target`(`entry`,`type`,`targetEntry`) VALUES (spell_id,1,target_entry);
        END;
        WHEN 'DEAD_NPC' THEN BEGIN
	    CALL `sp_error_entry`('NPC',target_entry);
            DELETE FROM `spell_script_target` WHERE `entry`=spell_id;
            INSERT INTO `spell_script_target`(`entry`,`type`,`targetEntry`) VALUES (spell_id,2,target_entry);
        END;
        WHEN 'MINION' THEN BEGIN
	    CALL `sp_error_entry`('NPC',target_entry);
            DELETE FROM `spell_script_target` WHERE `entry`=spell_id;
            INSERT INTO `spell_script_target`(`entry`,`type`,`targetEntry`) VALUES (spell_id,3,target_entry);
        END;
        ELSE CALL INCORRECT_TARGET_TYPE;
    END CASE;
END //

-- sp_get_go_lootid
CREATE PROCEDURE `sp_get_go_lootid`(IN gobjID MEDIUMINT(6),OUT gobjLootID INT(10))
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: gameobject_template
 * PROCS USED: sp_error_entry
 *
 * Get the loot ID for a specified gameobject (data1 field). Must be a chest (type=3).
 *
 * gobjID - ID of the gameobject whose loot id is to be gathered
 * gobjLootID - variable to store the retrieved value in
 *
 * ex: CALL `sp_get_go_lootid`(195709,@Test);
 *     SELECT * FROM `gameobject_loot_template` WHERE `entry`=@Test;
 */
    CALL `sp_error_entry`('NPC',gobjID);
    SELECT `data1` FROM `gameobject_template` WHERE `entry`=gobjID AND `type`=3 INTO gobjLootID;
END//

CREATE PROCEDURE `sp_set_npc_lootable_bylist`(IN npc_entry TEXT, IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED:  sp_error_entry
 *
 * Disable /enable loot option on NPC from list
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_lootable` ("257,258,259",1); -- makes creature of ID 257,258,259 (Kobold Worker) lootable
 * ex: CALL `sp_set_npc_lootable` ("257,258,259",0); -- makes creature of ID 257,258,259 (Kobold Worker) lootable
 */  
DECLARE remaining INT;
DECLARE min_entry INT;

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);
-- error check part
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('NPC',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('NPC',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

IF on_off = 1 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`&~1 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;
IF on_off = 0 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|1 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;

END //


CREATE PROCEDURE `sp_set_npc_lootable`(IN npc_entry INT(10), IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED:  sp_error_entry
 *
 * Disable /enable loot option on NPC
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_lootable` (257,1); -- makes creature of ID 257 (Kobold Worker) lootable
 * ex: CALL `sp_set_npc_lootable` (257,0); -- makes creature of ID 257 (Kobold Worker) not lootable
 */

CALL sp_error_entry('NPC',npc_entry);
IF on_off = 1 THEN
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`&~1 WHERE `entry`= npc_entry;
ELSEIF on_off = 0 THEN
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|1 WHERE `entry`= npc_entry;
END IF;
END //


CREATE PROCEDURE `sp_set_npc_civilian_bylist`(IN npc_entry TEXT, IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_error_entry
 *
 * Update creature to ignore aggro
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_civilian_bylist` ("257,258,259",1); -- makes NPC with ID 257,258,259 ignore aggro
 * ex: CALL `sp_set_npc_civilian_bylist` ("257,258,259",1); -- makes NPC with ID 257,258,259 not ignore aggro
 */
  
DECLARE remaining INT;
DECLARE min_entry INT;

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);
-- error check part
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('NPC',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('NPC',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

IF on_off = 1 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;
IF on_off = 0 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`&~2 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;

END //


CREATE PROCEDURE `sp_set_npc_civilian`(IN npc_entry INT(10), IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_error_entry
 *
 * Update creature to ignore aggro
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_civilian` (257,1); -- makes NPC with ID 257 ignore aggro
 * ex: CALL `sp_set_npc_civilian` (257,0); -- makes NPC with ID 257 not ignore aggro
 */
CALL sp_error_entry('NPC',npc_entry);
IF on_off = 1 THEN
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`= npc_entry;
ELSEIF on_off = 0 THEN
UPDATE `creature_template` SET `flags_extra`=`flags_extra`&~2 WHERE `entry`= npc_entry;
END IF;
END //


CREATE PROCEDURE `sp_set_npc_attackable`(IN npc_entry INT, IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_error_entry
 *
 * Toggle on / off attack option for NPC
 *
 * creature_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_attackable` (257,1); -- enables attacking of creature with ID 257 (creature_template.entry - Kobold Worker)
 */
CALL sp_error_entry('NPC',npc_entry);
IF on_off = 1 THEN
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256 WHERE `entry`= npc_entry;
END IF;
IF on_off = 0 THEN
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~256 WHERE `entry`= npc_entry;
END IF;
END //


CREATE PROCEDURE `sp_set_npc_attackable_bylist`(IN npc_entry TEXT, IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED: sp_error_entry
 *
 * Toggle on / off attack option for listed NPCs
 *
 * creature_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_attackable` ("257,258,259",1); -- enables attacking of creature with ID 257, 258, 259 (creature_template.entry - Kobold Worker)
 * ex: CALL `sp_set_npc_attackable` ("257,258,259",0); -- disables attacking of creature with ID 257, 258, 259 (creature_template.entry - Kobold Worker)
 */
DECLARE remaining INT;
DECLARE min_entry INT;
CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);
-- error check part
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('NPC',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);
IF on_off = 1 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;
IF on_off = 0 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~256 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;
END //


CREATE PROCEDURE `sp_set_npc_targetable`(IN npc_entry INT(10), IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED:  none
 * FUNCTIONS USED: sp_error_entry
 *
 * Disable /enable targetting option on NPC
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_targetable` (257,1); -- makes creature of ID 257 (Kobold Worker) targetable
 * ex: CALL `sp_set_npc_targetable` (257,0); -- makes creature of ID 257 (Kobold Worker) not targetable
 */

CALL sp_error_entry('NPC',npc_entry);
IF on_off = 1 THEN
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~33554432 WHERE `entry`= npc_entry;
ELSEIF on_off = 0 THEN
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432 WHERE `entry`= npc_entry;
END IF;
END //


CREATE PROCEDURE `sp_set_npc_targetable_bylist`(IN npc_entry TEXT, IN on_off BOOLEAN)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: creature_template
 * PROCS USED:  sp_error_entry
 *
 * Disable /enable targetting option on NPC from list
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * 
 * ex: CALL `sp_set_npc_targetable_bylist` ("257,258,259",1); -- makes creature of ID 257,258,259 (Kobold Worker) targetable
 * ex: CALL `sp_set_npc_targetable_bylist` ("257,258,259",0); -- makes creature of ID 257,258,259 (Kobold Worker) not targetable
 */  
DECLARE remaining INT;
DECLARE min_entry INT;

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);
-- error check part
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('NPC',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

IF on_off = 1 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~33554432 WHERE `entry`= min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;
IF on_off = 0 THEN
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554432 WHERE `entry`=  min_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
END IF;
END //



CREATE PROCEDURE `sp_set_item_money` (IN item_entry INT, IN min_money INT, IN max_money INT)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: item_template
 * PROCS USED:  sp_error_entry
 *
 * set min / max money loot for item
 * 
 * ex: CALL `sp_set_item_money` (25,10,100); -- set max money loot to 100 and min money loot to 10 for item with entry = 25
 *
 */
CALL sp_error_entry('ITEM',item_entry);
UPDATE item_template SET minMoneyLoot=min_money, maxMoneyLoot=max_money WHERE entry = item_entry;
END //



CREATE PROCEDURE `sp_set_item_money_bylist`(IN item_entry TEXT, IN min_money INT, IN max_money INT)
BEGIN
/**
 * DEGREE: BASIC
 * TABLES AFFECTED: item_template
 * PROCS USED:  sp_error_entry
 *
 * set min / max money loot for item in list
 * 
 * ex: CALL `sp_set_item_money` ("25,26,27",10,100); -- set max money loot to 100 and min money loot to 10 for item with entry = 25 and 26 and 27
 *
 */

DECLARE remaining INT;
DECLARE min_entry INT;

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);
-- error check part
WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
CALL sp_error_entry('ITEM',min_entry);
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;
CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

CALL sp_set_entry_list(npc_entry);
SET remaining = (SELECT COUNT(`value`) FROM tdb_entry_list);

WHILE remaining > 0 DO
SET min_entry = (SELECT MIN(`value`) FROM tdb_entry_list);
UPDATE item_template SET minMoneyLoot=min_money, maxMoneyLoot=max_money WHERE entry = item_entry;
DELETE FROM tdb_entry_list WHERE `value`=min_entry;
SET remaining = remaining -1;
END WHILE;

END //



-- -------------------- --
--  AVERAGE PROCEDURES  --
-- -------------------- --

CREATE PROCEDURE `sp_eai_kill_ondeath`(IN npc_entry INT(10), trigger_id INT(10))
BEGIN
/**
 * DEGREE: AVERAGE
 * TABLES AFFECT: creature_template, creature_ai_scripts
 * PROCS USED: sp_error_entry, sp_eai_select_id
 *
 * Create eAI script for NPC to give credit on death
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * trigger_id - ID of trigger NPC that needs to be killed for quest objective
 * 
 * ex: CALL `sp_eai_kill_ondeath`(46,257); -- NPC of ID 46 (Murloc Forager) when killed will give credit for killing NPC with ID 257 (Kobold Worker)
 */
    CALL `sp_error_entry`('NPC',npc_entry);
    UPDATE `creature_template` SET `AIName`= 'EventAI' WHERE `entry`=npc_entry; -- enable eAI

    -- EAI reacting on spellhit, gives credit for kill and despawns
    CALL `sp_eai_select_id`(npc_entry, @event_id);
    INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
        (@event_id,npc_entry,6,0,100,0,0,0,0,0,33,trigger_id,6,0,23,1,0,0,0,0,0,0, 'Stored procedures eAI: quest - kill trigger on NPC death');
END //

CREATE PROCEDURE `sp_eai_cast_onspawn` (IN npc_entry INT(10), spell_id MEDIUMINT(6))
BEGIN
/**
 * DEGREE: AVERAGE
 * TABLES AFFECT: creature_template, creature_ai_scripts
 * PROCS USED: sp_error_entry, sp_eai_select_id
 *
 * Create eAI script for NPC to cast spell on self upon spawn
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * spell_ID - ID of spell we want to set target for
 * 
 * ex: CALL `sp_eai_cast_onspawn`(257,4444); -- Creature of ID 257 (Kobold Worker) will cast spell of ID 4444 on self when spawned
 */
    CALL `sp_error_entry`('NPC',npc_entry);

    UPDATE `creature_template` SET `AIName`= 'EventAI' WHERE `entry`=npc_entry; -- enable eAI
    
    CALL `sp_eai_select_id`(npc_entry,@event_id);
    
    INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
        (@event_id,npc_entry,11,0,100,0,0,0,0,0,11,spell_id,0,0,0,0,0,0,0,0,0,0, 'Stored procedures eAI: NPC cast spell on self');
END //

CREATE PROCEDURE `sp_eai_spawn_spellhit` (IN npc_entry INT(10),IN spell_id MEDIUMINT(6),IN spawn_id INT(10),IN despawn_time INT(10))
BEGIN
/**
 * DEGREE: AVERAGE
 * TABLES AFFECT: creature_template, creature_ai_scripts
 * PROCS USED: sp_error_entry, sp_eai_select_id
 *
 * Create eAI script for NPC to summon another NPC upon spellhit
 *
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * spawn_id - creature that will be spawned at current location of NPC
 * spell_ID - ID of spell which will run the event
 * despawn_time - time after which summoned mob despawns in miliseconds
 * 
 * ex: CALL `sp_eai_spawn_spellhit` (1234,4444,1235,100000); -- summon c1235 when c1234 is hit with s4444 (c1235 depsawns after 10s)
 */
    CALL `sp_error_entry`('NPC',npc_entry);
    CALL `sp_error_entry`('NPC',spawn_id);

    UPDATE `creature_template` SET `AIName`= 'EventAI' WHERE `entry`=npc_entry; -- enable eAI
    CALL `sp_eai_select_id`(npc_entry,@event_id); -- select event ID

    INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
        (@event_id,npc_entry,8,0,100,1,spell_id,-1,0,0,32,spawn_id,6,0,41,0,0,0,0,0,0,0, 'Stored procedures eAI: quest - summon mob on spellcast');
    INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
        (@event_id+1,spawn_id,1,1,100,0,despawn_time,despawn_time,despawn_time,despawn_time,41,0,0,0,0,0,0,0,0,0,0,0, 'Stored procedures eAI: despawn after defined time');
END //


CREATE PROCEDURE `sp_eai_quest_credit_on_spellhit` (IN npc_entry INT(10), spell_id MEDIUMINT(6), trigger_id INT(10), despawn_time INT(10))
BEGIN
/**
 * DEGREE: AVERAGE
 * TABLES AFFECT: creature_template, creature_ai_scripts
 * PROCS USED: sp_error_entry, sp_error_trigger, sp_eai_select_id
 *
 * Create eAI script for NPC to give credit on spellhit
 *
 * spell_id - ID of spell we want to set target for
 * npc_entry - ID of NPC from `creature_template`.`entry`
 * trigger_id - ID of trigger NPC that needs to be killed for quest objective
 * despawn_time - time before NPC despawns in miliseconds
 * 
 * ex: CALL `sp_eai_quest_credit_on_spellhit` (257,4444,1235,10000); -- Creature of ID 257 when hit with spell of ID 4444 will give credit for killing NPC of ID 1235 and will then despawn after 10 seconds
 */
    CALL `sp_error_entry`('NPC',npc_entry);
    CALL `sp_error_trigger` (trigger_id);
    UPDATE `creature_template` SET `AIName`= 'EventAI' WHERE `entry`=npc_entry; -- enable eAI
    -- EAI reacting on spellhit, gives credit for kill and despawns
        CALL `sp_eai_select_id` (npc_entry, @event_id);
    INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
        (@event_id,npc_entry,8,0,100,1,spell_ID,-1,0,0,33,trigger_ID,6,0,23,1,0,0,0,0,0,0, 'Stored procedures eAI: quest - kill trigger on spellcast');
    INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
        (@event_id+1,npc_entry,1,1,100,0,despawn_time,despawn_time,despawn_time,despawn_time,41,0,0,0,0,0,0,0,0,0,0,0, 'Stored procedures eAI: despawn after defined time');
END //
DELIMITER ;

-- == =================== ==
-- ==   UPDATEPACK 34     ==
-- == =================== ==

-- Fix a procedure
DROP PROCEDURE IF EXISTS `sp_get_go_lootid`;

-- Temporarily change the delimiter
DELIMITER ||
CREATE PROCEDURE `sp_get_go_lootid`(IN gobjID MEDIUMINT(6),OUT gobjLootID INT(10))
BEGIN
        CALL `sp_error_entry`('GO',gobjID);
        SELECT `data1` FROM `gameobject_template` WHERE `entry`=gobjID AND `type`=3 INTO gobjLootID;
END||

-- Restore delimiter
DELIMITER ;
-- [10189] Rotface  (By Shauren)
-- Scripted targets for spells (source: SNIFF and brain)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (69508,69783,69797,69799,69802,69782,69796,69798,69801,69540,69538,69553,69610,70079);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,69508,0,18,1,37986,0,0, '', 'Rotface - Slime Spray'),
(13,0,69783,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69797,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69799,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69802,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69782,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69796,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69798,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69801,0,18,1,37013,0,0, '', 'Rotface - Ooze Flood'),
(13,0,69540,0,18,1,36897,0,0, '', 'Rotface - Summon Big Ooze'),
(13,0,69538,0,18,1,36897,0,0, '', 'Rotface - Small Ooze Combine'),
(13,0,69553,0,18,1,36899,0,0, '', 'Rotface - Large Ooze Combine'),
(13,0,69610,0,18,1,36897,0,0, '', 'Rotface - Large Ooze Buff Combine'),
(13,0,70079,0,18,1,36678,0,0, '', 'Rotface - Ooze Flood');
-- Achievements
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12984,12966,12985,12983,13097,13118,13119,13120,12760,12950,13044,13055) AND `type`!=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12984,12,0,0, ''), -- Dances with Oozes (10 player) N
(12966,12,1,0, ''), -- Dances with Oozes (25 player) N
(12985,12,2,0, ''), -- Dances with Oozes (10 player) H
(12983,12,3,0, ''), -- Dances with Oozes (25 player) H
(12984,18,0,0, ''), -- Dances with Oozes (10 player) N
(12966,18,0,0, ''), -- Dances with Oozes (25 player) N
(12985,18,0,0, ''), -- Dances with Oozes (10 player) H
(12983,18,0,0, ''), -- Dances with Oozes (25 player) H
(13097,12,0,0, ''), -- Rotface kills (Icecrown 10 player)
(13118,12,1,0, ''), -- Rotface kills (Icecrown 25 player)
(13119,12,2,0, ''), -- Rotface kills (Heroic Icecrown 10 player)
(13120,12,3,0, ''), -- Rotface kills (Heroic Icecrown 25 player)
(12760,12,0,0, ''), -- The Plagueworks (10 player); Rotface
(12950,12,1,0, ''), -- The Plagueworks (25 player); Rotface
(13044,12,2,0, ''), -- Heroic: The Plagueworks (10 player)
(13055,12,3,0, ''); -- Heroic: The Plagueworks (25 player)
-- Faction fixes
-- source: SNIFF
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (36899,38123,3689902,3689903);
-- Triggers (source: SNIFF)
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=37986; -- Ooze Spray Stalker
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=38107; -- Unstable Ooze Explosion Stalker
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80, `faction_A`=14, `faction_H`=14, `spell1`=69776, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=37006; -- Sticky Ooze
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80 WHERE `entry`=37006; -- Puddle Stalker
-- Delete dynamic trigger spawns
DELETE FROM `creature` WHERE `id` IN (37986,38107,37006);
-- Prevent respawns
DELETE FROM `creature_linked_respawn` WHERE `guid` IN (200992,201129,201122,201255,201433,201294,201493,201286,201577,201246);
INSERT INTO `creature_linked_respawn` (`guid`,`linkedGuid`) VALUES
(200992,200992), -- Lord Marrowgar
(201129,201129), -- Lady Deathwhisper
(201122,201122), -- Deathbringer Saurfang
(201255,201255), -- Festergut
(201433,201433), -- Rotface
(201294,201294), -- Professor Putricide
(201493,201493), -- Prince Keleseth
(201286,201286), -- Prince Taldaram
(201577,201577), -- Prince Valanar
(201246,201246); -- Blood-Queen Lana'thel
-- [10207] Razorscale Ulduar (By Supabad)
UPDATE `creature_template` SET `mechanic_immune_mask`=650854235 WHERE `entry`=33724; -- immune mask to 25 man version of razorscale
UPDATE `creature_template` SET `mechanic_immune_mask`=650854235 WHERE `entry`=33186; -- immune mask to 10 man version of razorscale
UPDATE `creature_template` SET `equipment_id`=574 WHERE `entry`=33850; -- add equipment to 25 man version adds
UPDATE `creature_template` SET `equipment_id`=1863 WHERE `entry`=33852; -- add equipment to 25 man version adds
UPDATE `creature_template` SET `equipment_id`=1787 WHERE `entry`=33851; -- add equipment to 25 man version adds
UPDATE `creature_template` SET `unit_flags`=33554438 WHERE `entry`=33184; -- disable move, set not selectable, set non attackable
DELETE FROM `creature` WHERE `id` IN (33186,33233,33282);
-- using same guid that razorscale had before
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(94373,33186,603,3,1,0,0,587.073,-203.205,441.237,1.60532,604800,0,0,3555975,0,0,0);
-- [10230] Professor Putricide (by Shauren)
-- Scripted targets for spells (source: SNIFF and brain)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (72401,71617,71621,71412,71415,72850,72851,72852,71704,72745,72746,72747,72748);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,72401,0,18,1,37672,0,0, '', 'Putricide - Mutated Abomination'),
(13,0,72401,0,18,1,38285,0,0, '', 'Putricide - Mutated Abomination'),
(13,0,71617,0,18,1,38317,0,0, '', 'Putricide - Tear Gas'),
(13,0,71412,0,18,1,37824,0,0, '', 'Putricide - Unstable Experiment'),
(13,0,71415,0,18,1,37824,0,0, '', 'Putricide - Unstable Experiment'),
(13,0,71621,0,18,1,38309,1,0, '', 'Putricide - Green Bottle'),
(13,0,72850,0,18,1,38309,1,0, '', 'Putricide - Green Bottle'),
(13,0,72851,0,18,1,38309,1,0, '', 'Putricide - Green Bottle'),
(13,0,72852,0,18,1,38309,1,0, '', 'Putricide - Green Bottle'),
(13,0,71621,0,18,1,38308,2,0, '', 'Putricide - Orange Bottle'),
(13,0,72850,0,18,1,38308,2,0, '', 'Putricide - Orange Bottle'),
(13,0,72851,0,18,1,38308,2,0, '', 'Putricide - Orange Bottle'),
(13,0,72852,0,18,1,38308,2,0, '', 'Putricide - Orange Bottle'),
(13,0,71704,0,18,1,38309,1,0, '', 'Putricide - Green Bottle'),
(13,0,71704,0,18,1,38308,2,0, '', 'Putricide - Orange Bottle'),
(13,0,72745,0,18,1,36678,0,0, '', 'Putricide - Mutated Plague'),
(13,0,72746,0,18,1,36678,0,0, '', 'Putricide - Mutated Plague'),
(13,0,72747,0,18,1,36678,0,0, '', 'Putricide - Mutated Plague'),
(13,0,72748,0,18,1,36678,0,0, '', 'Putricide - Mutated Plague');
-- Triggers (source: SNIFF)
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80, `faction_A`=14, `faction_H`=14, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=38317; -- Tear Gas Stalker
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80, `faction_A`=14, `faction_H`=14, `flags_extra`=`flags_extra`|0x80, `InhabitType`=7 WHERE `entry`=37824; -- Abomination Wing Mad Scientist Stalker
UPDATE `creature_template` SET `exp`=2, `minlevel`=80, `maxlevel`=80, `faction_A`=14, `faction_H`=14, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=38234; -- Growing Ooze Puddle Trigger
UPDATE `creature_template` SET `scale`=2.4, `exp`=2, `minlevel`=80, `maxlevel`=80, `faction_A`=14, `faction_H`=14, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=37690; -- Growing Ooze Puddle
UPDATE `creature` SET `position_x`=4324.278, `position_y`=3215.039, `position_z`=408.7053, `orientation`=5.585053 WHERE `guid`=201304;
-- Delete duplicate spawns
DELETE FROM `creature` WHERE `guid` IN (201165,201484,201408,201461,201390,201005,201554,201140,201656,201541,201099,201111,201529);
DELETE FROM `creature_addon` WHERE `guid` IN (201165,201484,201408,201461,201390,201005,201554,201140,201656,201541,201099,201111,201529);
DELETE FROM `creature` WHERE `id` IN (38308,38309);
-- free GUID just deleted, this adds a second spawn in the same place, its blizzlike
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(201165,37824,631,15,1,0,0,4388.1,3213.29,408.74,3.83972,86400,0,0,25200,0,0,0,0,0,0);
-- faction fixes (source: SNIFF)
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (37562,38602,38760,38761); -- Gas Cloud
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (37697,38604,38758,38759); -- Volatile Ooze
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `faction_A`=14, `faction_H`=14, `baseattacktime`=1500, `unit_flags`=33554432, `AIName`='PassiveAI' WHERE `entry`=38309;
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `faction_A`=14, `faction_H`=14, `baseattacktime`=1500, `unit_flags`=33554432, `AIName`='PassiveAI' WHERE `entry`=38308;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `flags_extra`=`flags_extra`|0x80 WHERE `entry`=38159; -- Choking Gas Bomb
-- Vehicle spells
UPDATE `creature_template` SET `spell1`=70360, `spell2`=70539, `spell3`=70542 WHERE `entry`=37672; -- Mutated Abomination 10 Man
UPDATE `creature_template` SET `spell1`=72527, `spell2`=72457, `spell3`=70542 WHERE `entry`=38285; -- Mutated Abomination 25 Man
-- Achievement data
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12987,12968,12988,12981,12987,12968,12988,12981,12761,12951,13045,13056,13100,13127,13128,13129) AND `type`!=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12987,12,0,0, ''), -- Nausea, Heartburn, Indigestion... (10 player)
(12968,12,1,0, ''), -- Nausea, Heartburn, Indigestion... (25 player)
(12988,12,2,0, ''), -- Nausea, Heartburn, Indigestion... (10 player)
(12981,12,3,0, ''), -- Nausea, Heartburn, Indigestion... (25 player)
(12987,18,0,0, ''), -- Nausea, Heartburn, Indigestion... (10 player)
(12968,18,0,0, ''), -- Nausea, Heartburn, Indigestion... (25 player)
(12988,18,0,0, ''), -- Nausea, Heartburn, Indigestion... (10 player)
(12981,18,0,0, ''), -- Nausea, Heartburn, Indigestion... (25 player)
(12761,12,0,0, ''), -- The Plagueworks (10 player)
(12951,12,1,0, ''), -- The Plagueworks (25 player)
(13045,12,2,0, ''), -- Heroic: The Plagueworks (10 player)
(13056,12,3,0, ''), -- Heroic: The Plagueworks (25 player)
(13100,12,0,0, ''), -- Professor Putricide kills (Icecrown 10 player)
(13127,12,1,0, ''), -- Professor Putricide kills (Icecrown 25 player)
(13128,12,2,0, ''), -- Professor Putricide kills (Heroic Icecrown 10 player)
(13129,12,3,0, ''); -- Professor Putricide kills (Heroic Icecrown 25 player)
-- Gameobject flags and factions
UPDATE `gameobject_template` SET `flags`=33, `faction`=114 WHERE `entry`=201825; -- Saurfang's Door
UPDATE `gameobject_template` SET `flags`=33, `faction`=114 WHERE `entry`=201371; -- Orange Plague Monster Entrance
UPDATE `gameobject_template` SET `flags`=33, `faction`=114 WHERE `entry`=201370; -- Green Plague Monster Entrance
UPDATE `gameobject_template` SET `flags`=33, `faction`=114 WHERE `entry`=201372; -- Scientist Entrance
-- [10246] Bronjahm (by Shauren)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=68861;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,68861,0,18,1,36497,0,0, '', 'Bronjahm - Consume Soul');
-- [10269] Uldaman (by Manuel)
-- Update for quest 2240 (can be completed by horde and alli, no quest items)
-- more info at: http://forum.trinity...cant-be-opened/
-- NOT FIXED ON TDB 335.11.34 YET
-- JUST ENABLE REENABLE IT
UPDATE `gameobject_loot_template` SET `lootmode`=1, `ChanceOrQuestChance`=100 WHERE `entry`=5066 AND `item`=7740;
UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry`=6910 AND `item`=7741;
-- ALLY AND HORDE CAN SEE THE IRONAYA EVENT (BLIZZ)
-- THE WRONG CONDITIONS SHOULD BE DELETED
DELETE FROM `conditions` WHERE `ConditionValue1`=2240;
-- [10284] Blood Prince Council  (By Shauren)
-- Delete dynamic spawns
DELETE FROM `creature` WHERE `id` IN (38451,38332,38422,38458,38454);
DELETE FROM `creature` WHERE `guid` IN (201618,201637,201470,201447,201295,201377,201544);
DELETE FROM `creature_addon` WHERE `guid` IN (201618,201637,201470,201447,201295,201377,201544);
-- Gameobject flags and factions
UPDATE `gameobject_template` SET `flags`=32,`faction`=1375 WHERE `entry`=201376;
UPDATE `gameobject_template` SET `flags`=32,`faction`=1375 WHERE `entry`=201378;
UPDATE `gameobject_template` SET `flags`=32,`faction`=1375 WHERE `entry`=201377;
UPDATE `gameobject_template` SET `flags`=48,`faction`=1375 WHERE `entry`=201746;
UPDATE `gameobject_template` SET `flags`=40 WHERE `entry`=201755;
UPDATE `gameobject` SET `animprogress`=255 WHERE `guid`=150334;
-- Extra flags
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x100 WHERE `entry` IN (37562,38602,38760,38761); -- Gas Cloud
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x100 WHERE `entry` IN (37697,38604,38758,38759); -- Volatile Ooze
-- Triggers
UPDATE `creature_template` SET `InhabitType`=5,`flags_extra`=`flags_extra`|0x80 WHERE `entry`=30298;
UPDATE `creature_template` SET `InhabitType`=5,`minlevel`=82,`maxlevel`=82,`faction_A`=14,`faction_H`=14,`speed_walk`=0.142857 WHERE `entry` IN (38454,38775,
38776,38777); -- Kinetic Bomb
UPDATE `creature_template` SET `minlevel`=82,`maxlevel`=82,`flags_extra`=`flags_extra`|0x80 WHERE `entry`=38458; -- Kinetic Bomb Target
UPDATE `creature_template` SET `minlevel`=82,`maxlevel`=82,`exp`=2,`flags_extra`=`flags_extra`|0x80 WHERE `entry`=38422; -- Shock Vortex
UPDATE `creature_template` SET `minlevel`=82,`maxlevel`=82,`exp`=2,`speed_walk`=1.57143,`unit_flags`=33554432,`flags_extra`=`flags_extra`|0x80 WHERE `entry`=
38332; -- Ball of Flame
UPDATE `creature_template` SET `minlevel`=82,`maxlevel`=82,`exp`=2,`speed_walk`=1.57143,`unit_flags`=33554432,`flags_extra`=`flags_extra`|0x80 WHERE `entry`=
38451; -- Ball of Inferno Flame
-- Regen & flags (from sniff)
UPDATE `creature_template` SET `unit_flags`=536904000,`RegenHealth`=0,`equipment_id`=10092,`speed_run`=1.428571,`speed_walk`=1.6 WHERE `entry` IN (37970,38401,38784,38785); -- Prince Valanar
UPDATE `creature_template` SET `unit_flags`=536904000,`RegenHealth`=0,`equipment_id`=10077,`speed_run`=1.428571,`speed_walk`=1.6 WHERE `entry` IN (37972,38399,38769,38770); -- Prince Keleseth
UPDATE `creature_template` SET `unit_flags`=536904000,`RegenHealth`=0,`equipment_id`=10091,`speed_run`=1.428571,`speed_walk`=1.6 WHERE `entry` IN (37973,38400,38771,38772); -- Prince Taldaram
UPDATE `creature_model_info` SET `bounding_radius`=0.5425,`combat_reach`=1.75 WHERE `modelid` IN (30856,30857,30858);
UPDATE `creature_template` SET `RegenHealth`=0 WHERE `entry`=38369; -- Dark Nucleus
-- Scripted Targets
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (70952,70982,70981,70983,71070,71081,71080);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=21 AND `SourceGroup` IN (37672,38285);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(21,37672,71516,0,3,49888,0,0,0, '', 'Mutated Abomination - Unholy Infusion'),
(21,38285,71516,0,3,49888,0,0,0, '', 'Mutated Abomination - Unholy Infusion'),
(13,0,70952,0,18,1,37970,0,0, '', 'Valanar - Invocation of Blood'),
(13,0,70982,0,18,1,37973,0,0, '', 'Taldaram - Invocation of Blood'),
(13,0,70981,0,18,1,37972,0,0, '', 'Keleseth - Invocation of Blood'),
(13,0,70983,0,18,1,37970,0,0, '', 'Valanar - Invocation of Blood beam'),
(13,0,70983,0,18,1,37973,0,0, '', 'Taldaram - Invocation of Blood beam'),
(13,0,70983,0,18,1,37972,0,0, '', 'Keleseth - Invocation of Blood beam'),
(13,0,71070,0,18,1,37970,0,0, '', 'Valanar - Invocation of Blood visual'),
(13,0,71081,0,18,1,37973,0,0, '', 'Taldaram - Invocation of Blood visual'),
(13,0,71080,0,18,1,37972,0,0, '', 'Keleseth - Invocation of Blood visual');
-- additional data
DELETE FROM `creature_addon` WHERE `guid`=201252;
INSERT INTO `creature_addon` (`guid`, `bytes1`) VALUES
(201252,0x03000000); -- Blood Queen Lana'Thel
-- Auras
DELETE FROM `creature_template_addon` WHERE `entry` IN (38454,38332,38451);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`auras`) VALUES
(38454,0x03000000, ''), -- Kinetic Bomb
(38332,0x03000000, '55891 0 55891 1'), -- Ball of Flame
(38451,0x03000000, '55891 0 55891 1'); -- Ball of Inferno Flame
-- Unholy Infusion quest
UPDATE `creature_template` SET `spell6`=71516 WHERE `entry`=37672; -- Mutated Abomination 10 Man
UPDATE `creature_template` SET `spell6`=71516 WHERE `entry`=38285; -- Mutated Abomination 25 Man
-- Fix random respawn time
UPDATE `creature` SET `spawntimesecs`=86400 WHERE `guid`=201444;
-- Model fixes (source: WDB)
UPDATE `creature_template` SET `modelid1`=19725,`modelid2`=26767,`WDBVerified`=12340 WHERE `entry`=38332; -- Ball of Flame
UPDATE `creature_template` SET `modelid1`=19725,`modelid2`=26767,`WDBVerified`=12340 WHERE `entry`=38451; -- Ball of Inferno Flame
UPDATE `creature_template` SET `modelid1`=19725,`modelid2`=21342,`WDBVerified`=12340 WHERE `entry`=38458; -- Kinetic Bomb Target
UPDATE `creature_template` SET `modelid1`=19725,`modelid2`=31095 WHERE `entry` IN (38454,38775,38776,38777); -- Kinetic Bomb
-- Achievement data
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (13033,12969,13034,13032,12762,12763,12952,12953,13046,13047,13057,13058,13098,13121,13122,13123,13101,13130,13131,13132) AND `type`!=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(13033,12,0,0, ''), -- The Orb Whisperer (10 player)
(12969,12,1,0, ''), -- The Orb Whisperer (25 player)
(13034,12,2,0, ''), -- The Orb Whisperer (10 player)
(13032,12,3,0, ''), -- The Orb Whisperer (25 player)
(13033,18,0,0, ''), -- The Orb Whisperer (10 player)
(12969,18,0,0, ''), -- The Orb Whisperer (25 player)
(13034,18,0,0, ''), -- The Orb Whisperer (10 player)
(13032,18,0,0, ''), -- The Orb Whisperer (25 player)
(12762,12,0,0, ''), -- The Crimson Hall (10 player) - Defeat the Blood Prince Council
(12763,12,0,0, ''), -- The Crimson Hall (10 player) - Defeat Blood-Queen Lana'thel
(12952,12,1,0, ''), -- The Crimson Hall (25 player) - Defeat the Blood Prince Council
(12953,12,1,0, ''), -- The Crimson Hall (25 player) - Defeat Blood-Queen Lana'thel
(13046,12,2,0, ''), -- Heroic: The Crimson Hall (10 player) - Defeat the Blood Prince Council
(13047,12,2,0, ''), -- Heroic: The Crimson Hall (10 player) - Defeat Blood-Queen Lana'thel
(13057,12,3,0, ''), -- Heroic: The Crimson Hall (25 player) - Defeat the Blood Prince Council
(13058,12,3,0, ''), -- Heroic: The Crimson Hall (25 player) - Defeat Blood-Queen Lana'thel
(13098,12,0,0, ''), -- Blood Prince Council kills (Icecrown 10 player)
(13121,12,1,0, ''), -- Blood Prince Council kills (Icecrown 25 player)
(13122,12,2,0, ''), -- Blood Prince Council kills (Heroic Icecrown 10 player)
(13123,12,3,0, ''), -- Blood Prince Council kills (Heroic Icecrown 25 player)
(13101,12,0,0, ''), -- Blood Queen Lana'thel kills (Icecrown 10 player)
(13130,12,1,0, ''), -- Blood Queen Lana'thel kills (Icecrown 25 player)
(13131,12,2,0, ''), -- Blood Queen Lana'thel kills (Heroic Icecrown 10 player)
(13132,12,3,0, ''); -- Blood Queen Lana'thel kills (Heroic Icecrown 25 player)
-- [10325] ToC5 exploit fix (by Brian)
-- Remove vehicle IDs from mounts that should not have them
UPDATE `creature_template` SET `VehicleId`=0 WHERE `entry` IN (33299,33409,33301,33414,33418,33416,33297,33298,33300,33408);

# ===================
-- Blood Orb Controllers:
UPDATE `creature_template` SET `difficulty_entry_1`=38641,`difficulty_entry_2`=38773,`difficulty_entry_3`=38774 WHERE `entry`=38008; -- add the only option for difficulty entries
CALL `sp_set_npc_trigger_bylist` ('38641,38773,38774,38008',1); -- set them as triggers

REPLACE INTO `creature` VALUES (201252,38004,631,15,1,31093,0,4686.46,2769.38,377.477,3.14159,86400,0,0,12006645,4258,0,0,0,0,0);
REPLACE INTO `creature_template` VALUES (38004,0,0,0,0,0,31093,0,0,0,'Blood-Queen Lana\'thel','','',0,83,83,2,16,16,0,1.6,1.42857,1,3,496,674,0,783,35,0,0,2,33088,8,0,0,0,0,0,365,529,98,6,108,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,861,1,1,0,0,0,0,0,0,0,150,1,0,0,0,'npc_blood_queen_lana_thel',12340);
REPLACE INTO `game_event_creature` VALUES (38004,23);
REPLACE INTO `game_event_gameobject` VALUES (38004,12);
REPLACE INTO `script_texts` VALUES (38004,-1631115,'Foolish mortals. You thought us defeated so easily? The San\'layn are the Lich King\'s immortal soldiers! Now you shall face their might combined!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16795,1,0,1,'SAY_INTRO_1');
REPLACE INTO `script_texts` VALUES (38004,-1631116,'Rise up, brothers, and destroy our enemies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16796,1,0,0,'SAY_INTRO_2');
#
#update gameobject_template set faction=114,flags=33 where entry in (201376,201377,201378);
update gameobject set state=0 where id=201376;
INSERT INTO `spell_script_names` VALUES (70903,'spell_cultist_dark_martyrdom');
INSERT INTO `spell_script_names` VALUES (71236,'spell_cultist_dark_martyrdom');

# new TDB 11.36
REPLACE INTO `creature_template` VALUES (18254,0,0,0,0,0,17644,0,0,0,'Shadow of Aran',NULL,NULL,0,63,63,1,35,35,0,1,1.14286,1,3,181,253,0,268,35,2000,0,1,0,8,0,0,0,0,0,147,219,32,6,76,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,280,20,1,0,0,0,0,0,0,0,164,1,0,617299803,1,'mob_shadow_of_aran',12340);
REPLACE INTO `creature_template` VALUES (11673,0,0,0,0,0,12189,0,0,0,'Ancient Core Hound',NULL,NULL,0,62,62,0,54,54,0,1.3,1.14286,1,1,172,240,0,262,7.5,2000,0,1,64,8,45,0,0,0,0,139,207,30,1,65545,11673,0,11673,0,93,0,0,0,0,19272,19319,19369,19365,0,0,0,0,0,0,0,0,'',1,3,35,1,1,0,20951,0,0,0,0,0,165,1,0,0,0,'mob_ancient_core_hound',12340);
REPLACE INTO `creature_template` VALUES (22055,0,0,0,0,0,20772,0,0,0,'Coilfang Elite',NULL,NULL,0,70,70,1,14,14,0,1,1.14286,1,1,252,357,0,304,7.5,2000,0,1,1,8,0,0,0,0,0,215,320,44,7,72,0,0,0,0,0,0,0,0,0,38260,38262,0,0,0,0,0,0,0,0,0,0,'',0,3,17.5,1,1,0,0,0,0,0,0,0,144,1,0,652427263,0,'mob_coilfang_elite',12340);
REPLACE INTO `creature_template` VALUES (22056,0,0,0,0,0,18194,0,0,0,'Coilfang Strider',NULL,NULL,0,70,70,1,14,14,0,1,1.14286,1,1,252,357,0,304,7.5,2000,0,1,1,8,0,0,0,0,0,215,320,44,1,72,0,0,0,0,0,0,0,0,0,38259,0,0,0,0,0,0,0,0,0,0,0,'',0,3,17.5,1,1,0,0,0,0,0,0,0,113,1,0,0,0,'mob_coilfang_strider',12340);

# OLD CTDB 321
#INSERT INTO `creature_template` VALUES (18254,0,0,0,0,0,17644,0,0,0,'Shadow of Aran','','',0,73,73,1,14,14,0,1,1.14286,1,3,225,337,0,84,9.6,2000,2000,8,0,0,0,0,0,0,0,180,270,67,6,76,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,3.01262,20,1,0,0,0,0,0,0,0,164,1,0,617299803,1,'',1);
#INSERT INTO `creature_template` VALUES (11673,0,0,0,0,0,12189,0,0,0,'Ancient Core Hound','','',0,62,62,0,14,14,0,3.63,1.14286,1,1,76,114,0,28,7.3,1000,1000,1,0,0,45,0,0,0,0,61,91,22,1,65545,11673,0,11673,0,0,0,0,0,0,19272,19319,19364,19365,0,0,0,0,0,0,0,0,'',1,3,35,1,1,0,20951,0,0,0,0,0,165,1,0,1,0,'',11723);
#INSERT INTO `creature_template` VALUES (22055,0,0,0,0,0,20772,0,0,0,'Coilfang Elite','','',0,70,70,1,14,14,0,1,1.14286,1,1,260,390,0,98,17.9,2000,2000,1,1,0,0,0,0,0,0,208,312,78,7,72,0,0,0,0,0,0,0,0,0,38260,38262,0,0,0,0,0,0,0,0,0,0,'',0,3,17.5,1,1,0,0,0,0,0,0,0,144,1,0,650330111,0,'',1);
#INSERT INTO `creature_template` VALUES (22056,0,0,0,0,0,18194,0,0,0,'Coilfang Strider','','',0,70,70,1,14,14,0,1,1.14286,1,1,260,390,0,98,10,2000,2000,1,1,0,0,0,0,0,0,208,312,78,1,72,0,0,0,0,0,0,0,0,0,38259,0,0,0,0,0,0,0,0,0,0,0,'',0,3,17.5,1,1,0,0,0,0,0,0,0,113,1,0,1,0,'',1);
# festegut
delete from spell_linked_spell where spell_effect =69291;

# rotface
update creature_template set ScriptName='npc_little_ooze' where  ScriptName='npc_ooze_little';
update creature_template set ScriptName='npc_big_ooze' where  ScriptName='npc_ooze_big';

INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES 
(-69674,69706,0, 'Rotface: Mutated Infection Summon'),
(-71224,69706,0, 'Rotface: Mutated Infection Summon'),
(-73022,69706,0, 'Rotface: Mutated Infection Summon'),
(-73023,69706,0, 'Rotface: Mutated Infection Summon');

# pudle_stalker rotface

#INSERT INTO `creature_template` VALUES (37013,0,0,0,0,0,1126,11686,0,0,'Puddle Stalker','','',0,1,1,0,14,14,0,1,1.14286,1,0,2,2,0,24,1,0,0,1,0,8,0,0,0,0,0,1,1,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,4,2,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);

#INSERT INTO `conditions` VALUES (13,0,69125,0,18,1,37013,0,0,'','Festergut - Gaseous Blight Initial cast');
#INSERT INTO `conditions` VALUES (13,0,69783,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69797,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69799,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69802,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69782,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69796,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69798,0,18,1,37013,0,0,'','Rotface - Ooze Flood');
#INSERT INTO `conditions` VALUES (13,0,69801,0,18,1,37013,0,0,'','Rotface - Ooze Flood');

DELETE FROM `creature` WHERE id=37013 and map=631;
INSERT INTO `creature` VALUES (200922,37013,631,15,1,11686,0,4421.9,3092.42,372.456,0.994838,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201018,37013,631,15,1,11686,0,4472.55,3110.78,360.469,2.35619,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201211,37013,631,15,1,11686,0,4244.04,3092.66,372.97,0.977384,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201231,37013,631,15,1,11686,0,4463.86,3101.57,360.469,2.04204,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201267,37013,631,15,1,11686,0,4291.45,3181.25,372.97,4.10152,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201281,37013,631,15,1,11686,0,4411.07,3154.75,360.469,5.81195,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201316,37013,631,15,1,11686,0,4312.36,3160.84,372.97,3.80482,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201332,37013,631,15,1,11686,0,4490.33,3113.29,372.411,2.53073,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201337,37013,631,15,1,11686,0,4481.93,3153.87,360.469,3.57792,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201365,37013,631,15,1,11686,0,4291.18,3092.92,372.97,2.33874,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201382,37013,631,15,1,11686,0,4409.69,3119.34,360.469,0.471239,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201388,37013,631,15,1,11686,0,4419.42,3164.15,360.469,5.46288,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201441,37013,631,15,1,11686,0,4401.28,3112.96,372.431,0.785398,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201445,37013,631,15,1,11686,0,4471.93,3163.9,360.469,3.92699,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201474,37013,631,15,1,11686,0,4243.89,3181.74,372.97,5.44543,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201492,37013,631,15,1,11686,0,4419.03,3109.9,360.469,0.767945,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201494,37013,631,15,1,11686,0,4469.67,3181.77,372.311,4.11898,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201545,37013,631,15,1,11686,0,4480.85,3118.98,360.469,2.67035,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201549,37013,631,15,1,11686,0,4463.88,3172.66,360.469,4.24115,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201563,37013,631,15,1,11686,0,4222.44,3161.69,372.97,5.53269,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201592,37013,631,15,1,11686,0,4428.15,3101.17,360.469,1.11701,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201600,37013,631,15,1,11686,0,4421.79,3181.76,372.29,5.46288,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201602,37013,631,15,1,11686,0,4469.68,3092.91,372.325,2.35619,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201620,37013,631,15,1,11686,0,4223.47,3113.58,372.97,0.767945,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201648,37013,631,15,1,11686,0,4401.32,3160.83,372.316,5.55015,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201651,37013,631,15,1,11686,0,4490.13,3160.97,372.312,3.82227,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201653,37013,631,15,1,11686,0,4428.96,3173.66,360.469,5.13127,86400,0,0,25200,0,0,0,0,0,0);
INSERT INTO `creature` VALUES (201665,37013,631,15,1,11686,0,4312.14,3112.98,372.97,2.51327,86400,0,0,25200,0,0,0,0,0,0);

INSERT INTO `creature_addon` VALUES (37013,0,0,0,4097,0,NULL);
INSERT INTO `creature` VALUES (201369,38008,631,15,1,16925,0,4687.2,2769.48,364.17,3.14159,86400,0,0,5647725,0,0,0,0,0,0);
UPDATE `creature_template` SET `ScriptName`='boss_prince_valanar_icc' WHERE `entry` = 37970;
UPDATE `creature_template` SET `ScriptName`='boss_prince_keleseth_icc' WHERE `entry` = 37972;
UPDATE `creature_template` SET `ScriptName`='boss_prince_taldaram_icc' WHERE `entry` = 37973;
#update creature_template set unit_flags=33088 where entry=37973;
#update creature set curhealth=1 where id in (37970,37972,37973);
update creature set curhealth=1 where id in (37972,37973);
#update creature set curhealth=5647725 where id=37970;

#update creature_template set unit_flags=0 where entry in (37973,38400,38771,38772);
#update creature_template set unit_flags=0 where entry in (37972,38399,38769,38770);
#update creature_template set unit_flags=0 where entry in (37970,38401,38784,38785);


UPDATE gameobject_template set faction=0,flags=0 where entry=201741;
DELETE FROM gameobject where id=201741;
INSERT INTO `gameobject` VALUES (150323,201741,631,15,1,4573.8,2854.84,384.684,1.93731,0,0,0,1,6000,100,1);
INSERT INTO `gameobject` VALUES (150347,201741,631,15,1,4522.76,2769.22,351.101,-3.10665,0,0,0,1,6000,100,1);
INSERT INTO `gameobject` VALUES (150356,201741,631,15,1,4574.18,2683.47,384.684,-0.593412,0,0,0,1,6000,100,1);
#UPDATE `creature_template` SET `spell1` = 70360, `spell2`= 70539, `spell3`= 70542, `VehicleId` = 591 WHERE `entry`= 37672;
#UPDATE `creature_template` SET `spell1` = 72527, `spell2`= 72457, `spell3`= 70542, `VehicleId` = 591 WHERE `entry`= 38285;
#-- Vehicle spells tdb
#UPDATE `creature_template` SET `spell1`=70360, `spell2`=70539, `spell3`=70542 WHERE `entry`=37672; -- Mutated Abomination 10 Man
#UPDATE `creature_template` SET `spell1`=72527, `spell2`=72457, `spell3`=70542 WHERE `entry`=38285; -- Mutated Abomination 25 Man


#update creature_template set unit_flags=0,faction_H=35,faction_A=35 where entry in (37672,38605,38786,38787);
#update creature_template set unit_flags=0,faction_H=14,faction_A=14,IconName='vehichleCursor',ScriptName='' where entry in (37672,38605,38786,38787);
#update creature_template set unit_flags=0,faction_H=14,faction_A=14,IconName='vehichleCursor',ScriptName='' where entry in (37672,38605,38786,38787);
#update creature_template set spell1=72527,spell2=70539,spell3=70542,spell6=71516,ScriptName='' where  entry in (37672,38605,38786,38787);


delete from spell_linked_spell where spell_trigger in (70360,-70308);
update creature_template set spell1=70360,spell2=70539,spell3=70542,spell6=71516,ScriptName='',Vehicleid=591,unit_flags=0 where  entry in (37672,38605,38786,38787);

UPDATE creature_template SET spell1=72527,spell2=72457,spell3=70542,spell6=71516,ScriptName='',Vehicleid=591 WHERE `entry` in (38285,38788,38789,38790);


#update creature_template set spell1=70360,spell2=70539,spell3=70542,ScriptName='',Vehicleid=591  where entry in (38285,38788,38789,38790);

#update creature_template set faction_H=1802,faction_A=1802  where entry in (37672,38605,38786,38787);
#update creature_template set Vehicleid=591  where entry in (37672,38605,38786,38787);
#,type=10,type_flags=0 where entry in (37672,38605,38786,38787);
#37672 |              38605 |              38786 |              38787 


#update creature_template set vehicleid=587 where entry in (36678,38431,38585,38586);
#-- 38309 надо посадить на 36678,38431,38585,38586 действуют каждый отдельно 0 сиденье наверно сначала
#-- 38308 надо посадить на 36678,38431,38585,38586 действуют каждый отдельно 1 сиденье этот наверно на 2 фазе или наоборот

# professoru
#INSERT INTO `creature_addon` VALUES (38308,0,0,0,4097,0,NULL);
#REPLACE INTO `creature_template` VALUES (38308,0,0,0,0,0,22769,0,0,0,'Ooze Covered Tentacle Stalker','','',0,83,83,2,14,14,0,1,1.14286,1,3,422,586,0,642,35,1500,0,1,33554432,8,0,0,0,0,0,345,509,103,6,108,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'PassiveAI',0,3,250,1,1,0,0,0,0,0,0,0,0,1,0,0,0,'',12340);
#INSERT INTO `game_event_gameobject` VALUES (38308,12);

#INSERT INTO `creature_addon` VALUES (38309,0,0,0,4097,0,NULL);
#REPLACE INTO `creature_template` VALUES (38309,0,0,0,0,0,22769,0,0,0,'Slimy Tentacle Stalker','','',0,83,83,2,14,14,0,1,1.14286,1,3,422,586,0,642,35,1500,0,1,33554432,8,0,0,0,0,0,345,509,103,6,108,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'PassiveAI',0,3,250,1,1,0,0,0,0,0,0,0,0,1,0,0,0,'',12340);
#INSERT INTO `game_event_gameobject` VALUES (38309,12);
