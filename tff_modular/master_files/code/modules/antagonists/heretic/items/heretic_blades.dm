// Даёт серпу еретика возможность блокировать пули и лазеры с шансом 30%.
// Не-еретики имеют шанс 50% быть порезанными клинком и застаненными на 5 секунд(Стан такой же как при попытке ударить клинком)
/obj/item/melee/sickly_blade/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text, final_block_chance, damage, attack_type, damage_type)
	if(!IS_HERETIC_OR_MONSTER(owner))
		if(prob(50) && attack_type == PROJECTILE_ATTACK)
			to_chat(owner, span_danger("You feel a pulse of alien intellect lash out at your mind! It pushes you to cut yourself!"))
			owner.AdjustParalyzed(5 SECONDS)
			owner.take_bodypart_damage(20,25,check_armor = FALSE)
			var/turf/T = get_turf(owner)
			T.visible_message(span_warning("Unknown force pushes [owner] to cut themself by the blade!"))
			final_block_chance = 0
			return FALSE
	else
		if(attack_type == PROJECTILE_ATTACK)
			final_block_chance = 30
			return TRUE
