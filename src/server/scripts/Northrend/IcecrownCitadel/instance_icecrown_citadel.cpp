/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

#define MAX_ENCOUNTER      12

class instance_icecrown_citadel : public InstanceMapScript
{
    public:
        instance_icecrown_citadel() : InstanceMapScript("instance_icecrown_citadel", 631) { }

        struct instance_icecrown_citadel_InstanceMapScript : public InstanceScript
        {
            instance_icecrown_citadel_InstanceMapScript(InstanceMap* pMap) : InstanceScript(pMap)
            {
                uiDifficulty = pMap->GetDifficulty();

                uiLordMarrowgar         = 0;
                uiLadyDeathwhisper      = 0;
                uiGunship               = 0;
		putricideTable          = 0;
                uiDeathbringerSaurfang  = 0;
                uiFestergut             = 0;
                uiRotface               = 0;
                uiStinky                = 0;
                uiPrecious              = 0;
                uiProfessorPutricide    = 0;
                uiAbomination           = 0;
                uiPrinceValanar         = 0;
                uiPrinceKeleseth        = 0;
                uiPrinceTaldaram        = 0;
                uiBloodQueenLanathel    = 0;
                uiValithriaDreamwalker  = 0;
                uiSindragosa            = 0;
                uiLichKing              = 0;
                m_uiSaurfangCacheGUID   = 0;
		bloodCouncilController = 0;

                uiAngle                 = 0;
                uiSpawn                 = 0;
                uiBoned                 = 0;
                uiIceWall1              = 0;
                uiIceWall2              = 0;
                uiMarrowgarEntrance     = 0;
                uiLadyDeathwisperTransporter = 0;
                uiOratoryDoor           = 0;
                uiSaurfangDoor          = 0;
                uiOrangeMonsterDoor     = 0;
                uiGreenMonsterDoor      = 0;
                uiProfCollisionDoor     = 0;
                uiOrangePipe            = 0;
                uiGreenPipe             = 0;
                uiOozeValve             = 0;
                uiGasValve              = 0;
                uiProfDoorOrange        = 0;
                uiProfDoorGreen         = 0;
                uiRotfaceEntrance       = 0;
                uiFestergurtEntrance    = 0;
                uiProffesorDoor         = 0;
                uiBloodwingDoor         = 0;
                uiCrimsonHallDoor1      = 0;
                uiCrimsonHallDoor2      = 0;
                uiCrimsonHallDoor3      = 0;
                uiBloodQueenTransporter = 0;
                uiFrostwingDoor         = 0;
                uiDragonDoor1           = 0;
                uiDragonDoor2           = 0;
                uiDragonDoor3           = 0;
                uiRoostDoor1            = 0;
                uiRoostDoor2            = 0;
                uiRoostDoor3            = 0;
                uiRoostDoor4            = 0;
                uiValithriaTransporter  = 0;
                uiSindragossaTransporter = 0;
                uiSindragosaDoor1       = 0;
                uiSindragosaDoor2       = 0;
		uiArthasPlatform        = 0;
                uiFirstTp               = 0;
                uiMarrowgarTp           = 0;
                uiFlightWarTp           = 0;
                uiSaurfangTp            = 0;
                uiCitadelTp             = 0;
                uiSindragossaTp         = 0;
                uiLichTp                = 0;

                memset(&uiEncounter, 0, sizeof(uiEncounter));
            };

            bool IsEncounterInProgress() const
            {
                for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                {
                    if (uiEncounter[i] == IN_PROGRESS)
                        return true;
                }

                return false;
            }

