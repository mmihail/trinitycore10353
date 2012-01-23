/*
* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

enum Spells
{
	SPELL_72039             =    72039,   
};


/*HACK*/
class boss_blood_elf_valanar_icc : public CreatureScript
{
    public:
        boss_blood_elf_valanar_icc() : CreatureScript("boss_blood_elf_valanar_icc") { }

        struct boss_blood_elf_valanar_iccAI : public BossAI
        {
            boss_blood_elf_valanar_iccAI(Creature* pCreature) : BossAI(pCreature, DATA_PRINCE_VALANAR_ICC)
            {
                pInstance = me->GetInstanceScript();
            }

            void Reset()
            {

		m_ui72039Timer = 20000;
                if(pInstance && me->isAlive())
                    pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, NOT_STARTED);
            }

            void JustDied(Unit* /*pKiller*/)
            {
                if(pInstance)
                    pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, DONE);
            }

            void EnterCombat(Unit* /*who*/)
            {
                if(pInstance)
                    pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, IN_PROGRESS);
            }

            void JustReachedHome()
            {
                if(pInstance)
                    pInstance->SetData(DATA_BLOOD_PRINCE_COUNCIL_EVENT, FAIL);
            }

            void KilledUnit(Unit* /*victim*/) { }

            void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                        if (m_ui72039Timer < uiDiff)
                        {
                                Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0);
                                DoCast(pTarget, SPELL_72039);
                                m_ui72039Timer = 30000;
                        } else m_ui72039Timer -= uiDiff;

                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* pInstance;
		uint32 m_ui72039Timer;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_blood_elf_valanar_iccAI(pCreature);
        }
};

class boss_blood_elf_taldaram_icc : public CreatureScript
{
    public:
        boss_blood_elf_taldaram_icc() : CreatureScript("boss_blood_elf_taldaram_icc") { }

        struct boss_blood_elf_taldaram_iccAI : public BossAI
        {
            boss_blood_elf_taldaram_iccAI(Creature* pCreature) : BossAI(pCreature, DATA_PRINCE_TALDARAM_ICC)
            {
                pInstance = me->GetInstanceScript();
            }

            void Reset() { }

            void EnterCombat(Unit* /*who*/) { }

            void KilledUnit(Unit* /*victim*/) { }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                DoMeleeAttackIfReady();
            }
        private:
            InstanceScript* pInstance;
        };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_blood_elf_taldaram_iccAI(pCreature);
        }
};

class boss_blood_elf_keleset_icc : public CreatureScript
{
    public:
    boss_blood_elf_keleset_icc() : CreatureScript("boss_blood_elf_keleset_icc") { }

    struct boss_blood_elf_keleset_iccAI : public BossAI
    {
        boss_blood_elf_keleset_iccAI(Creature* pCreature) : BossAI(pCreature, DATA_PRINCE_KELESETH_ICC)
        {
            pInstance = me->GetInstanceScript();
        }

        void Reset() { }

        void EnterCombat(Unit* /*who*/) { }

        void KilledUnit(Unit* /*victim*/) { }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;
            DoMeleeAttackIfReady();
        }
    private:
        InstanceScript* pInstance;
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_blood_elf_keleset_iccAI(pCreature);
    }
};

void AddSC_boss_rat_des_blutes()
{
    new boss_blood_elf_valanar_icc();
    new boss_blood_elf_taldaram_icc();
    new boss_blood_elf_keleset_icc();
}
