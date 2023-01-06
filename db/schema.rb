# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_06_140326) do
  create_table "abilities", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "generation_id", null: false
    t.boolean "is_main_series", null: false
    t.index ["is_main_series"], name: "ix_abilities_is_main_series"
  end

  create_table "ability_changelog", force: :cascade do |t|
    t.integer "ability_id", null: false
    t.integer "changed_in_version_group_id", null: false
  end

  create_table "ability_changelog_prose", primary_key: ["ability_changelog_id", "local_language_id"], force: :cascade do |t|
    t.integer "ability_changelog_id", null: false
    t.integer "local_language_id", null: false
    t.text "effect", null: false
  end

  create_table "ability_flavor_text", primary_key: ["ability_id", "version_group_id", "language_id"], force: :cascade do |t|
    t.integer "ability_id", null: false
    t.integer "version_group_id", null: false
    t.integer "language_id", null: false
    t.text "flavor_text", null: false
  end

  create_table "ability_names", primary_key: ["ability_id", "local_language_id"], force: :cascade do |t|
    t.integer "ability_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_ability_names_name"
  end

  create_table "ability_prose", primary_key: ["ability_id", "local_language_id"], force: :cascade do |t|
    t.integer "ability_id", null: false
    t.integer "local_language_id", null: false
    t.text "short_effect"
    t.text "effect"
  end

  create_table "berries", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "firmness_id", null: false
    t.integer "natural_gift_power"
    t.integer "natural_gift_type_id"
    t.integer "size", null: false
    t.integer "max_harvest", null: false
    t.integer "growth_time", null: false
    t.integer "soil_dryness", null: false
    t.integer "smoothness", null: false
  end

  create_table "berry_firmness", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "berry_firmness_names", primary_key: ["berry_firmness_id", "local_language_id"], force: :cascade do |t|
    t.integer "berry_firmness_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_berry_firmness_names_name"
  end

  create_table "berry_flavors", primary_key: ["berry_id", "contest_type_id"], force: :cascade do |t|
    t.integer "berry_id", null: false
    t.integer "contest_type_id", null: false
    t.integer "flavor", null: false
  end

  create_table "characteristic_text", primary_key: ["characteristic_id", "local_language_id"], force: :cascade do |t|
    t.integer "characteristic_id", null: false
    t.integer "local_language_id", null: false
    t.string "message", limit: 79, null: false
    t.index ["message"], name: "ix_characteristic_text_message"
  end

  create_table "characteristics", force: :cascade do |t|
    t.integer "stat_id", null: false
    t.integer "gene_mod_5", null: false
    t.index ["gene_mod_5"], name: "ix_characteristics_gene_mod_5"
  end

  create_table "conquest_episode_names", primary_key: ["episode_id", "local_language_id"], force: :cascade do |t|
    t.integer "episode_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_conquest_episode_names_name"
  end

  create_table "conquest_episode_warriors", primary_key: ["episode_id", "warrior_id"], force: :cascade do |t|
    t.integer "episode_id", null: false
    t.integer "warrior_id", null: false
  end

  create_table "conquest_episodes", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_kingdom_names", primary_key: ["kingdom_id", "local_language_id"], force: :cascade do |t|
    t.integer "kingdom_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_conquest_kingdom_names_name"
  end

  create_table "conquest_kingdoms", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "type_id", null: false
  end

  create_table "conquest_max_links", primary_key: ["warrior_rank_id", "pokemon_species_id"], force: :cascade do |t|
    t.integer "warrior_rank_id", null: false
    t.integer "pokemon_species_id", null: false
    t.integer "max_link", null: false
  end

  create_table "conquest_move_data", primary_key: "move_id", force: :cascade do |t|
    t.integer "power"
    t.integer "accuracy"
    t.integer "effect_chance"
    t.integer "effect_id", null: false
    t.integer "range_id", null: false
    t.integer "displacement_id"
  end

  create_table "conquest_move_displacement_prose", primary_key: ["move_displacement_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_displacement_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "short_effect"
    t.text "effect"
  end

  create_table "conquest_move_displacements", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.boolean "affects_target", null: false
  end

  create_table "conquest_move_effect_prose", primary_key: ["conquest_move_effect_id", "local_language_id"], force: :cascade do |t|
    t.integer "conquest_move_effect_id", null: false
    t.integer "local_language_id", null: false
    t.text "short_effect"
    t.text "effect"
  end

  create_table "conquest_move_effects", force: :cascade do |t|
  end

  create_table "conquest_move_range_prose", primary_key: ["conquest_move_range_id", "local_language_id"], force: :cascade do |t|
    t.integer "conquest_move_range_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
  end

  create_table "conquest_move_ranges", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "targets", null: false
  end

  create_table "conquest_pokemon_abilities", primary_key: ["pokemon_species_id", "slot"], force: :cascade do |t|
    t.integer "pokemon_species_id", null: false
    t.integer "slot", null: false
    t.integer "ability_id", null: false
  end

  create_table "conquest_pokemon_evolution", primary_key: "evolved_species_id", force: :cascade do |t|
    t.integer "required_stat_id"
    t.integer "minimum_stat"
    t.integer "minimum_link"
    t.integer "kingdom_id"
    t.integer "warrior_gender_id"
    t.integer "item_id"
    t.boolean "recruiting_ko_required", null: false
  end

  create_table "conquest_pokemon_moves", primary_key: "pokemon_species_id", force: :cascade do |t|
    t.integer "move_id", null: false
  end

  create_table "conquest_pokemon_stats", primary_key: ["pokemon_species_id", "conquest_stat_id"], force: :cascade do |t|
    t.integer "pokemon_species_id", null: false
    t.integer "conquest_stat_id", null: false
    t.integer "base_stat", null: false
  end

  create_table "conquest_stat_names", primary_key: ["conquest_stat_id", "local_language_id"], force: :cascade do |t|
    t.integer "conquest_stat_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_conquest_stat_names_name"
  end

  create_table "conquest_stats", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.boolean "is_base", null: false
  end

  create_table "conquest_transformation_pokemon", primary_key: ["transformation_id", "pokemon_species_id"], force: :cascade do |t|
    t.integer "transformation_id", null: false
    t.integer "pokemon_species_id", null: false
  end

  create_table "conquest_transformation_warriors", primary_key: ["transformation_id", "present_warrior_id"], force: :cascade do |t|
    t.integer "transformation_id", null: false
    t.integer "present_warrior_id", null: false
  end

  create_table "conquest_warrior_archetypes", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_warrior_names", primary_key: ["warrior_id", "local_language_id"], force: :cascade do |t|
    t.integer "warrior_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_conquest_warrior_names_name"
  end

  create_table "conquest_warrior_rank_stat_map", primary_key: ["warrior_rank_id", "warrior_stat_id"], force: :cascade do |t|
    t.integer "warrior_rank_id", null: false
    t.integer "warrior_stat_id", null: false
    t.integer "base_stat", null: false
  end

  create_table "conquest_warrior_ranks", force: :cascade do |t|
    t.integer "warrior_id", null: false
    t.integer "rank", null: false
    t.integer "skill_id", null: false
  end

  create_table "conquest_warrior_skill_names", primary_key: ["skill_id", "local_language_id"], force: :cascade do |t|
    t.integer "skill_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_conquest_warrior_skill_names_name"
  end

  create_table "conquest_warrior_skills", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_warrior_specialties", primary_key: ["warrior_id", "type_id", "slot"], force: :cascade do |t|
    t.integer "warrior_id", null: false
    t.integer "type_id", null: false
    t.integer "slot", null: false
  end

  create_table "conquest_warrior_stat_names", primary_key: ["warrior_stat_id", "local_language_id"], force: :cascade do |t|
    t.integer "warrior_stat_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_conquest_warrior_stat_names_name"
  end

  create_table "conquest_warrior_stats", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "conquest_warrior_transformation", primary_key: "transformed_warrior_rank_id", force: :cascade do |t|
    t.boolean "is_automatic", null: false
    t.integer "required_link"
    t.integer "completed_episode_id"
    t.integer "current_episode_id"
    t.integer "distant_warrior_id"
    t.integer "female_warlord_count"
    t.integer "pokemon_count"
    t.integer "collection_type_id"
    t.integer "warrior_count"
  end

  create_table "conquest_warriors", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "gender_id", null: false
    t.integer "archetype_id"
  end

  create_table "contest_combos", primary_key: ["first_move_id", "second_move_id"], force: :cascade do |t|
    t.integer "first_move_id", null: false
    t.integer "second_move_id", null: false
  end

  create_table "contest_effect_prose", primary_key: ["contest_effect_id", "local_language_id"], force: :cascade do |t|
    t.integer "contest_effect_id", null: false
    t.integer "local_language_id", null: false
    t.text "flavor_text"
    t.text "effect"
  end

  create_table "contest_effects", force: :cascade do |t|
    t.integer "appeal", null: false
    t.integer "jam", null: false
  end

  create_table "contest_type_names", primary_key: ["contest_type_id", "local_language_id"], force: :cascade do |t|
    t.integer "contest_type_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "flavor"
    t.text "color"
    t.index ["name"], name: "ix_contest_type_names_name"
  end

  create_table "contest_types", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "egg_group_prose", primary_key: ["egg_group_id", "local_language_id"], force: :cascade do |t|
    t.integer "egg_group_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_egg_group_prose_name"
  end

  create_table "egg_groups", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "encounter_condition_prose", primary_key: ["encounter_condition_id", "local_language_id"], force: :cascade do |t|
    t.integer "encounter_condition_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_encounter_condition_prose_name"
  end

  create_table "encounter_condition_value_map", primary_key: ["encounter_id", "encounter_condition_value_id"], force: :cascade do |t|
    t.integer "encounter_id", null: false
    t.integer "encounter_condition_value_id", null: false
  end

  create_table "encounter_condition_value_prose", primary_key: ["encounter_condition_value_id", "local_language_id"], force: :cascade do |t|
    t.integer "encounter_condition_value_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_encounter_condition_value_prose_name"
  end

  create_table "encounter_condition_values", force: :cascade do |t|
    t.integer "encounter_condition_id", null: false
    t.string "identifier", limit: 79, null: false
    t.boolean "is_default", null: false
  end

  create_table "encounter_conditions", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "encounter_method_prose", primary_key: ["encounter_method_id", "local_language_id"], force: :cascade do |t|
    t.integer "encounter_method_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_encounter_method_prose_name"
  end

  create_table "encounter_methods", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "order", null: false
  end

  create_table "encounter_slots", force: :cascade do |t|
    t.integer "version_group_id", null: false
    t.integer "encounter_method_id", null: false
    t.integer "slot"
    t.integer "rarity"
  end

  create_table "encounters", force: :cascade do |t|
    t.integer "version_id", null: false
    t.integer "location_area_id", null: false
    t.integer "encounter_slot_id", null: false
    t.integer "pokemon_id", null: false
    t.integer "min_level", null: false
    t.integer "max_level", null: false
  end

  create_table "evolution_chains", force: :cascade do |t|
    t.integer "baby_trigger_item_id"
  end

  create_table "evolution_trigger_prose", primary_key: ["evolution_trigger_id", "local_language_id"], force: :cascade do |t|
    t.integer "evolution_trigger_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_evolution_trigger_prose_name"
  end

  create_table "evolution_triggers", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "experience", primary_key: ["growth_rate_id", "level"], force: :cascade do |t|
    t.integer "growth_rate_id", null: false
    t.integer "level", null: false
    t.integer "experience", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "generation_names", primary_key: ["generation_id", "local_language_id"], force: :cascade do |t|
    t.integer "generation_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_generation_names_name"
  end

  create_table "generations", force: :cascade do |t|
    t.integer "main_region_id", null: false
    t.string "identifier", limit: 79, null: false
  end

  create_table "growth_rate_prose", primary_key: ["growth_rate_id", "local_language_id"], force: :cascade do |t|
    t.integer "growth_rate_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_growth_rate_prose_name"
  end

  create_table "growth_rates", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.text "formula", null: false
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer "pocket_id", null: false
    t.string "identifier", limit: 79, null: false
  end

  create_table "item_category_prose", primary_key: ["item_category_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_category_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_item_category_prose_name"
  end

  create_table "item_flag_map", primary_key: ["item_id", "item_flag_id"], force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "item_flag_id", null: false
  end

  create_table "item_flag_prose", primary_key: ["item_flag_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_flag_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_item_flag_prose_name"
  end

  create_table "item_flags", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "item_flavor_summaries", primary_key: ["item_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "local_language_id", null: false
    t.text "flavor_summary"
  end

  create_table "item_flavor_text", primary_key: ["item_id", "version_group_id", "language_id"], force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "version_group_id", null: false
    t.integer "language_id", null: false
    t.text "flavor_text", null: false
  end

  create_table "item_fling_effect_prose", primary_key: ["item_fling_effect_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_fling_effect_id", null: false
    t.integer "local_language_id", null: false
    t.text "effect", null: false
  end

  create_table "item_fling_effects", force: :cascade do |t|
  end

  create_table "item_game_indices", primary_key: ["item_id", "generation_id"], force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "generation_id", null: false
    t.integer "game_index", null: false
  end

  create_table "item_names", primary_key: ["item_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_item_names_name"
  end

  create_table "item_pocket_names", primary_key: ["item_pocket_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_pocket_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_item_pocket_names_name"
  end

  create_table "item_pockets", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "item_prose", primary_key: ["item_id", "local_language_id"], force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "local_language_id", null: false
    t.text "short_effect"
    t.text "effect"
  end

  create_table "items", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "category_id", null: false
    t.integer "cost", null: false
    t.integer "fling_power"
    t.integer "fling_effect_id"
  end

  create_table "language_names", primary_key: ["language_id", "local_language_id"], force: :cascade do |t|
    t.integer "language_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_language_names_name"
  end

  create_table "languages", force: :cascade do |t|
    t.string "iso639", limit: 79, null: false
    t.string "iso3166", limit: 79, null: false
    t.string "identifier", limit: 79, null: false
    t.boolean "official", null: false
    t.integer "order"
    t.index ["official"], name: "ix_languages_official"
  end

  create_table "location_area_encounter_rates", primary_key: ["location_area_id", "encounter_method_id", "version_id"], force: :cascade do |t|
    t.integer "location_area_id", null: false
    t.integer "encounter_method_id", null: false
    t.integer "version_id", null: false
    t.integer "rate"
  end

  create_table "location_area_prose", primary_key: ["location_area_id", "local_language_id"], force: :cascade do |t|
    t.integer "location_area_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.index ["name"], name: "ix_location_area_prose_name"
  end

  create_table "location_areas", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "game_index", null: false
    t.string "identifier", limit: 79
  end

  create_table "location_game_indices", primary_key: ["location_id", "generation_id", "game_index"], force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "generation_id", null: false
    t.integer "game_index", null: false
  end

  create_table "location_names", primary_key: ["location_id", "local_language_id"], force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_location_names_name"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "region_id"
    t.string "identifier", limit: 79, null: false
  end

  create_table "machines", primary_key: ["machine_number", "version_group_id"], force: :cascade do |t|
    t.integer "machine_number", null: false
    t.integer "version_group_id", null: false
    t.integer "item_id", null: false
    t.integer "move_id", null: false
  end

  create_table "move_battle_style_prose", primary_key: ["move_battle_style_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_battle_style_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_move_battle_style_prose_name"
  end

  create_table "move_battle_styles", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "move_changelog", primary_key: ["move_id", "changed_in_version_group_id"], force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "changed_in_version_group_id", null: false
    t.integer "type_id"
    t.integer "power"
    t.integer "pp"
    t.integer "accuracy"
    t.integer "priority"
    t.integer "target_id"
    t.integer "effect_id"
    t.integer "effect_chance"
  end

  create_table "move_damage_class_prose", primary_key: ["move_damage_class_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_damage_class_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_move_damage_class_prose_name"
  end

  create_table "move_damage_classes", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "move_effect_changelog", force: :cascade do |t|
    t.integer "effect_id", null: false
    t.integer "changed_in_version_group_id", null: false
  end

  create_table "move_effect_changelog_prose", primary_key: ["move_effect_changelog_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_effect_changelog_id", null: false
    t.integer "local_language_id", null: false
    t.text "effect", null: false
  end

  create_table "move_effect_prose", primary_key: ["move_effect_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_effect_id", null: false
    t.integer "local_language_id", null: false
    t.text "short_effect"
    t.text "effect"
  end

  create_table "move_effects", force: :cascade do |t|
  end

  create_table "move_flag_map", primary_key: ["move_id", "move_flag_id"], force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "move_flag_id", null: false
  end

  create_table "move_flag_prose", primary_key: ["move_flag_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_flag_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_move_flag_prose_name"
  end

  create_table "move_flags", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "move_flavor_summaries", primary_key: ["move_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "local_language_id", null: false
    t.text "flavor_summary"
  end

  create_table "move_flavor_text", primary_key: ["move_id", "version_group_id", "language_id"], force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "version_group_id", null: false
    t.integer "language_id", null: false
    t.text "flavor_text", null: false
  end

  create_table "move_meta", primary_key: "move_id", force: :cascade do |t|
    t.integer "meta_category_id", null: false
    t.integer "meta_ailment_id", null: false
    t.integer "min_hits"
    t.integer "max_hits"
    t.integer "min_turns"
    t.integer "max_turns"
    t.integer "drain", null: false
    t.integer "healing", null: false
    t.integer "crit_rate", null: false
    t.integer "ailment_chance", null: false
    t.integer "flinch_chance", null: false
    t.integer "stat_chance", null: false
    t.index ["ailment_chance"], name: "ix_move_meta_ailment_chance"
    t.index ["crit_rate"], name: "ix_move_meta_crit_rate"
    t.index ["drain"], name: "ix_move_meta_drain"
    t.index ["flinch_chance"], name: "ix_move_meta_flinch_chance"
    t.index ["healing"], name: "ix_move_meta_healing"
    t.index ["max_hits"], name: "ix_move_meta_max_hits"
    t.index ["max_turns"], name: "ix_move_meta_max_turns"
    t.index ["min_hits"], name: "ix_move_meta_min_hits"
    t.index ["min_turns"], name: "ix_move_meta_min_turns"
    t.index ["stat_chance"], name: "ix_move_meta_stat_chance"
  end

  create_table "move_meta_ailment_names", primary_key: ["move_meta_ailment_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_meta_ailment_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_move_meta_ailment_names_name"
  end

  create_table "move_meta_ailments", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.index ["identifier"], name: "ix_move_meta_ailments_identifier", unique: true
  end

  create_table "move_meta_categories", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.index ["identifier"], name: "ix_move_meta_categories_identifier", unique: true
  end

  create_table "move_meta_category_prose", primary_key: ["move_meta_category_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_meta_category_id", null: false
    t.integer "local_language_id", null: false
    t.text "description", null: false
  end

  create_table "move_meta_stat_changes", primary_key: ["move_id", "stat_id"], force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "stat_id", null: false
    t.integer "change", null: false
    t.index ["change"], name: "ix_move_meta_stat_changes_change"
  end

  create_table "move_names", primary_key: ["move_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_move_names_name"
  end

  create_table "move_target_prose", primary_key: ["move_target_id", "local_language_id"], force: :cascade do |t|
    t.integer "move_target_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_move_target_prose_name"
  end

  create_table "move_targets", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "generation_id", null: false
    t.integer "type_id", null: false
    t.integer "power"
    t.integer "pp"
    t.integer "accuracy"
    t.integer "priority", null: false
    t.integer "target_id", null: false
    t.integer "damage_class_id", null: false
    t.integer "effect_id", null: false
    t.integer "effect_chance"
    t.integer "contest_type_id"
    t.integer "contest_effect_id"
    t.integer "super_contest_effect_id"
  end

  create_table "nature_battle_style_preferences", primary_key: ["nature_id", "move_battle_style_id"], force: :cascade do |t|
    t.integer "nature_id", null: false
    t.integer "move_battle_style_id", null: false
    t.integer "low_hp_preference", null: false
    t.integer "high_hp_preference", null: false
  end

  create_table "nature_names", primary_key: ["nature_id", "local_language_id"], force: :cascade do |t|
    t.integer "nature_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_nature_names_name"
  end

  create_table "nature_pokeathlon_stats", primary_key: ["nature_id", "pokeathlon_stat_id"], force: :cascade do |t|
    t.integer "nature_id", null: false
    t.integer "pokeathlon_stat_id", null: false
    t.integer "max_change", null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "decreased_stat_id", null: false
    t.integer "increased_stat_id", null: false
    t.integer "hates_flavor_id", null: false
    t.integer "likes_flavor_id", null: false
    t.integer "game_index", null: false
  end

  create_table "pal_park", primary_key: "species_id", force: :cascade do |t|
    t.integer "area_id", null: false
    t.integer "base_score", null: false
    t.integer "rate", null: false
  end

  create_table "pal_park_area_names", primary_key: ["pal_park_area_id", "local_language_id"], force: :cascade do |t|
    t.integer "pal_park_area_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_pal_park_area_names_name"
  end

  create_table "pal_park_areas", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokeathlon_stat_names", primary_key: ["pokeathlon_stat_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokeathlon_stat_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_pokeathlon_stat_names_name"
  end

  create_table "pokeathlon_stats", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokedex_prose", primary_key: ["pokedex_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokedex_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_pokedex_prose_name"
  end

  create_table "pokedex_version_groups", primary_key: ["pokedex_id", "version_group_id"], force: :cascade do |t|
    t.integer "pokedex_id", null: false
    t.integer "version_group_id", null: false
  end

  create_table "pokedexes", force: :cascade do |t|
    t.integer "region_id"
    t.string "identifier", limit: 79, null: false
    t.boolean "is_main_series", null: false
  end

  create_table "pokemon_abilities", primary_key: ["pokemon_id", "slot"], force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "ability_id", null: false
    t.boolean "is_hidden", null: false
    t.integer "slot", null: false
    t.index ["is_hidden"], name: "ix_pokemon_abilities_is_hidden"
  end

  create_table "pokemon_color_names", primary_key: ["pokemon_color_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_color_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_pokemon_color_names_name"
  end

  create_table "pokemon_colors", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_dex_numbers", primary_key: ["species_id", "pokedex_id"], force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "pokedex_id", null: false
    t.integer "pokedex_number", null: false
  end

  create_table "pokemon_egg_groups", primary_key: ["species_id", "egg_group_id"], force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "egg_group_id", null: false
  end

  create_table "pokemon_evolution", force: :cascade do |t|
    t.integer "evolved_species_id", null: false
    t.integer "evolution_trigger_id", null: false
    t.integer "trigger_item_id"
    t.integer "minimum_level"
    t.integer "gender_id"
    t.integer "location_id"
    t.integer "held_item_id"
    t.string "time_of_day", limit: 5
    t.integer "known_move_id"
    t.integer "known_move_type_id"
    t.integer "minimum_happiness"
    t.integer "minimum_beauty"
    t.integer "minimum_affection"
    t.integer "relative_physical_stats"
    t.integer "party_species_id"
    t.integer "party_type_id"
    t.integer "trade_species_id"
    t.boolean "needs_overworld_rain", null: false
    t.boolean "turn_upside_down", null: false
    t.check_constraint "time_of_day IN ('day', 'night')", name: "pokemon_evolution_time_of_day"
  end

  create_table "pokemon_form_generations", primary_key: ["pokemon_form_id", "generation_id"], force: :cascade do |t|
    t.integer "pokemon_form_id", null: false
    t.integer "generation_id", null: false
    t.integer "game_index", null: false
  end

  create_table "pokemon_form_names", primary_key: ["pokemon_form_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_form_id", null: false
    t.integer "local_language_id", null: false
    t.string "form_name", limit: 79
    t.string "pokemon_name", limit: 79
    t.index ["form_name"], name: "ix_pokemon_form_names_form_name"
    t.index ["pokemon_name"], name: "ix_pokemon_form_names_pokemon_name"
  end

  create_table "pokemon_form_pokeathlon_stats", primary_key: ["pokemon_form_id", "pokeathlon_stat_id"], force: :cascade do |t|
    t.integer "pokemon_form_id", null: false
    t.integer "pokeathlon_stat_id", null: false
    t.integer "minimum_stat", null: false
    t.integer "base_stat", null: false
    t.integer "maximum_stat", null: false
  end

  create_table "pokemon_forms", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.string "form_identifier", limit: 79
    t.integer "pokemon_id", null: false
    t.integer "introduced_in_version_group_id"
    t.boolean "is_default", null: false
    t.boolean "is_battle_only", null: false
    t.boolean "is_mega", null: false
    t.integer "form_order", null: false
    t.integer "order", null: false
  end

  create_table "pokemon_game_indices", primary_key: ["pokemon_id", "version_id"], force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "version_id", null: false
    t.integer "game_index", null: false
  end

  create_table "pokemon_habitat_names", primary_key: ["pokemon_habitat_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_habitat_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_pokemon_habitat_names_name"
  end

  create_table "pokemon_habitats", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_items", primary_key: ["pokemon_id", "version_id", "item_id"], force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "version_id", null: false
    t.integer "item_id", null: false
    t.integer "rarity", null: false
  end

  create_table "pokemon_move_method_prose", primary_key: ["pokemon_move_method_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_move_method_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_pokemon_move_method_prose_name"
  end

  create_table "pokemon_move_methods", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_moves", primary_key: ["pokemon_id", "version_group_id", "move_id", "pokemon_move_method_id", "level"], force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "version_group_id", null: false
    t.integer "move_id", null: false
    t.integer "pokemon_move_method_id", null: false
    t.integer "level", null: false
    t.integer "order"
    t.index ["level"], name: "ix_pokemon_moves_level"
    t.index ["move_id"], name: "ix_pokemon_moves_move_id"
    t.index ["pokemon_id"], name: "ix_pokemon_moves_pokemon_id"
    t.index ["pokemon_move_method_id"], name: "ix_pokemon_moves_pokemon_move_method_id"
    t.index ["version_group_id"], name: "ix_pokemon_moves_version_group_id"
  end

  create_table "pokemon_shape_prose", primary_key: ["pokemon_shape_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_shape_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.string "awesome_name", limit: 79
    t.text "description"
    t.index ["name"], name: "ix_pokemon_shape_prose_name"
  end

  create_table "pokemon_shapes", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "pokemon_species", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "generation_id"
    t.integer "evolves_from_species_id"
    t.integer "evolution_chain_id"
    t.integer "color_id", null: false
    t.integer "shape_id", null: false
    t.integer "habitat_id"
    t.integer "gender_rate", null: false
    t.integer "capture_rate", null: false
    t.integer "base_happiness", null: false
    t.boolean "is_baby", null: false
    t.integer "hatch_counter", null: false
    t.boolean "has_gender_differences", null: false
    t.integer "growth_rate_id", null: false
    t.boolean "forms_switchable", null: false
    t.integer "order", null: false
    t.integer "conquest_order"
    t.index ["conquest_order"], name: "ix_pokemon_species_conquest_order"
    t.index ["order"], name: "ix_pokemon_species_order"
  end

  create_table "pokemon_species_flavor_summaries", primary_key: ["pokemon_species_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_species_id", null: false
    t.integer "local_language_id", null: false
    t.text "flavor_summary"
  end

  create_table "pokemon_species_flavor_text", primary_key: ["species_id", "version_id", "language_id"], force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "version_id", null: false
    t.integer "language_id", null: false
    t.text "flavor_text", null: false
  end

  create_table "pokemon_species_names", primary_key: ["pokemon_species_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_species_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79
    t.text "genus"
    t.index ["name"], name: "ix_pokemon_species_names_name"
  end

  create_table "pokemon_species_prose", primary_key: ["pokemon_species_id", "local_language_id"], force: :cascade do |t|
    t.integer "pokemon_species_id", null: false
    t.integer "local_language_id", null: false
    t.text "form_description"
  end

  create_table "pokemon_stats", primary_key: ["pokemon_id", "stat_id"], force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "stat_id", null: false
    t.integer "base_stat", null: false
    t.integer "effort", null: false
  end

  create_table "pokemon_types", primary_key: ["pokemon_id", "slot"], force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.integer "slot", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "species_id"
    t.integer "height", null: false
    t.integer "weight", null: false
    t.integer "base_experience", null: false
    t.integer "order", null: false
    t.boolean "is_default", null: false
    t.index ["is_default"], name: "ix_pokemon_is_default"
    t.index ["order"], name: "ix_pokemon_order"
  end

  create_table "region_names", primary_key: ["region_id", "local_language_id"], force: :cascade do |t|
    t.integer "region_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_region_names_name"
  end

  create_table "regions", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
  end

  create_table "stat_names", primary_key: ["stat_id", "local_language_id"], force: :cascade do |t|
    t.integer "stat_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_stat_names_name"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "damage_class_id"
    t.string "identifier", limit: 79, null: false
    t.boolean "is_battle_only", null: false
    t.integer "game_index"
  end

  create_table "super_contest_combos", primary_key: ["first_move_id", "second_move_id"], force: :cascade do |t|
    t.integer "first_move_id", null: false
    t.integer "second_move_id", null: false
  end

  create_table "super_contest_effect_prose", primary_key: ["super_contest_effect_id", "local_language_id"], force: :cascade do |t|
    t.integer "super_contest_effect_id", null: false
    t.integer "local_language_id", null: false
    t.text "flavor_text", null: false
  end

  create_table "super_contest_effects", force: :cascade do |t|
    t.integer "appeal", null: false
  end

  create_table "type_efficacy", primary_key: ["damage_type_id", "target_type_id"], force: :cascade do |t|
    t.integer "damage_type_id", null: false
    t.integer "target_type_id", null: false
    t.integer "damage_factor", null: false
  end

  create_table "type_game_indices", primary_key: ["type_id", "generation_id"], force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "generation_id", null: false
    t.integer "game_index", null: false
  end

  create_table "type_names", primary_key: ["type_id", "local_language_id"], force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_type_names_name"
  end

  create_table "types", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "generation_id", null: false
    t.integer "damage_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "version_group_pokemon_move_methods", primary_key: ["version_group_id", "pokemon_move_method_id"], force: :cascade do |t|
    t.integer "version_group_id", null: false
    t.integer "pokemon_move_method_id", null: false
  end

  create_table "version_group_regions", primary_key: ["version_group_id", "region_id"], force: :cascade do |t|
    t.integer "version_group_id", null: false
    t.integer "region_id", null: false
  end

  create_table "version_groups", force: :cascade do |t|
    t.string "identifier", limit: 79, null: false
    t.integer "generation_id", null: false
    t.integer "order"
  end

  create_table "version_names", primary_key: ["version_id", "local_language_id"], force: :cascade do |t|
    t.integer "version_id", null: false
    t.integer "local_language_id", null: false
    t.string "name", limit: 79, null: false
    t.index ["name"], name: "ix_version_names_name"
  end

  create_table "versions", force: :cascade do |t|
    t.integer "version_group_id", null: false
    t.string "identifier", limit: 79, null: false
  end

  add_foreign_key "abilities", "generations"
  add_foreign_key "ability_changelog", "abilities"
  add_foreign_key "ability_changelog", "version_groups", column: "changed_in_version_group_id"
  add_foreign_key "ability_changelog_prose", "ability_changelog"
  add_foreign_key "ability_changelog_prose", "languages", column: "local_language_id"
  add_foreign_key "ability_flavor_text", "abilities"
  add_foreign_key "ability_flavor_text", "languages"
  add_foreign_key "ability_flavor_text", "version_groups"
  add_foreign_key "ability_names", "abilities"
  add_foreign_key "ability_names", "languages", column: "local_language_id"
  add_foreign_key "ability_prose", "abilities"
  add_foreign_key "ability_prose", "languages", column: "local_language_id"
  add_foreign_key "berries", "berry_firmness", column: "firmness_id"
  add_foreign_key "berries", "items"
  add_foreign_key "berries", "types", column: "natural_gift_type_id"
  add_foreign_key "berry_firmness_names", "berry_firmness"
  add_foreign_key "berry_firmness_names", "languages", column: "local_language_id"
  add_foreign_key "berry_flavors", "berries"
  add_foreign_key "berry_flavors", "contest_types"
  add_foreign_key "characteristic_text", "characteristics"
  add_foreign_key "characteristic_text", "languages", column: "local_language_id"
  add_foreign_key "characteristics", "stats"
  add_foreign_key "conquest_episode_names", "conquest_episodes", column: "episode_id"
  add_foreign_key "conquest_episode_names", "languages", column: "local_language_id"
  add_foreign_key "conquest_episode_warriors", "conquest_episodes", column: "episode_id"
  add_foreign_key "conquest_episode_warriors", "conquest_warriors", column: "warrior_id"
  add_foreign_key "conquest_kingdom_names", "conquest_kingdoms", column: "kingdom_id"
  add_foreign_key "conquest_kingdom_names", "languages", column: "local_language_id"
  add_foreign_key "conquest_kingdoms", "types"
  add_foreign_key "conquest_max_links", "conquest_warrior_ranks", column: "warrior_rank_id"
  add_foreign_key "conquest_max_links", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "conquest_move_data", "conquest_move_displacements", column: "displacement_id"
  add_foreign_key "conquest_move_data", "conquest_move_effects", column: "effect_id"
  add_foreign_key "conquest_move_data", "conquest_move_ranges", column: "range_id"
  add_foreign_key "conquest_move_data", "moves"
  add_foreign_key "conquest_move_displacement_prose", "conquest_move_displacements", column: "move_displacement_id"
  add_foreign_key "conquest_move_displacement_prose", "languages", column: "local_language_id"
  add_foreign_key "conquest_move_effect_prose", "conquest_move_effects"
  add_foreign_key "conquest_move_effect_prose", "languages", column: "local_language_id"
  add_foreign_key "conquest_move_range_prose", "conquest_move_ranges"
  add_foreign_key "conquest_move_range_prose", "languages", column: "local_language_id"
  add_foreign_key "conquest_pokemon_abilities", "abilities"
  add_foreign_key "conquest_pokemon_abilities", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "conquest_pokemon_evolution", "conquest_kingdoms", column: "kingdom_id"
  add_foreign_key "conquest_pokemon_evolution", "conquest_stats", column: "required_stat_id"
  add_foreign_key "conquest_pokemon_evolution", "genders", column: "warrior_gender_id"
  add_foreign_key "conquest_pokemon_evolution", "items"
  add_foreign_key "conquest_pokemon_evolution", "pokemon_species", column: "evolved_species_id"
  add_foreign_key "conquest_pokemon_moves", "moves"
  add_foreign_key "conquest_pokemon_moves", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "conquest_pokemon_stats", "conquest_stats"
  add_foreign_key "conquest_pokemon_stats", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "conquest_stat_names", "conquest_stats"
  add_foreign_key "conquest_stat_names", "languages", column: "local_language_id"
  add_foreign_key "conquest_transformation_pokemon", "conquest_warrior_transformation", column: "transformation_id", primary_key: "transformed_warrior_rank_id"
  add_foreign_key "conquest_transformation_pokemon", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "conquest_transformation_warriors", "conquest_warrior_transformation", column: "transformation_id", primary_key: "transformed_warrior_rank_id"
  add_foreign_key "conquest_transformation_warriors", "conquest_warriors", column: "present_warrior_id"
  add_foreign_key "conquest_warrior_names", "conquest_warriors", column: "warrior_id"
  add_foreign_key "conquest_warrior_names", "languages", column: "local_language_id"
  add_foreign_key "conquest_warrior_rank_stat_map", "conquest_warrior_ranks", column: "warrior_rank_id"
  add_foreign_key "conquest_warrior_rank_stat_map", "conquest_warrior_stats", column: "warrior_stat_id"
  add_foreign_key "conquest_warrior_ranks", "conquest_warrior_skills", column: "skill_id"
  add_foreign_key "conquest_warrior_ranks", "conquest_warriors", column: "warrior_id"
  add_foreign_key "conquest_warrior_skill_names", "conquest_warrior_skills", column: "skill_id"
  add_foreign_key "conquest_warrior_skill_names", "languages", column: "local_language_id"
  add_foreign_key "conquest_warrior_specialties", "conquest_warriors", column: "warrior_id"
  add_foreign_key "conquest_warrior_specialties", "types"
  add_foreign_key "conquest_warrior_stat_names", "conquest_warrior_stats", column: "warrior_stat_id"
  add_foreign_key "conquest_warrior_stat_names", "languages", column: "local_language_id"
  add_foreign_key "conquest_warrior_transformation", "conquest_episodes", column: "completed_episode_id"
  add_foreign_key "conquest_warrior_transformation", "conquest_episodes", column: "current_episode_id"
  add_foreign_key "conquest_warrior_transformation", "conquest_warrior_ranks", column: "transformed_warrior_rank_id"
  add_foreign_key "conquest_warrior_transformation", "conquest_warriors", column: "distant_warrior_id"
  add_foreign_key "conquest_warrior_transformation", "types", column: "collection_type_id"
  add_foreign_key "conquest_warriors", "conquest_warrior_archetypes", column: "archetype_id"
  add_foreign_key "conquest_warriors", "genders"
  add_foreign_key "contest_combos", "moves", column: "first_move_id"
  add_foreign_key "contest_combos", "moves", column: "second_move_id"
  add_foreign_key "contest_effect_prose", "contest_effects"
  add_foreign_key "contest_effect_prose", "languages", column: "local_language_id"
  add_foreign_key "contest_type_names", "contest_types"
  add_foreign_key "contest_type_names", "languages", column: "local_language_id"
  add_foreign_key "egg_group_prose", "egg_groups"
  add_foreign_key "egg_group_prose", "languages", column: "local_language_id"
  add_foreign_key "encounter_condition_prose", "encounter_conditions"
  add_foreign_key "encounter_condition_prose", "languages", column: "local_language_id"
  add_foreign_key "encounter_condition_value_map", "encounter_condition_values"
  add_foreign_key "encounter_condition_value_map", "encounters"
  add_foreign_key "encounter_condition_value_prose", "encounter_condition_values"
  add_foreign_key "encounter_condition_value_prose", "languages", column: "local_language_id"
  add_foreign_key "encounter_condition_values", "encounter_conditions"
  add_foreign_key "encounter_method_prose", "encounter_methods"
  add_foreign_key "encounter_method_prose", "languages", column: "local_language_id"
  add_foreign_key "encounter_slots", "encounter_methods"
  add_foreign_key "encounter_slots", "version_groups"
  add_foreign_key "encounters", "encounter_slots"
  add_foreign_key "encounters", "location_areas"
  add_foreign_key "encounters", "pokemons"
  add_foreign_key "encounters", "versions"
  add_foreign_key "evolution_chains", "items", column: "baby_trigger_item_id"
  add_foreign_key "evolution_trigger_prose", "evolution_triggers"
  add_foreign_key "evolution_trigger_prose", "languages", column: "local_language_id"
  add_foreign_key "experience", "growth_rates"
  add_foreign_key "generation_names", "generations"
  add_foreign_key "generation_names", "languages", column: "local_language_id"
  add_foreign_key "generations", "regions", column: "main_region_id"
  add_foreign_key "growth_rate_prose", "growth_rates"
  add_foreign_key "growth_rate_prose", "languages", column: "local_language_id"
  add_foreign_key "item_categories", "item_pockets", column: "pocket_id"
  add_foreign_key "item_category_prose", "item_categories"
  add_foreign_key "item_category_prose", "languages", column: "local_language_id"
  add_foreign_key "item_flag_map", "item_flags"
  add_foreign_key "item_flag_map", "items"
  add_foreign_key "item_flag_prose", "item_flags"
  add_foreign_key "item_flag_prose", "languages", column: "local_language_id"
  add_foreign_key "item_flavor_summaries", "items"
  add_foreign_key "item_flavor_summaries", "languages", column: "local_language_id"
  add_foreign_key "item_flavor_text", "items"
  add_foreign_key "item_flavor_text", "languages"
  add_foreign_key "item_flavor_text", "version_groups"
  add_foreign_key "item_fling_effect_prose", "item_fling_effects"
  add_foreign_key "item_fling_effect_prose", "languages", column: "local_language_id"
  add_foreign_key "item_game_indices", "generations"
  add_foreign_key "item_game_indices", "items"
  add_foreign_key "item_names", "items"
  add_foreign_key "item_names", "languages", column: "local_language_id"
  add_foreign_key "item_pocket_names", "item_pockets"
  add_foreign_key "item_pocket_names", "languages", column: "local_language_id"
  add_foreign_key "item_prose", "items"
  add_foreign_key "item_prose", "languages", column: "local_language_id"
  add_foreign_key "items", "item_categories", column: "category_id"
  add_foreign_key "items", "item_fling_effects", column: "fling_effect_id"
  add_foreign_key "language_names", "languages"
  add_foreign_key "language_names", "languages", column: "local_language_id"
  add_foreign_key "location_area_encounter_rates", "encounter_methods"
  add_foreign_key "location_area_encounter_rates", "location_areas"
  add_foreign_key "location_area_encounter_rates", "versions"
  add_foreign_key "location_area_prose", "languages", column: "local_language_id"
  add_foreign_key "location_area_prose", "location_areas"
  add_foreign_key "location_areas", "locations"
  add_foreign_key "location_game_indices", "generations"
  add_foreign_key "location_game_indices", "locations"
  add_foreign_key "location_names", "languages", column: "local_language_id"
  add_foreign_key "location_names", "locations"
  add_foreign_key "locations", "regions"
  add_foreign_key "machines", "items"
  add_foreign_key "machines", "moves"
  add_foreign_key "machines", "version_groups"
  add_foreign_key "move_battle_style_prose", "languages", column: "local_language_id"
  add_foreign_key "move_battle_style_prose", "move_battle_styles"
  add_foreign_key "move_changelog", "move_effects", column: "effect_id"
  add_foreign_key "move_changelog", "move_targets", column: "target_id"
  add_foreign_key "move_changelog", "moves"
  add_foreign_key "move_changelog", "types"
  add_foreign_key "move_changelog", "version_groups", column: "changed_in_version_group_id"
  add_foreign_key "move_damage_class_prose", "languages", column: "local_language_id"
  add_foreign_key "move_damage_class_prose", "move_damage_classes"
  add_foreign_key "move_effect_changelog", "move_effects", column: "effect_id"
  add_foreign_key "move_effect_changelog", "version_groups", column: "changed_in_version_group_id"
  add_foreign_key "move_effect_changelog_prose", "languages", column: "local_language_id"
  add_foreign_key "move_effect_changelog_prose", "move_effect_changelog"
  add_foreign_key "move_effect_prose", "languages", column: "local_language_id"
  add_foreign_key "move_effect_prose", "move_effects"
  add_foreign_key "move_flag_map", "move_flags"
  add_foreign_key "move_flag_map", "moves"
  add_foreign_key "move_flag_prose", "languages", column: "local_language_id"
  add_foreign_key "move_flag_prose", "move_flags"
  add_foreign_key "move_flavor_summaries", "languages", column: "local_language_id"
  add_foreign_key "move_flavor_summaries", "moves"
  add_foreign_key "move_flavor_text", "languages"
  add_foreign_key "move_flavor_text", "moves"
  add_foreign_key "move_flavor_text", "version_groups"
  add_foreign_key "move_meta", "move_meta_ailments", column: "meta_ailment_id"
  add_foreign_key "move_meta", "move_meta_categories", column: "meta_category_id"
  add_foreign_key "move_meta", "moves"
  add_foreign_key "move_meta_ailment_names", "languages", column: "local_language_id"
  add_foreign_key "move_meta_ailment_names", "move_meta_ailments"
  add_foreign_key "move_meta_category_prose", "languages", column: "local_language_id"
  add_foreign_key "move_meta_category_prose", "move_meta_categories"
  add_foreign_key "move_meta_stat_changes", "moves"
  add_foreign_key "move_meta_stat_changes", "stats"
  add_foreign_key "move_names", "languages", column: "local_language_id"
  add_foreign_key "move_names", "moves"
  add_foreign_key "move_target_prose", "languages", column: "local_language_id"
  add_foreign_key "move_target_prose", "move_targets"
  add_foreign_key "moves", "contest_effects"
  add_foreign_key "moves", "contest_types"
  add_foreign_key "moves", "generations"
  add_foreign_key "moves", "move_damage_classes", column: "damage_class_id"
  add_foreign_key "moves", "move_effects", column: "effect_id"
  add_foreign_key "moves", "move_targets", column: "target_id"
  add_foreign_key "moves", "super_contest_effects"
  add_foreign_key "moves", "types"
  add_foreign_key "nature_battle_style_preferences", "move_battle_styles"
  add_foreign_key "nature_battle_style_preferences", "natures"
  add_foreign_key "nature_names", "languages", column: "local_language_id"
  add_foreign_key "nature_names", "natures"
  add_foreign_key "nature_pokeathlon_stats", "natures"
  add_foreign_key "nature_pokeathlon_stats", "pokeathlon_stats"
  add_foreign_key "natures", "contest_types", column: "hates_flavor_id"
  add_foreign_key "natures", "contest_types", column: "likes_flavor_id"
  add_foreign_key "natures", "stats", column: "decreased_stat_id"
  add_foreign_key "natures", "stats", column: "increased_stat_id"
  add_foreign_key "pal_park", "pal_park_areas", column: "area_id"
  add_foreign_key "pal_park", "pokemon_species", column: "species_id"
  add_foreign_key "pal_park_area_names", "languages", column: "local_language_id"
  add_foreign_key "pal_park_area_names", "pal_park_areas"
  add_foreign_key "pokeathlon_stat_names", "languages", column: "local_language_id"
  add_foreign_key "pokeathlon_stat_names", "pokeathlon_stats"
  add_foreign_key "pokedex_prose", "languages", column: "local_language_id"
  add_foreign_key "pokedex_prose", "pokedexes"
  add_foreign_key "pokedex_version_groups", "pokedexes"
  add_foreign_key "pokedex_version_groups", "version_groups"
  add_foreign_key "pokedexes", "regions"
  add_foreign_key "pokemon_abilities", "abilities"
  add_foreign_key "pokemon_abilities", "pokemons"
  add_foreign_key "pokemon_color_names", "languages", column: "local_language_id"
  add_foreign_key "pokemon_color_names", "pokemon_colors"
  add_foreign_key "pokemon_dex_numbers", "pokedexes"
  add_foreign_key "pokemon_dex_numbers", "pokemon_species", column: "species_id"
  add_foreign_key "pokemon_egg_groups", "egg_groups"
  add_foreign_key "pokemon_egg_groups", "pokemon_species", column: "species_id"
  add_foreign_key "pokemon_evolution", "evolution_triggers"
  add_foreign_key "pokemon_evolution", "genders"
  add_foreign_key "pokemon_evolution", "items", column: "held_item_id"
  add_foreign_key "pokemon_evolution", "items", column: "trigger_item_id"
  add_foreign_key "pokemon_evolution", "locations"
  add_foreign_key "pokemon_evolution", "moves", column: "known_move_id"
  add_foreign_key "pokemon_evolution", "pokemon_species", column: "evolved_species_id"
  add_foreign_key "pokemon_evolution", "pokemon_species", column: "party_species_id"
  add_foreign_key "pokemon_evolution", "pokemon_species", column: "trade_species_id"
  add_foreign_key "pokemon_evolution", "types", column: "known_move_type_id"
  add_foreign_key "pokemon_evolution", "types", column: "party_type_id"
  add_foreign_key "pokemon_form_generations", "generations"
  add_foreign_key "pokemon_form_generations", "pokemon_forms"
  add_foreign_key "pokemon_form_names", "languages", column: "local_language_id"
  add_foreign_key "pokemon_form_names", "pokemon_forms"
  add_foreign_key "pokemon_form_pokeathlon_stats", "pokeathlon_stats"
  add_foreign_key "pokemon_form_pokeathlon_stats", "pokemon_forms"
  add_foreign_key "pokemon_forms", "pokemons"
  add_foreign_key "pokemon_forms", "version_groups", column: "introduced_in_version_group_id"
  add_foreign_key "pokemon_game_indices", "pokemons"
  add_foreign_key "pokemon_game_indices", "versions"
  add_foreign_key "pokemon_habitat_names", "languages", column: "local_language_id"
  add_foreign_key "pokemon_habitat_names", "pokemon_habitats"
  add_foreign_key "pokemon_items", "items"
  add_foreign_key "pokemon_items", "pokemons"
  add_foreign_key "pokemon_items", "versions"
  add_foreign_key "pokemon_move_method_prose", "languages", column: "local_language_id"
  add_foreign_key "pokemon_move_method_prose", "pokemon_move_methods"
  add_foreign_key "pokemon_moves", "moves"
  add_foreign_key "pokemon_moves", "pokemon_move_methods"
  add_foreign_key "pokemon_moves", "pokemons"
  add_foreign_key "pokemon_moves", "version_groups"
  add_foreign_key "pokemon_shape_prose", "languages", column: "local_language_id"
  add_foreign_key "pokemon_shape_prose", "pokemon_shapes"
  add_foreign_key "pokemon_species", "evolution_chains"
  add_foreign_key "pokemon_species", "generations"
  add_foreign_key "pokemon_species", "growth_rates"
  add_foreign_key "pokemon_species", "pokemon_colors", column: "color_id"
  add_foreign_key "pokemon_species", "pokemon_habitats", column: "habitat_id"
  add_foreign_key "pokemon_species", "pokemon_shapes", column: "shape_id"
  add_foreign_key "pokemon_species", "pokemon_species", column: "evolves_from_species_id"
  add_foreign_key "pokemon_species_flavor_summaries", "languages", column: "local_language_id"
  add_foreign_key "pokemon_species_flavor_summaries", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "pokemon_species_flavor_text", "languages"
  add_foreign_key "pokemon_species_flavor_text", "pokemon_species", column: "species_id"
  add_foreign_key "pokemon_species_flavor_text", "versions"
  add_foreign_key "pokemon_species_names", "languages", column: "local_language_id"
  add_foreign_key "pokemon_species_names", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "pokemon_species_prose", "languages", column: "local_language_id"
  add_foreign_key "pokemon_species_prose", "pokemon_species", column: "pokemon_species_id"
  add_foreign_key "pokemon_stats", "pokemons"
  add_foreign_key "pokemon_stats", "stats"
  add_foreign_key "pokemon_types", "pokemons"
  add_foreign_key "pokemon_types", "types"
  add_foreign_key "pokemons", "pokemon_species", column: "species_id"
  add_foreign_key "region_names", "languages", column: "local_language_id"
  add_foreign_key "region_names", "regions"
  add_foreign_key "stat_names", "languages", column: "local_language_id"
  add_foreign_key "stat_names", "stats"
  add_foreign_key "stats", "move_damage_classes", column: "damage_class_id"
  add_foreign_key "super_contest_combos", "moves", column: "first_move_id"
  add_foreign_key "super_contest_combos", "moves", column: "second_move_id"
  add_foreign_key "super_contest_effect_prose", "languages", column: "local_language_id"
  add_foreign_key "super_contest_effect_prose", "super_contest_effects"
  add_foreign_key "type_efficacy", "types", column: "damage_type_id"
  add_foreign_key "type_efficacy", "types", column: "target_type_id"
  add_foreign_key "type_game_indices", "generations"
  add_foreign_key "type_game_indices", "types"
  add_foreign_key "type_names", "languages", column: "local_language_id"
  add_foreign_key "type_names", "types"
  add_foreign_key "types", "generations"
  add_foreign_key "types", "move_damage_classes", column: "damage_class_id"
  add_foreign_key "version_group_pokemon_move_methods", "pokemon_move_methods"
  add_foreign_key "version_group_pokemon_move_methods", "version_groups"
  add_foreign_key "version_group_regions", "regions"
  add_foreign_key "version_group_regions", "version_groups"
  add_foreign_key "version_groups", "generations"
  add_foreign_key "version_names", "languages", column: "local_language_id"
  add_foreign_key "version_names", "versions"
  add_foreign_key "versions", "version_groups"
end