            void OnCreatureCreate(Creature* pCreature, bool /*add*/)
            {
                switch(pCreature->GetEntry())
                {
                    case CREATURE_MARROWGAR:
                        uiLordMarrowgar = pCreature->GetGUID();
                        break;
                    case CREATURE_DEATHWHISPER:
                        uiLadyDeathwhisper = pCreature->GetGUID();
                        break;
                    case CREATURE_GUNSHIP:
                        uiGunship = pCreature->GetGUID();
                        break;
                    case CREATURE_SAURFANG:
                        uiDeathbringerSaurfang = pCreature->GetGUID();
                        break;
                    case CREATURE_FESTERGURT:
                        uiFestergut = pCreature->GetGUID();
                        break;
                    case CREATURE_ROTFACE:
                        uiRotface = pCreature->GetGUID();
                        break;
                    case CREATURE_STINKY:
                        uiStinky = pCreature->GetGUID();
                        break;
                    case CREATURE_PRECIOUS:
                        uiPrecious = pCreature->GetGUID();
                        break;
                    case CREATURE_PROFESSOR_PUTRICIDE:
                        uiProfessorPutricide = pCreature->GetGUID();
                        break;
                    case CREATURE_PRINCE_VALANAR_ICC:
                        uiPrinceValanar = pCreature->GetGUID();
                        break;
                    case CREATURE_PRINCE_KELESETH_ICC:
                        uiPrinceKeleseth = pCreature->GetGUID();
                        break;
                    case CREATURE_PRINCE_TALDARAM_ICC:
                        uiPrinceTaldaram = pCreature->GetGUID();
                        break;
                    case CREATURE_BLOOD_QUEEN_LANATHEL:
                        uiBloodQueenLanathel = pCreature->GetGUID();
                        break;
                    case CREATURE_VALITHRIA_DREAMWALKER:
                        uiValithriaDreamwalker = pCreature->GetGUID();
                        break;
                    case CREATURE_SINDRAGOSA:
                        uiSindragosa = pCreature->GetGUID();
                        break;
                    case CREATURE_LICH_KING:
                        uiLichKing = pCreature->GetGUID();
                        break;
                    case NPC_BLOOD_ORB_CONTROLLER:
                        bloodCouncilController = pCreature->GetGUID();
                        break;
                }
            }

