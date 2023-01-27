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

ActiveRecord::Schema[7.0].define(version: 2023_01_27_163154) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.integer "message_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "alt_id_imports", force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.text "file_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "alt_item_ids", force: :cascade do |t|
    t.integer "item_id"
    t.string "name"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "article_bank_roles", force: :cascade do |t|
    t.integer "article_id"
    t.integer "bank_id"
    t.integer "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "key"
    t.boolean "admin_only", default: false
    t.text "content"
    t.text "file_data"
    t.boolean "is_menu", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bank_class_system_assignments", force: :cascade do |t|
    t.bigint "bank_id"
    t.bigint "class_system_id"
    t.boolean "active"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["bank_id", "class_system_id"], name: "index_bank_class_systems_on_bank_and_class_system", unique: true
  end

  create_table "bank_dg_assignments", force: :cascade do |t|
    t.bigint "bank_id"
    t.bigint "demographic_group_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["bank_id", "demographic_group_id"], name: "index_bank_dg_assignments_on_bank_id_and_demographic_group_id", unique: true
  end

  create_table "bank_keyword_assignments", force: :cascade do |t|
    t.integer "bank_id"
    t.integer "keyword_id"
    t.datetime "archived_at", precision: nil
    t.datetime "approved_at", precision: nil
    t.integer "requested_by"
    t.integer "approved_by"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "rejected_at", precision: nil
    t.integer "rejected_by"
  end

  create_table "bank_media_asset_assignments", force: :cascade do |t|
    t.bigint "bank_id"
    t.bigint "media_asset_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "archived_at", precision: nil
    t.index ["bank_id", "media_asset_id"], name: "index_bmaa_on_bank_id_media_asset_ids", unique: true
    t.index ["media_asset_id", "bank_id"], name: "index_bmaa_on_media_asset_id_bank_id"
  end

  create_table "bank_ref_assignments", force: :cascade do |t|
    t.bigint "bank_id"
    t.bigint "ref_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "archived_at", precision: nil
    t.index ["bank_id", "ref_id"], name: "index_bank_ref_assignments_on_bank_id_and_ref_id", unique: true
    t.index ["ref_id", "bank_id"], name: "index_bank_ref_assignments_on_ref_id_and_bank_id"
  end

  create_table "bank_role_assignments", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "bank_id"
    t.integer "priority"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "can_submit_reference", default: false
    t.boolean "can_submit_media_asset", default: false
    t.boolean "can_submit_keywords", default: false
    t.boolean "can_manage_users", default: false
    t.boolean "can_request_keywords", default: false
    t.index ["bank_id", "role_id"], name: "index_bank_role_assignments_on_bank_id_and_role_id"
    t.index ["role_id", "bank_id"], name: "index_bank_role_assignments_on_role_id_and_bank_id", unique: true
  end

  create_table "banks", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.string "banner_hex"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "font_hex"
    t.text "avatar_data"
    t.string "short_name"
    t.index ["slug"], name: "index_banks_on_slug"
  end

  create_table "blast_bras", force: :cascade do |t|
    t.integer "blast_id"
    t.integer "bank_role_assignment_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blast_users", force: :cascade do |t|
    t.integer "blast_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "blasts", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "reply_to_email"
    t.string "email_subject"
    t.text "email_content"
    t.text "notification_content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "sends_notification"
    t.boolean "sends_email"
    t.datetime "sent_at", precision: nil
    t.datetime "finalized_at", precision: nil
  end

  create_table "blueprints", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "class_system_id"
    t.integer "avg_num_candidates"
    t.decimal "avg_cumulative_discrimination"
    t.decimal "avg_cumulative_difficulty"
    t.decimal "avg_irt_b"
    t.string "active_tab_identifier"
    t.string "class_entity_values", default: [], array: true
    t.string "item_type_class_level_value"
    t.string "bp_class_level_ids", default: [], array: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bp_class_entity_tallies", force: :cascade do |t|
    t.integer "class_entity_id"
    t.integer "blueprint_id"
    t.integer "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "item_type_counts"
  end

  create_table "class_entities", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "items_count", default: 0
    t.integer "priority"
    t.integer "parent_entity_id"
    t.bigint "class_level_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "code"
    t.decimal "exam_percentage", precision: 3, scale: 2
    t.jsonb "log_data"
    t.boolean "is_lowest", default: false
    t.integer "class_system_id"
    t.integer "blueprint", default: 0
    t.decimal "blueprint_pct", default: "0.0"
    t.index ["class_level_id"], name: "index_class_entities_on_class_level_id"
  end

  create_table "class_levels", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "items_count", default: 0
    t.integer "priority"
    t.bigint "class_system_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["class_system_id"], name: "index_class_levels_on_class_system_id"
  end

  create_table "class_systems", force: :cascade do |t|
    t.string "name"
    t.datetime "published_at", precision: nil
    t.integer "items_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "finalized"
    t.string "code_prefix"
    t.text "file_data"
    t.integer "priority"
  end

  create_table "condition_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "condition_group_id"
    t.index ["condition_group_id"], name: "index_conditions_on_condition_group_id"
  end

  create_table "cumulative_windows", force: :cascade do |t|
    t.integer "exam_window_id"
    t.integer "included_window_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "demographic_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "demographic_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["demographic_id", "user_id"], name: "index_demographic_assignments_on_demographic_id_and_user_id", unique: true
    t.index ["user_id", "demographic_id"], name: "index_demographic_assignments_on_user_id_and_demographic_id"
  end

  create_table "demographic_groups", force: :cascade do |t|
    t.string "label"
    t.boolean "is_multi", default: false
    t.boolean "allows_other", default: false
    t.integer "priority"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.datetime "disabled_at", precision: nil
    t.boolean "can_be_blank", default: true
  end

  create_table "demographics", force: :cascade do |t|
    t.string "label"
    t.bigint "demographic_group_id"
    t.boolean "is_default", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "disabled_at", precision: nil
    t.integer "priority"
    t.index ["demographic_group_id"], name: "index_demographics_on_demographic_group_id"
  end

  create_table "domain_scores", force: :cascade do |t|
    t.integer "exam_instance_id"
    t.string "classification"
    t.integer "priority"
    t.decimal "score"
    t.decimal "pct"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.decimal "ranking"
  end

  create_table "email_histories", force: :cascade do |t|
    t.string "to_email"
    t.string "bbc"
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "sent_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "event_settings", force: :cascade do |t|
    t.string "name"
    t.string "recipient_strategy"
    t.string "recipient_description"
    t.text "email_content"
    t.text "notification_content"
    t.string "email_subject"
    t.string "bcc"
    t.boolean "sends_notification", default: false
    t.boolean "sends_email", default: false
    t.integer "events_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_setting_id"
    t.text "email_content"
    t.text "notification_content"
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.string "secondary_eventable_type"
    t.bigint "secondary_eventable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["eventable_type", "eventable_id"], name: "index_events_on_eventable_type_and_eventable_id"
  end

  create_table "exam_forms", force: :cascade do |t|
    t.integer "exam_window_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "exam_instances", force: :cascade do |t|
    t.integer "exam_form_id"
    t.string "exam_identifier"
    t.string "user_identifier"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.decimal "final_score"
    t.decimal "scaled_score"
    t.boolean "retake"
    t.string "program_code"
    t.string "program_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.decimal "total_points"
    t.integer "num_scored"
    t.string "title_name"
    t.date "test_date"
    t.jsonb "meta_data"
  end

  create_table "exam_windows", force: :cascade do |t|
    t.integer "bank_id"
    t.integer "user_id"
    t.string "name"
    t.text "key_file_data"
    t.string "key_file_format"
    t.text "response_file_data"
    t.string "response_file_format"
    t.text "score_matrix_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "n_score_matrix_data"
    t.text "item_definitions_data"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at", precision: nil
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "ghost_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "exam_window_id"
    t.string "ghost_identifier"
    t.text "stem"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "option_d"
    t.string "option_e"
    t.string "option_f"
    t.string "option_g"
    t.string "option_h"
    t.integer "option_count"
    t.string "classification"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "is_scored", default: true
    t.integer "exam_form_id"
  end

  create_table "ghost_scores", force: :cascade do |t|
    t.integer "exam_instance_id"
    t.integer "ghost_item_id"
    t.decimal "score"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "n_score"
  end

  create_table "item_class_assignments", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "class_entity_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "is_project_assigned", default: false
    t.index ["class_entity_id", "item_id"], name: "index_item_class_assignments_on_class_entity_id_and_item_id"
    t.index ["item_id", "class_entity_id"], name: "index_item_class_assignments_on_item_id_and_class_entity_id", unique: true
  end

  create_table "item_ref_assignments", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "ref_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "pages"
    t.index ["item_id", "ref_id"], name: "index_item_ref_assignments_on_item_id_and_ref_id", unique: true
    t.index ["ref_id", "item_id"], name: "index_item_ref_assignments_on_ref_id_and_item_id"
  end

  create_table "item_statistics", force: :cascade do |t|
    t.integer "statistic_id"
    t.integer "item_id"
    t.text "stem"
    t.string "form_name"
    t.string "form_id"
    t.date "starts_on"
    t.date "ends_on"
    t.decimal "irt_b"
    t.decimal "cumulative_difficulty"
    t.decimal "cumulative_discrimination"
    t.integer "number_of_candidates"
    t.decimal "difficulty"
    t.decimal "discrimination"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "cumulative_n"
  end

  create_table "item_type_constraints", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "item_type_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "min_mc", default: 5
    t.integer "min_ms", default: 5
    t.integer "min_dd", default: 4
    t.boolean "mc_flex", default: false
    t.boolean "ms_flex", default: false
    t.boolean "dd_flex", default: false
    t.integer "min_ddi", default: 4
    t.boolean "ddi_flex", default: false
    t.index ["item_id", "item_type_id"], name: "index_item_type_constraints_on_item_id_and_item_type_id", unique: true
    t.index ["item_type_id", "item_id"], name: "index_item_type_constraints_on_item_type_id_and_item_id"
  end

  create_table "item_types", force: :cascade do |t|
    t.string "name"
    t.string "klass"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "item_user_work_queue_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.bigint "work_queue_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "completed_at", precision: nil
    t.integer "completed_count", default: 0
    t.index ["work_queue_id", "item_id", "user_id"], name: "index_item_user_work_queues_on_work_queue_item_user", unique: true
    t.index ["work_queue_id", "user_id", "item_id"], name: "index_item_user_work_queues_on_work_queue_user_item", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.integer "bank_id"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "media_asset_id"
    t.string "type"
    t.integer "step_id"
    t.integer "active_status_id"
    t.integer "min_options", default: 4
    t.boolean "is_flexible", default: false
    t.text "stem"
    t.datetime "submitted_at", precision: nil
    t.jsonb "log_data"
    t.jsonb "association_history"
    t.integer "discarded_from_id"
    t.integer "cloned_from_id"
    t.integer "level_of_decision"
    t.text "stem_rationale"
    t.text "distractor_rationale"
    t.text "correct_rationale"
    t.integer "taxonomy_id"
    t.text "keyed_image_data"
    t.string "name"
    t.integer "scenario_id"
    t.integer "priority"
    t.datetime "locked_at", precision: nil
    t.integer "locked_by_id"
    t.integer "class_entity_id"
    t.integer "uid"
    t.integer "holder_id"
    t.datetime "held_at", precision: nil
    t.text "searchable_stem"
    t.integer "x_image", default: 200
    t.integer "y_image", default: 350
    t.index ["scenario_id"], name: "index_items_on_scenario_id"
  end

  create_table "keys", force: :cascade do |t|
    t.integer "exam_window_id"
    t.integer "item_id"
    t.integer "option_count"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "ghost_item_id"
  end

  create_table "keyword_assignments", force: :cascade do |t|
    t.bigint "keyword_id"
    t.string "kw_assignable_type"
    t.bigint "kw_assignable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["keyword_id", "kw_assignable_id", "kw_assignable_type"], name: "kw_kwt_kwid", unique: true
    t.index ["keyword_id", "kw_assignable_type", "kw_assignable_id"], name: "kw_kwid_kwt", unique: true
    t.index ["kw_assignable_id", "kw_assignable_type", "keyword_id"], name: "kwid_kwt_kw", unique: true
    t.index ["kw_assignable_type", "kw_assignable_id", "keyword_id"], name: "kwt_kwid_kw", unique: true
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "items_count", default: 0
    t.integer "refs_count", default: 0
    t.integer "media_assets_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "archived_at", precision: nil
    t.jsonb "log_data"
    t.datetime "approved_at", precision: nil
    t.integer "created_by"
    t.datetime "rejected_at", precision: nil
  end

  create_table "letter_template_assignments", force: :cascade do |t|
    t.integer "bank_id"
    t.integer "letter_template_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "letter_templates", force: :cascade do |t|
    t.string "name"
    t.string "klass"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "media_assets", force: :cascade do |t|
    t.integer "ref_id"
    t.integer "edition_page"
    t.string "name"
    t.text "description"
    t.datetime "archived_at", precision: nil
    t.integer "items_count", default: 0
    t.text "file_data"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "action"
    t.datetime "finalized_at", precision: nil
    t.index ["item_id", "user_id"], name: "index_messages_on_item_id_and_user_id"
    t.index ["user_id", "item_id"], name: "index_messages_on_user_id_and_item_id"
  end

  create_table "modification_rule_assignments", force: :cascade do |t|
    t.bigint "item_type_id"
    t.bigint "modification_rule_id"
    t.bigint "bank_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["modification_rule_id", "bank_id", "item_type_id"], name: "index_mod_rule_assns_on_style_rule_and_bank_and_item_type", unique: true
    t.index ["modification_rule_id", "item_type_id", "bank_id"], name: "index_mod_rule_assns_on_style_rule_and_item_type_and_bank", unique: true
  end

  create_table "modification_rules", force: :cascade do |t|
    t.text "rule"
    t.string "target"
    t.string "replacement"
    t.boolean "global"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "seen_at", precision: nil
    t.datetime "dismissed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string "encrypted_password", null: false
    t.string "password_archivable_type", null: false
    t.integer "password_archivable_id", null: false
    t.datetime "created_at", precision: nil
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable"
  end

  create_table "open_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "open_edits", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "option_statistics", force: :cascade do |t|
    t.integer "item_statistic_id"
    t.integer "option_id"
    t.integer "priority"
    t.text "label"
    t.integer "number_choosing"
    t.decimal "pct_choosing"
    t.decimal "effectiveness"
    t.decimal "avg_score"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "options", force: :cascade do |t|
    t.bigint "item_id"
    t.text "label"
    t.integer "priority"
    t.boolean "is_correct"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "log_data"
    t.integer "media_asset_id"
    t.boolean "archived", default: false
    t.integer "x_origin"
    t.integer "y_origin"
    t.integer "x_target"
    t.integer "y_target"
    t.index ["item_id"], name: "index_options_on_item_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "permissable_type"
    t.bigint "permissable_id"
    t.integer "votes_to_approve", default: 0, null: false
    t.integer "votes_to_reject", default: 0, null: false
    t.integer "votes_to_revise", default: 0, null: false
    t.boolean "can_edit_item", default: false, null: false
    t.boolean "can_edit_and_vote", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "can_edit_keywords", default: false
    t.boolean "can_edit_references", default: false
    t.boolean "can_edit_classification", default: false
    t.boolean "can_edit_taxonomy"
    t.boolean "can_see_statistics", default: false
    t.index ["permissable_type", "permissable_id"], name: "index_permissions_on_permissable_type_and_permissable_id"
  end

  create_table "post_steps", force: :cascade do |t|
    t.string "name"
    t.integer "items_count"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "workflow_id"
    t.integer "user_id"
    t.string "name"
    t.integer "items_count"
    t.integer "completed_items_count"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "bank_id"
    t.integer "class_system_id"
    t.datetime "published_at", precision: nil
    t.integer "class_level_id"
    t.integer "min_mc", default: 5
    t.integer "min_ms", default: 5
    t.integer "min_dd_tools", default: 4
    t.boolean "mc_flex", default: false
    t.boolean "ms_flex", default: false
    t.boolean "dd_flex", default: false
    t.boolean "require_classification", default: true
    t.integer "required_keywords", default: 1
    t.integer "required_references", default: 1
    t.boolean "require_taxonomy"
    t.boolean "disable_review_groups", default: false
    t.boolean "require_approve_msg", default: false
    t.boolean "require_revise_msg", default: false
    t.boolean "require_reject_msg", default: false
    t.integer "reporting_class_level_id"
    t.boolean "require_ref_page", default: false
    t.integer "open_items", default: 0
    t.boolean "can_build_scenarios", default: false
    t.integer "min_ms_correct", default: 2
    t.integer "min_ddi", default: 4
    t.boolean "ddi_flex", default: false
  end

  create_table "ref_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "refs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "archived_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "author"
    t.string "edition_num"
    t.string "isbn"
    t.integer "year"
    t.string "publisher"
    t.string "publisher_city"
    t.integer "item_ref_assignments_count", default: 0
    t.jsonb "log_data"
    t.text "file_data"
    t.integer "ref_type_id"
    t.string "volume"
  end

  create_table "response_imports", force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.text "key_file_data"
    t.text "answerstring_file_data"
    t.text "alt_id_file_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "exam_window_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "exam_window_id"
    t.integer "exam_form_id"
    t.integer "item_id"
    t.integer "exam_instance_id"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "ghost_item_id"
  end

  create_table "review_groups", force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.datetime "disabled_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "rg_members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_group_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "rg_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "review_group_id"
    t.datetime "closed_at", precision: nil
  end

  create_table "rg_reviewers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_group_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "bank_id"
    t.datetime "enabled_at", precision: nil
    t.datetime "disabled_at", precision: nil
    t.index ["user_id", "role_id", "bank_id"], name: "index_role_assignments_on_user_id_and_role_id_and_bank_id", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.integer "priority"
  end

  create_table "saved_searches", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "bank_id"
    t.string "key"
    t.jsonb "q"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bank_id"
    t.string "category"
    t.string "description"
    t.string "input_type"
    t.string "key"
    t.string "value"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "site_logs", force: :cascade do |t|
    t.integer "bank_id"
    t.integer "user_id"
    t.string "event_key"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "standard_instruction_templates", force: :cascade do |t|
    t.bigint "item_type_id"
    t.text "text"
    t.boolean "required"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "priority"
    t.boolean "archived", default: false
    t.index ["item_type_id"], name: "index_standard_instruction_templates_on_item_type_id"
  end

  create_table "standard_instructions", force: :cascade do |t|
    t.bigint "standard_instruction_template_id"
    t.bigint "item_id"
    t.boolean "active", default: false
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "log_data"
    t.index ["item_id"], name: "index_standard_instructions_on_item_id"
    t.index ["standard_instruction_template_id"], name: "index_standard_instructions_on_standard_instruction_template_id"
  end

  create_table "statistic_colors", force: :cascade do |t|
    t.string "field_key"
    t.decimal "min_val"
    t.decimal "max_val"
    t.string "hex"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "statistic_templates", force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.string "stem"
    t.string "item_id"
    t.string "irt_b"
    t.string "cumulative_difficulty"
    t.string "cumulative_discrimination"
    t.string "number_of_candidates"
    t.string "form_id"
    t.string "form_name"
    t.string "difficulty"
    t.string "discrimination"
    t.string "starts_on"
    t.string "ends_on"
    t.string "option_x_label"
    t.string "option_x_number_choosing"
    t.string "option_x_pct_choosing"
    t.string "option_x_effectiveness"
    t.string "option_x_avg_score"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "cumulative_n"
  end

  create_table "statistics", force: :cascade do |t|
    t.string "name"
    t.integer "import_status"
    t.text "import_results"
    t.text "import_file_data"
    t.integer "statistic_template_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "bank_id"
  end

  create_table "status_restrictions", force: :cascade do |t|
    t.integer "x_template_id"
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "statusable_id"
    t.string "statusable_type"
    t.integer "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name_cache"
    t.integer "user_id"
  end

  create_table "step_events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "klass"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "priority"
    t.integer "workflow_id"
    t.string "triggerable_type"
    t.bigint "triggerable_id"
    t.index ["triggerable_type", "triggerable_id"], name: "index_steps_on_triggerable_type_and_triggerable_id"
  end

  create_table "style_rule_assignments", force: :cascade do |t|
    t.bigint "item_type_id"
    t.bigint "style_rule_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "bank_id"
    t.index ["style_rule_id", "bank_id", "item_type_id"], name: "index_style_rule_assns_on_style_rule_and_bank_and_item_type", unique: true
    t.index ["style_rule_id", "item_type_id", "bank_id"], name: "index_style_rule_assns_on_style_rule_and_item_type_and_bank", unique: true
  end

  create_table "style_rules", force: :cascade do |t|
    t.text "rule"
    t.boolean "user_confirmed"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "global", default: false
  end

  create_table "tag_assignments", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id", "tag_id"], name: "index_tag_assignments_on_item_id_and_tag_id", unique: true
  end

  create_table "tag_types", force: :cascade do |t|
    t.string "klass"
    t.string "name"
    t.string "hex"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "font_hex"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bank_id"
    t.integer "tag_type_id"
    t.integer "items_count", default: 0
    t.string "name"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "locked_at", precision: nil
    t.datetime "archived_at", precision: nil
    t.jsonb "log_data"
    t.index ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id"
  end

  create_table "targets", force: :cascade do |t|
    t.integer "item_id"
    t.integer "option_id"
    t.string "label"
    t.integer "priority"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "log_data"
    t.boolean "archived", default: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "priority"
  end

  create_table "update_times", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id"], name: "index_update_times_on_item_id"
  end

  create_table "user_work_queue_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "work_queue_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id", "work_queue_id"], name: "index_user_work_queue_assignments_on_user_id_and_work_queue_id", unique: true
  end

  create_table "user_work_queue_completions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_user_work_queue_assignment_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_user_work_queue_assignment_id", "user_id"], name: "item_user_completions", unique: true
    t.index ["user_id", "item_user_work_queue_assignment_id"], name: "user_item_completions", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: nil
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.text "notes"
    t.datetime "password_changed_at", precision: nil
    t.datetime "last_activity_at", precision: nil
    t.datetime "expired_at", precision: nil
    t.string "paranoid_verification_code"
    t.integer "paranoid_verification_attempt", default: 0
    t.datetime "paranoid_verified_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "can_email_two_fa", default: false
    t.datetime "disabled_at", precision: nil
    t.integer "active_bank_id"
    t.text "avatar_data"
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login", default: true
    t.string "otp_backup_codes", array: true
    t.integer "temporary_email_otp_count", default: 0
    t.integer "last_bank_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["expired_at"], name: "index_users_on_expired_at"
    t.index ["last_activity_at"], name: "index_users_on_last_activity_at"
    t.index ["paranoid_verification_code"], name: "index_users_on_paranoid_verification_code"
    t.index ["paranoid_verified_at"], name: "index_users_on_paranoid_verified_at"
    t.index ["password_changed_at"], name: "index_users_on_password_changed_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.inet "sign_in_ip"
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "signed_out_at", precision: nil
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "role_assignment_id"
    t.integer "status_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "approve"
    t.boolean "reject"
    t.boolean "revise"
    t.text "msg"
    t.datetime "invalidated_at", precision: nil
  end

  create_table "voting_restrictions", force: :cascade do |t|
    t.integer "review_group_id"
    t.integer "role_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "work_queue_action_assignments", force: :cascade do |t|
    t.bigint "work_queue_id"
    t.bigint "work_queue_action_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["work_queue_id", "work_queue_action_id"], name: "index_work_queue_action_assignments_on_wq_and_wqa", unique: true
  end

  create_table "work_queue_actions", force: :cascade do |t|
    t.string "name"
    t.string "action"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "work_queues", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_id"
    t.datetime "active_at", precision: nil
    t.integer "items_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "bank_id"
    t.text "instructions"
    t.integer "users_to_complete", default: 1
    t.datetime "completed_at", precision: nil
    t.index ["tag_id"], name: "index_work_queues_on_tag_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "disabled_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "published_at", precision: nil
    t.datetime "archived_at", precision: nil
  end

  create_table "x_files", force: :cascade do |t|
    t.integer "x_template_id"
    t.integer "x_port_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.text "file_data"
  end

  create_table "x_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "x_port_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["item_id", "x_port_id"], name: "index_x_items_on_item_id_and_x_port_id"
    t.index ["x_port_id", "item_id"], name: "index_x_items_on_x_port_id_and_item_id", unique: true
  end

  create_table "x_ports", force: :cascade do |t|
    t.string "name"
    t.integer "tag_id"
    t.integer "x_template_id"
    t.integer "x_port_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "x_items_count", default: 0
    t.boolean "print_comments"
    t.boolean "print_statuses"
    t.boolean "print_stats"
    t.integer "class_system_id"
    t.boolean "print_cumulative_stats"
    t.integer "bank_id"
    t.boolean "print_descriptors", default: false
  end

  create_table "x_sheet_groups", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.boolean "is_visible"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "x_sheets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "preview"
    t.string "klass"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "x_sheet_group_id"
  end

  create_table "x_structures", force: :cascade do |t|
    t.integer "x_template_id"
    t.integer "x_sheet_id"
    t.integer "priority"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["x_sheet_id", "x_template_id"], name: "index_x_structures_on_x_sheet_id_and_x_template_id"
    t.index ["x_template_id", "x_sheet_id"], name: "index_x_structures_on_x_template_id_and_x_sheet_id", unique: true
  end

  create_table "x_templates", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "usage"
    t.integer "x_files_count"
    t.datetime "published_at", precision: nil
    t.datetime "archived_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "include_media", default: false
    t.boolean "include_refs", default: false
  end

  add_foreign_key "bank_class_system_assignments", "banks"
  add_foreign_key "bank_class_system_assignments", "class_systems"
  add_foreign_key "bank_dg_assignments", "banks"
  add_foreign_key "bank_dg_assignments", "demographic_groups"
  add_foreign_key "bank_media_asset_assignments", "banks"
  add_foreign_key "bank_media_asset_assignments", "media_assets"
  add_foreign_key "bank_ref_assignments", "banks"
  add_foreign_key "bank_ref_assignments", "refs"
  add_foreign_key "bank_role_assignments", "banks"
  add_foreign_key "bank_role_assignments", "roles"
  add_foreign_key "class_entities", "class_levels"
  add_foreign_key "class_levels", "class_systems"
  add_foreign_key "demographic_assignments", "demographics"
  add_foreign_key "demographic_assignments", "users"
  add_foreign_key "demographics", "demographic_groups"
  add_foreign_key "item_class_assignments", "class_entities"
  add_foreign_key "item_class_assignments", "items"
  add_foreign_key "item_ref_assignments", "items"
  add_foreign_key "item_ref_assignments", "refs"
  add_foreign_key "item_type_constraints", "item_types"
  add_foreign_key "item_type_constraints", "items"
  add_foreign_key "keyword_assignments", "keywords"
  add_foreign_key "messages", "items"
  add_foreign_key "messages", "users"
  add_foreign_key "modification_rule_assignments", "banks"
  add_foreign_key "modification_rule_assignments", "item_types"
  add_foreign_key "modification_rule_assignments", "modification_rules"
  add_foreign_key "options", "items"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "standard_instruction_templates", "item_types"
  add_foreign_key "standard_instructions", "items"
  add_foreign_key "standard_instructions", "standard_instruction_templates"
  add_foreign_key "style_rule_assignments", "banks"
  add_foreign_key "style_rule_assignments", "item_types"
  add_foreign_key "style_rule_assignments", "style_rules"
  add_foreign_key "update_times", "items"
  add_foreign_key "user_work_queue_completions", "item_user_work_queue_assignments"
  add_foreign_key "user_work_queue_completions", "users"
  add_foreign_key "visits", "users"
end
