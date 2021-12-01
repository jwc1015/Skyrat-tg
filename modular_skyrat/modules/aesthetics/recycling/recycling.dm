/obj/machinery/conveyor
	/// Is the conveyor flipped? Useful for conveyor belt corners, really.
	var/flipped = FALSE
	icon = 'modular_skyrat/modules/aesthetics/recycling/recycling.dmi'

/obj/machinery/conveyor/attackby_secondary(obj/item/weapon, mob/living/user, params)
	if(weapon.tool_behaviour == TOOL_SCREWDRIVER)
		if(!(machine_stat & BROKEN))
			flipped = !flipped
			update_move_direction()
			to_chat(user, span_notice("You flip [src] around."))

	else if(!user.combat_mode)
		user.transferItemToLoc(weapon, drop_location())
	else
		return ..()

/obj/machinery/conveyor/examine(mob/user)
	. = ..()
	if(verted < 0)
		. += span_notice("It is currently set to go in reverse.")
	. += "\nClick with a wrench to rotate."
	. += "Left-click with a screwdriver to invert its direction."
	. += "Right-click with a screwdriver to flip it around."

/obj/machinery/conveyor_switch
	icon = 'modular_skyrat/modules/aesthetics/recycling/recycling.dmi'

/obj/item/conveyor_switch_construct
	icon = 'modular_skyrat/modules/aesthetics/recycling/recycling.dmi'