            void OnGameObjectCreate(GameObject* pGo, bool /*add*/)
            {
                switch (pGo->GetEntry())
                {
                    case LORD_ICE_WALL_1:
                        uiIceWall1 = pGo->GetGUID();
                        if (uiEncounter[0] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case LORD_ICE_WALL_2:
                        uiIceWall2 = pGo->GetGUID();
                        if (uiEncounter[0] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case LORD_ENTRANCE:
                        uiMarrowgarEntrance = pGo->GetGUID();
                        if (uiEncounter[0] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case ORATORY_ENTRANCE:
                        uiOratoryDoor = pGo->GetGUID();
                        if (uiEncounter[1] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case SAURFANG_DOOR:
                        uiSaurfangDoor = pGo->GetGUID();
                        if (uiEncounter[3] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case BLOODWING_DOOR:
                        uiBloodwingDoor = pGo->GetGUID();
                        if (uiEncounter[3] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case FROSTWING_DOOR:
                        uiFrostwingDoor = pGo->GetGUID();
                        if (uiEncounter[3] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case CRIMSONHALL_DOOR:
                        uiCrimsonHallDoor1 = pGo->GetGUID();
                        if (uiEncounter[7] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case CRIMSONHALL_DOOR_1:
                        uiCrimsonHallDoor2 = pGo->GetGUID();
                        if (uiEncounter[7] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case CRIMSONHALL_DOOR_2:
                        uiCrimsonHallDoor3 = pGo->GetGUID();
                        if (uiEncounter[7] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case DRAGON_DOOR_1:
                        uiDragonDoor1 = pGo->GetGUID();
                        if (uiEncounter[9] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case DRAGON_DOOR_2:
                        uiDragonDoor2 = pGo->GetGUID();
                        if (uiEncounter[9] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case DRAGON_DOOR_3:
                        uiDragonDoor3 = pGo->GetGUID();
                        if (uiEncounter[9] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case DREAMWALKER_DOOR_1:
                        uiRoostDoor1 = pGo->GetGUID();
                        if (uiEncounter[9] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case DREAMWALKER_DOOR_2:
                        uiRoostDoor2 = pGo->GetGUID();
                        if (uiEncounter[9] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case DREAMWALKER_DOOR_3:
                        uiRoostDoor3 = pGo->GetGUID();
                        if (uiEncounter[9] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case DREAMWALKER_DOOR_4:
                        uiRoostDoor4 = pGo->GetGUID();
                        if (uiEncounter[9] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case SINDRAGOSSA_DOOR_1:
                        uiSindragosaDoor1 = pGo->GetGUID();
                        if (uiEncounter[10] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case SINDRAGOSSA_DOOR_2:
                        uiSindragosaDoor2 = pGo->GetGUID();
                        if (uiEncounter[10] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case PROF_COLLISION_DOOR:
                        uiProfCollisionDoor = pGo->GetGUID();
			if (uiEncounter[4] == DONE && uiEncounter[5] == DONE)
                            HandleGameObject(uiProfCollisionDoor, true, pGo);
//                        if (uiEncounter[4] == NOT_STARTED)
//                            HandleGameObject(NULL, false, pGo);
                        break;
                    case GREEN_PIPE:
                        uiGreenPipe = pGo->GetGUID();
                        if (uiEncounter[5] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case OOZE_VALVE:
                        uiOozeValve = pGo->GetGUID();
                        if (uiEncounter[5] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case PROF_DOOR_GREEN:
                        uiProfDoorGreen = pGo->GetGUID();
			if (uiEncounter[4] == DONE && uiEncounter[5] == DONE)
                            HandleGameObject(uiProfDoorGreen, true, pGo);
                        break;
                    case ORANGE_PIPE:
                        uiOrangePipe = pGo->GetGUID();
                        if (uiEncounter[4] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case GAS_VALVE:
                        uiGasValve = pGo->GetGUID();
                        if (uiEncounter[4] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case PROF_DOOR_ORANGE:
                        uiProfDoorOrange = pGo->GetGUID();
			if (uiEncounter[4] == DONE && uiEncounter[5] == DONE)
                            HandleGameObject(uiProfDoorOrange, true, pGo);
                        break;
                    case ROTFACE_DOOR:
                        uiGreenMonsterDoor = pGo->GetGUID();
                        if (uiEncounter[5] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case FESTERGUT_DOOR:
                        uiOrangeMonsterDoor = pGo->GetGUID();
                        if (uiEncounter[4] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case PROFESSOR_DOOR:
                        uiProffesorDoor = pGo->GetGUID();
                        if (uiEncounter[6] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case SAURFANG_CACHE_10_N:
                    case SAURFANG_CACHE_25_N:
                    case SAURFANG_CACHE_10_H:
                    case SAURFANG_CACHE_25_H:
                        m_uiSaurfangCacheGUID = pGo->GetGUID();
                        break;
                    case DREAMWALKER_CACHE_10_N:
                    case DREAMWALKER_CACHE_25_N:
                    case DREAMWALKER_CACHE_10_H:
                    case DREAMWALKER_CACHE_25_H:
                        m_uiDreamwalkerCacheGUID = pGo->GetGUID();
                        break;
                    case LADY_ELEVATOR:
                        uiLadyDeathwisperTransporter = pGo->GetGUID();
                        break;
                    case BLOODQUEEN_ELEVATOR:
                        uiBloodQueenTransporter = pGo->GetGUID();
                        break;
                    case VALITHRIA_ELEVATOR:
                        uiValithriaTransporter = pGo->GetGUID();
                        break;
                    case SINDRAGOSSA_ELEVATOR:
                        uiSindragossaTransporter = pGo->GetGUID();
                        break;
                    case ARTHAS_PLATFORM:
                        uiArthasPlatform = pGo->GetGUID();
                        break;
                    case FIRST_TELEPORT:
                        uiFirstTp = pGo->GetGUID();
                        if (uiEncounter[0] == DONE)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case LORD_TELEPORT:
                        uiMarrowgarTp = pGo->GetGUID();
                        if (uiEncounter[0] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case GUNSHIP_TELEPORT:
                        uiFlightWarTp = pGo->GetGUID();
                        if (uiEncounter[2] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case SAURFANG_TELEPORT:
                        uiSaurfangTp = pGo->GetGUID();
                        if (uiEncounter[4] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case CITADEL_TELEPORT:
                        uiCitadelTp = pGo->GetGUID();
                        if (uiEncounter[4] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case SINDRAGOSSA_TELEPORT:
                        uiSindragossaTp = pGo->GetGUID();
                        if(uiEncounter[10] == NOT_STARTED)
                            HandleGameObject(NULL, true, pGo);
                        break;
                    case LICH_TELEPORT:
                        uiLichTp = pGo->GetGUID();
                        if(uiEncounter[10] == NOT_STARTED)
                            HandleGameObject(NULL, false, pGo);
                        break;
                    case GO_DRINK_ME:
                        putricideTable = pGo->GetGUID();
                        break;
                }
            }

            uint64 GetData64(uint32 identifier)
            {
                switch(identifier)
                {
                    case DATA_MARROWGAR:              return uiLordMarrowgar;
                    case DATA_DEATHWHISPER:           return uiLadyDeathwhisper;
                    case DATA_GUNSHIP_BATTLE:         return uiGunship;
                    case DATA_SAURFANG:               return uiDeathbringerSaurfang;
                    case DATA_FESTERGUT:             return uiFestergut;
                    case DATA_ROTFACE:                return uiRotface;
                    case DATA_STINKY:                 return uiStinky;
                    case DATA_PRECIOUS:               return uiPrecious;
                    case DATA_PROFESSOR_PUTRICIDE:    return uiProfessorPutricide;
                    case DATA_ABOMINATION:            return uiAbomination;
                    case DATA_PRINCE_VALANAR_ICC:     return uiPrinceValanar;
                    case DATA_PRINCE_KELESETH_ICC:    return uiPrinceKeleseth;
                    case DATA_PRINCE_TALDARAM_ICC:    return uiPrinceTaldaram;
		    case DATA_BLOOD_PRINCES_CONTROL:
                        return bloodCouncilController;
                    case DATA_PUTRICIDE_TABLE:
                        return putricideTable;
                    case DATA_BLOOD_QUEEN_LANATHEL:   return uiBloodQueenLanathel;
                    case DATA_VALITHRIA_DREAMWALKER:  return uiValithriaDreamwalker;
                    case DATA_SINDRAGOSA:             return uiSindragosa;
                    case DATA_LICH_KING:              return uiLichKing;
                    case DATA_ANGLE:                  return uiAngle;
                    case DATA_BONED:                  return uiBoned;
                    case DATA_SPAWN:                  return uiSpawn;
	            case DATA_PLATFORM:               return uiArthasPlatform;
                }
                return 0;
            }

            void SetData(uint32 type, uint32 data)
            {
                switch(type)
                {
                    case DATA_MARROWGAR_EVENT:
                        if(data == DONE)
                        {
                            HandleGameObject(uiIceWall1, true);
                            HandleGameObject(uiIceWall2, true);
                            HandleGameObject(uiMarrowgarEntrance, true);
                            if (GameObject* FirstTp = instance->GetGameObject(uiFirstTp))
                            {
                                FirstTp->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                                FirstTp->SetGoState(GOState(0));
                            }
                            if (GameObject* MarrowgarTp = instance->GetGameObject(uiMarrowgarTp))
                            {
                                MarrowgarTp->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                                MarrowgarTp->SetGoState(GOState(0));
                            }
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiIceWall1, false);
                            HandleGameObject(uiIceWall2, false);
                            HandleGameObject(uiMarrowgarEntrance, true);
                            if (GameObject* FirstTp = instance->GetGameObject(uiFirstTp))
                            {
                                FirstTp->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                            }
                            if (GameObject* MarrowgarTp = instance->GetGameObject(uiMarrowgarTp))
                            {
                                MarrowgarTp->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                            }
                        }
                        if(data == IN_PROGRESS)
                            HandleGameObject(uiMarrowgarEntrance, false);
                        uiEncounter[0] = data;
                        break;
                    case DATA_DEATHWHISPER_EVENT:
                        if(data == DONE)
                        {
                            HandleGameObject(uiOratoryDoor, true);
                            if (GameObject* pGO = instance->GetGameObject(uiLadyDeathwisperTransporter))
                            {
                                pGO->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                pGO->SetGoState(GO_STATE_READY);
                            }
                            if (GameObject* FlightWarTp = instance->GetGameObject(uiFlightWarTp))
                            {
                                FlightWarTp->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                                FlightWarTp->SetGoState(GOState(0));
                            }
                            if (GameObject* SaurfangTp = instance->GetGameObject(uiSaurfangTp))
                            {
                                SaurfangTp->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                                SaurfangTp->SetGoState(GOState(0));
                            }
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiOratoryDoor, true);
                            if (GameObject* FlightWarTp = instance->GetGameObject(uiFlightWarTp))
                            {
                                FlightWarTp->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                            }
                            if (GameObject* SaurfangTp = instance->GetGameObject(uiSaurfangTp))
                            {
                                SaurfangTp->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                            }
                        }
                        if(data == IN_PROGRESS)
                            HandleGameObject(uiOratoryDoor, false);
                        uiEncounter[1] = data;
                        break;
                    /*case DATA_GUNSHIP_BATTLE_EVENT:
                        switch(data)
                        {
                            case DONE:
                                break;
                            case NOT_STARTED:
                                break;
                        }
                        uiEncounter[2] = data;
                        break;*/
                    case DATA_SAURFANG_EVENT:
                        if(data == DONE)
                        {
                            if (GameObject* pChest = instance->GetGameObject(m_uiSaurfangCacheGUID))
                            {
                                pChest->SetRespawnTime(pChest->GetRespawnDelay());
                            }
                            if (GameObject* CitadelTp = instance->GetGameObject(uiCitadelTp))
                            {
                                CitadelTp->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                                CitadelTp->SetGoState(GOState(0));
                            }
                            HandleGameObject(uiSaurfangDoor, true);
                            HandleGameObject(uiBloodwingDoor, true);
                            HandleGameObject(uiFrostwingDoor, true);
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiSaurfangDoor, false);
                            HandleGameObject(uiBloodwingDoor, false);
                            HandleGameObject(uiFrostwingDoor, false);
                            if (GameObject* CitadelTp = instance->GetGameObject(uiCitadelTp))
                            {
                                CitadelTp->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                            }
                        }
                        if(data == IN_PROGRESS)
                        {
                            HandleGameObject(uiSaurfangDoor, false);
                            HandleGameObject(uiBloodwingDoor, false);
                            HandleGameObject(uiFrostwingDoor, false);
                        }
                        uiEncounter[3] = data;
                        break;
                    case DATA_FESTERGUT_EVENT:
                        if(data == DONE)
                        {
                            HandleGameObject(uiOrangeMonsterDoor, true);
                            HandleGameObject(uiOrangePipe, true);
                            HandleGameObject(uiGasValve, true);
                            if (uiEncounter[5] == DONE)
                            {
                                HandleGameObject(uiProfCollisionDoor, true);
                                if (GameObject* Oprofessordoor = instance->GetGameObject(uiProfDoorOrange))
                                    Oprofessordoor->SetGoState(GOState(2));
                                if (GameObject* Oprofessordoor = instance->GetGameObject(uiProfDoorGreen))
                                    Oprofessordoor->SetGoState(GOState(2));
                            }
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiOrangeMonsterDoor, true);
                            HandleGameObject(uiOrangePipe, false);
                            HandleGameObject(uiGasValve, false);
                            HandleGameObject(uiProfDoorOrange, false);
                        }
                        if(data == IN_PROGRESS)
                        {
                            HandleGameObject(uiOrangeMonsterDoor, false);
                            HandleGameObject(uiOrangePipe, false);
                            HandleGameObject(uiGasValve, false);
                            HandleGameObject(uiProfDoorOrange, false);
                        }
                        uiEncounter[4] = data;
                        break;
                    case DATA_ROTFACE_EVENT:
                        if(data == DONE)
                        {
                            HandleGameObject(uiGreenMonsterDoor, true);
                            HandleGameObject(uiGreenPipe, true);
                            HandleGameObject(uiOozeValve, true);
                            if (uiEncounter[4] == DONE)
                            {
                                HandleGameObject(uiProfCollisionDoor, true);
                                if (GameObject* Gprofessordoor = instance->GetGameObject(uiProfDoorGreen))
                                    Gprofessordoor->SetGoState(GOState(2));
                                if (GameObject* Oprofessordoor = instance->GetGameObject(uiProfDoorOrange))
                                    Oprofessordoor->SetGoState(GOState(2));
                            }
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiGreenMonsterDoor, true);
                            HandleGameObject(uiGreenPipe, false);
                            HandleGameObject(uiOozeValve, false);
                            HandleGameObject(uiProfDoorGreen, false);
                        }
                        if(data == IN_PROGRESS)
                        {
                            HandleGameObject(uiGreenMonsterDoor, false);
                            HandleGameObject(uiGreenPipe, false);
                            HandleGameObject(uiOozeValve, false);
                            HandleGameObject(uiProfDoorGreen, false);
                        }
                        uiEncounter[5] = data;
                        break;
                    case DATA_PROFESSOR_PUTRICIDE_EVENT:
                        if(data == DONE)
                            HandleGameObject(uiProffesorDoor, true);
                        if(data == NOT_STARTED)
                            HandleGameObject(uiProffesorDoor, true);
                        if(data == IN_PROGRESS)
                            HandleGameObject(uiProffesorDoor, false);
                        uiEncounter[6] = data;
                        break;
                    case DATA_BLOOD_PRINCE_COUNCIL_EVENT:
                        if(data == DONE)
                        {
                            HandleGameObject(uiCrimsonHallDoor1, true);
                            HandleGameObject(uiCrimsonHallDoor2, true);
                            HandleGameObject(uiCrimsonHallDoor3, true);
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiCrimsonHallDoor1, true);
                            HandleGameObject(uiCrimsonHallDoor2, false);
                            HandleGameObject(uiCrimsonHallDoor3, false);
                        }
                        if(data == IN_PROGRESS)
                            HandleGameObject(uiCrimsonHallDoor1, false);
                        uiEncounter[7] = data;
                        break;
                    case DATA_BLOOD_QUEEN_LANATHEL_EVENT:
                        if(data == DONE)
                        {
                            if (GameObject* pGO = instance->GetGameObject(uiBloodQueenTransporter))
                            {
                                pGO->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                pGO->SetGoState(GO_STATE_READY);
                            }
                        }
                        uiEncounter[8] = data;
                        break;
                    case DATA_VALITHRIA_DREAMWALKER_EVENT:
                        if(data == DONE)
                        {
                            if (GameObject* pChest = instance->GetGameObject(m_uiDreamwalkerCacheGUID))
                            {
                                pChest->SetRespawnTime(pChest->GetRespawnDelay());
                            }
                            if (GameObject* SindragossaTp = instance->GetGameObject(uiSindragossaTp))
                            {
                                SindragossaTp->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                                SindragossaTp->SetGoState(GOState(0));
                            }
                            if (GameObject* pGO = instance->GetGameObject(uiValithriaTransporter))
                            {
                                pGO->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                pGO->SetGoState(GO_STATE_READY);
                            }
                            if (GameObject* pGO = instance->GetGameObject(uiSindragossaTransporter))
                            {
                                pGO->SetUInt32Value(GAMEOBJECT_LEVEL, 0);
                                pGO->SetGoState(GO_STATE_READY);
                            }
                            HandleGameObject(uiDragonDoor1, true);
                            HandleGameObject(uiDragonDoor2, true);
                            HandleGameObject(uiDragonDoor3, true);
                            HandleGameObject(uiRoostDoor1, false);
                            HandleGameObject(uiRoostDoor2, false);
                            HandleGameObject(uiRoostDoor3, false);
                            HandleGameObject(uiRoostDoor4, false);
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiDragonDoor1, true);
                            HandleGameObject(uiDragonDoor2, true);
                            HandleGameObject(uiDragonDoor3, true);
                            HandleGameObject(uiRoostDoor1, false);
                            HandleGameObject(uiRoostDoor2, false);
                            HandleGameObject(uiRoostDoor3, false);
                            HandleGameObject(uiRoostDoor4, false);
                            if (GameObject* SindragossaTp = instance->GetGameObject(uiSindragossaTp))
                                SindragossaTp->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);
                        }
                        if(data == IN_PROGRESS)
                        {
                            if (uiDifficulty == RAID_DIFFICULTY_10MAN_NORMAL || uiDifficulty == RAID_DIFFICULTY_10MAN_HEROIC)
                            {
                                HandleGameObject(uiDragonDoor1, false);
                                HandleGameObject(uiDragonDoor2, false);
                                HandleGameObject(uiRoostDoor3, true);
                                HandleGameObject(uiRoostDoor2, true);
                                HandleGameObject(uiRoostDoor1, false);
                                HandleGameObject(uiRoostDoor4, false);
                            }
                            else
                            {
                                HandleGameObject(uiDragonDoor1, false);
                                HandleGameObject(uiDragonDoor2, false);
                                HandleGameObject(uiRoostDoor1, true);
                                HandleGameObject(uiRoostDoor2, true);
                                HandleGameObject(uiRoostDoor3, true);
                                HandleGameObject(uiRoostDoor4, true);
                            }


                        }
                        uiEncounter[9] = data;
                        break;
                    case DATA_SINDRAGOSA_EVENT:
                        if(data == DONE)
                        {
                            HandleGameObject(uiSindragosaDoor1, true);
                            HandleGameObject(uiSindragosaDoor2, true);
                        }
                        if(data == NOT_STARTED)
                        {
                            HandleGameObject(uiSindragosaDoor1, true);
                            HandleGameObject(uiSindragosaDoor2, true);
                        }
                        if(data == IN_PROGRESS)
                        {
                            HandleGameObject(uiSindragosaDoor1, false);
                            HandleGameObject(uiSindragosaDoor2, false);
                        }
                        uiEncounter[10] = data;
                        break;
                    case DATA_LICH_KING_EVENT:
                        uiEncounter[11] = data;
                        break;
                }

                if (data == DONE)
                    SaveToDB();
            }

            uint32 GetData(uint32 type)
            {
                switch(type)
                {
                case DATA_MARROWGAR_EVENT:
                    return uiEncounter[0];
                case DATA_DEATHWHISPER_EVENT:
                    return uiEncounter[1];
                case DATA_GUNSHIP_BATTLE_EVENT:
                    return uiEncounter[2];
                case DATA_SAURFANG_EVENT:
                    return uiEncounter[3];
                case DATA_FESTERGUT_EVENT:
                    return uiEncounter[4];
                case DATA_ROTFACE_EVENT:
                    return uiEncounter[5];
                case DATA_PROFESSOR_PUTRICIDE_EVENT:
                    return uiEncounter[6];
                case DATA_BLOOD_PRINCE_COUNCIL_EVENT:
                    return uiEncounter[7];
                case DATA_BLOOD_QUEEN_LANATHEL_EVENT:
                    return uiEncounter[8];
                case DATA_VALITHRIA_DREAMWALKER_EVENT:
                    return uiEncounter[9];
                case DATA_SINDRAGOSA_EVENT:
                    return uiEncounter[10];
                case DATA_LICH_KING_EVENT:
                    return uiEncounter[11];
                }
                return 0;
            }

            std::string GetSaveData()
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << "I C" << uiEncounter[0] << " " << uiEncounter[1] << " " << uiEncounter[2] << " " << uiEncounter[3]
                << " " << uiEncounter[4] << " " << uiEncounter[5] << " " << uiEncounter[6] << " " << uiEncounter[7] << " " << uiEncounter[8]
                << " " << uiEncounter[9] << " " << uiEncounter[10] << " " << uiEncounter[11];

                OUT_SAVE_INST_DATA_COMPLETE;
                return saveStream.str();
            }

            void Load(const char* in)
            {
                if (!in)
                {
                    OUT_LOAD_INST_DATA_FAIL;
                    return;
                }

                OUT_LOAD_INST_DATA(in);

                char dataHead1, dataHead2;
                uint32 data0,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11;

                std::istringstream loadStream(in);
                loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3 >> data4 >> data5 >> data6 >> data7 >> data8 >> data9 >> data10 >> data11;

                if (dataHead1 == 'I' && dataHead2 == 'C')
                {
                    uiEncounter[0] = data0;
                    uiEncounter[1] = data1;
                    uiEncounter[2] = data2;
                    uiEncounter[3] = data3;
                    uiEncounter[4] = data4;
                    uiEncounter[5] = data5;
                    uiEncounter[6] = data6;
                    uiEncounter[7] = data7;
                    uiEncounter[8] = data8;
                    uiEncounter[9] = data9;
                    uiEncounter[10] = data10;
                    uiEncounter[11] = data11;

                    for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                    {
                        loadStream >> uiEncounter[i];

                        if (uiEncounter[i] == IN_PROGRESS)
                            uiEncounter[i] = NOT_STARTED;
                    }

                } else OUT_LOAD_INST_DATA_FAIL;

                OUT_LOAD_INST_DATA_COMPLETE;
            }

        private:
            uint64 uiLordMarrowgar;
            uint64 uiLadyDeathwhisper;
            uint64 uiGunship;
            uint64 uiDeathbringerSaurfang;
            uint64 uiFestergut;
            uint64 uiRotface;
            uint64 uiStinky;
            uint64 uiPrecious;
            uint64 uiProfessorPutricide;
            uint64 uiAbomination;
            uint64 uiPrinceValanar;
            uint64 uiPrinceKeleseth;
            uint64 uiPrinceTaldaram;
            uint64 uiBloodQueenLanathel;
            uint64 uiValithriaDreamwalker;
            uint64 uiSindragosa;
            uint64 uiLichKing;
            uint64 uiIceWall1;
            uint64 uiIceWall2;
            uint64 uiMarrowgarEntrance;
            uint64 uiFrozenThrone;
            uint64 m_uiSaurfangCacheGUID;
            uint64 uiLadyDeathwisperTransporter;
            uint64 uiOratoryDoor;
            uint64 uiSaurfangDoor;
            uint64 uiOrangeMonsterDoor;
            uint64 uiGreenMonsterDoor;
            uint64 uiProfCollisionDoor;
            uint64 uiOrangePipe;
            uint64 uiGreenPipe;
            uint64 uiOozeValve;
            uint64 uiGasValve;
            uint64 uiProfDoorOrange;
            uint64 uiProfDoorGreen;
            uint64 uiRotfaceEntrance;
            uint64 uiFestergurtEntrance;
            uint64 uiProffesorDoor;
            uint64 uiBloodwingDoor;
            uint64 uiCrimsonHallDoor1;
            uint64 uiCrimsonHallDoor2;
            uint64 uiCrimsonHallDoor3;
            uint64 uiBloodQueenTransporter;
            uint64 uiFrostwingDoor;
            uint64 uiDragonDoor1;
            uint64 uiDragonDoor2;
            uint64 uiDragonDoor3;
            uint64 uiRoostDoor1;
            uint64 uiRoostDoor2;
            uint64 uiRoostDoor3;
            uint64 uiRoostDoor4;
            uint64 uiValithriaTransporter;
            uint64 uiSindragossaTransporter;
            uint64 m_uiDreamwalkerCacheGUID;
            uint64 uiSindragosaDoor1;
            uint64 uiSindragosaDoor2;
            uint64 uiArthasPlatform;
            uint64 uiFirstTp;
            uint64 uiMarrowgarTp;
            uint64 uiFlightWarTp;
            uint64 uiSaurfangTp;
            uint64 uiCitadelTp;
            uint64 uiSindragossaTp;
            uint64 uiLichTp;
            uint8 uiDifficulty;
            uint8 uiBoned;
	    uint64 bloodCouncilController;
            uint8 uiSpawn;
            uint64 putricideTable;
            uint64 uiAngle;
            uint32 uiEncounter[MAX_ENCOUNTER];
        };

        InstanceScript* GetInstanceScript(InstanceMap* pMap) const
        {
            return new instance_icecrown_citadel_InstanceMapScript(pMap);
        }
};

void AddSC_instance_icecrown_citadel()
{
    new instance_icecrown_citadel();
}
