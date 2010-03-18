# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100307212727) do

  create_table "kafc_banner", :primary_key => "bid", :force => true do |t|
    t.integer  "cid",                             :default => 0,        :null => false
    t.string   "type",             :limit => 30,  :default => "banner", :null => false
    t.string   "name",                            :default => "",       :null => false
    t.string   "alias",                           :default => "",       :null => false
    t.integer  "imptotal",                        :default => 0,        :null => false
    t.integer  "impmade",                         :default => 0,        :null => false
    t.integer  "clicks",                          :default => 0,        :null => false
    t.string   "imageurl",         :limit => 100, :default => "",       :null => false
    t.string   "clickurl",         :limit => 200, :default => "",       :null => false
    t.datetime "date"
    t.boolean  "showBanner",                      :default => false,    :null => false
    t.boolean  "checked_out",                     :default => false,    :null => false
    t.datetime "checked_out_time",                                      :null => false
    t.string   "editor",           :limit => 50
    t.text     "custombannercode"
    t.integer  "catid",                           :default => 0,        :null => false
    t.text     "description",                                           :null => false
    t.boolean  "sticky",                          :default => false,    :null => false
    t.integer  "ordering",                        :default => 0,        :null => false
    t.datetime "publish_up",                                            :null => false
    t.datetime "publish_down",                                          :null => false
    t.text     "tags",                                                  :null => false
    t.text     "params",                                                :null => false
  end

  add_index "kafc_banner", ["showBanner"], :name => "viewbanner"
  add_index "kafc_banner", ["catid"], :name => "idx_banner_catid"

  create_table "kafc_bannerclient", :primary_key => "cid", :force => true do |t|
    t.string  "name",                           :default => "",    :null => false
    t.string  "contact",                        :default => "",    :null => false
    t.string  "email",                          :default => "",    :null => false
    t.text    "extrainfo",                                         :null => false
    t.boolean "checked_out",                    :default => false, :null => false
    t.time    "checked_out_time"
    t.string  "editor",           :limit => 50
  end

  create_table "kafc_bannertrack", :id => false, :force => true do |t|
    t.date    "track_date", :null => false
    t.integer "track_type", :null => false
    t.integer "banner_id",  :null => false
  end

  create_table "kafc_categories", :force => true do |t|
    t.integer  "parent_id",                      :default => 0,     :null => false
    t.string   "title",                          :default => "",    :null => false
    t.string   "name",                           :default => "",    :null => false
    t.string   "alias",                          :default => "",    :null => false
    t.string   "image",                          :default => "",    :null => false
    t.string   "section",          :limit => 50, :default => "",    :null => false
    t.string   "image_position",   :limit => 30, :default => "",    :null => false
    t.text     "description",                                       :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.string   "editor",           :limit => 50
    t.integer  "ordering",                       :default => 0,     :null => false
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "count",                          :default => 0,     :null => false
    t.text     "params",                                            :null => false
  end

  add_index "kafc_categories", ["section", "published", "access"], :name => "cat_idx"
  add_index "kafc_categories", ["access"], :name => "idx_access"
  add_index "kafc_categories", ["checked_out"], :name => "idx_checkout"

  create_table "kafc_components", :force => true do |t|
    t.string  "name",            :limit => 50, :default => "", :null => false
    t.string  "link",                          :default => "", :null => false
    t.integer "menuid",                        :default => 0,  :null => false
    t.integer "parent",                        :default => 0,  :null => false
    t.string  "admin_menu_link",               :default => "", :null => false
    t.string  "admin_menu_alt",                :default => "", :null => false
    t.string  "option",          :limit => 50, :default => "", :null => false
    t.integer "ordering",                      :default => 0,  :null => false
    t.string  "admin_menu_img",                :default => "", :null => false
    t.integer "iscore",          :limit => 1,  :default => 0,  :null => false
    t.text    "params",                                        :null => false
    t.integer "enabled",         :limit => 1,  :default => 1,  :null => false
  end

  add_index "kafc_components", ["parent", "option"], :name => "parent_option"

  create_table "kafc_contact_details", :force => true do |t|
    t.string   "name",                                 :default => "",    :null => false
    t.string   "alias",                                :default => "",    :null => false
    t.string   "con_position"
    t.text     "address"
    t.string   "suburb",           :limit => 100
    t.string   "state",            :limit => 100
    t.string   "country",          :limit => 100
    t.string   "postcode",         :limit => 100
    t.string   "telephone"
    t.string   "fax"
    t.text     "misc",             :limit => 16777215
    t.string   "image"
    t.string   "imagepos",         :limit => 20
    t.string   "email_to"
    t.boolean  "default_con",                          :default => false, :null => false
    t.boolean  "published",                            :default => false, :null => false
    t.integer  "checked_out",                          :default => 0,     :null => false
    t.datetime "checked_out_time",                                        :null => false
    t.integer  "ordering",                             :default => 0,     :null => false
    t.text     "params",                                                  :null => false
    t.integer  "user_id",                              :default => 0,     :null => false
    t.integer  "catid",                                :default => 0,     :null => false
    t.integer  "access",           :limit => 1,        :default => 0,     :null => false
    t.string   "mobile",                               :default => "",    :null => false
    t.string   "webpage",                              :default => "",    :null => false
  end

  add_index "kafc_contact_details", ["catid"], :name => "catid"

  create_table "kafc_content", :force => true do |t|
    t.string   "title",                                :default => "", :null => false
    t.string   "alias",                                :default => "", :null => false
    t.string   "title_alias",                          :default => "", :null => false
    t.text     "introtext",        :limit => 16777215,                 :null => false
    t.text     "fulltext",         :limit => 16777215,                 :null => false
    t.integer  "state",            :limit => 1,        :default => 0,  :null => false
    t.integer  "sectionid",                            :default => 0,  :null => false
    t.integer  "mask",                                 :default => 0,  :null => false
    t.integer  "catid",                                :default => 0,  :null => false
    t.datetime "created",                                              :null => false
    t.integer  "created_by",                           :default => 0,  :null => false
    t.string   "created_by_alias",                     :default => "", :null => false
    t.datetime "modified",                                             :null => false
    t.integer  "modified_by",                          :default => 0,  :null => false
    t.integer  "checked_out",                          :default => 0,  :null => false
    t.datetime "checked_out_time",                                     :null => false
    t.datetime "publish_up",                                           :null => false
    t.datetime "publish_down",                                         :null => false
    t.text     "images",                                               :null => false
    t.text     "urls",                                                 :null => false
    t.text     "attribs",                                              :null => false
    t.integer  "version",                              :default => 1,  :null => false
    t.integer  "parentid",                             :default => 0,  :null => false
    t.integer  "ordering",                             :default => 0,  :null => false
    t.text     "metakey",                                              :null => false
    t.text     "metadesc",                                             :null => false
    t.integer  "access",                               :default => 0,  :null => false
    t.integer  "hits",                                 :default => 0,  :null => false
    t.text     "metadata",                                             :null => false
  end

  add_index "kafc_content", ["sectionid"], :name => "idx_section"
  add_index "kafc_content", ["access"], :name => "idx_access"
  add_index "kafc_content", ["checked_out"], :name => "idx_checkout"
  add_index "kafc_content", ["state"], :name => "idx_state"
  add_index "kafc_content", ["catid"], :name => "idx_catid"
  add_index "kafc_content", ["created_by"], :name => "idx_createdby"

  create_table "kafc_content_frontpage", :primary_key => "content_id", :force => true do |t|
    t.integer "ordering", :default => 0, :null => false
  end

  create_table "kafc_content_rating", :primary_key => "content_id", :force => true do |t|
    t.integer "rating_sum",                 :default => 0,  :null => false
    t.integer "rating_count",               :default => 0,  :null => false
    t.string  "lastip",       :limit => 50, :default => "", :null => false
  end

  create_table "kafc_core_acl_aro", :force => true do |t|
    t.string  "section_value", :limit => 240, :default => "0", :null => false
    t.string  "value",         :limit => 240, :default => "",  :null => false
    t.integer "order_value",                  :default => 0,   :null => false
    t.string  "name",                         :default => "",  :null => false
    t.integer "hidden",                       :default => 0,   :null => false
  end

  add_index "kafc_core_acl_aro", ["section_value", "value"], :name => "kafc_section_value_value_aro", :unique => true
  add_index "kafc_core_acl_aro", ["hidden"], :name => "kafc_gacl_hidden_aro"

  create_table "kafc_core_acl_aro_groups", :force => true do |t|
    t.integer "parent_id", :default => 0,  :null => false
    t.string  "name",      :default => "", :null => false
    t.integer "lft",       :default => 0,  :null => false
    t.integer "rgt",       :default => 0,  :null => false
    t.string  "value",     :default => "", :null => false
  end

  add_index "kafc_core_acl_aro_groups", ["parent_id"], :name => "kafc_gacl_parent_id_aro_groups"
  add_index "kafc_core_acl_aro_groups", ["lft", "rgt"], :name => "kafc_gacl_lft_rgt_aro_groups"

  create_table "kafc_core_acl_aro_map", :id => false, :force => true do |t|
    t.integer "acl_id",                       :default => 0,   :null => false
    t.string  "section_value", :limit => 230, :default => "0", :null => false
    t.string  "value",         :limit => 100,                  :null => false
  end

  create_table "kafc_core_acl_aro_sections", :force => true do |t|
    t.string  "value",       :limit => 230, :default => "", :null => false
    t.integer "order_value",                :default => 0,  :null => false
    t.string  "name",        :limit => 230, :default => "", :null => false
    t.integer "hidden",                     :default => 0,  :null => false
  end

  add_index "kafc_core_acl_aro_sections", ["value"], :name => "kafc_gacl_value_aro_sections", :unique => true
  add_index "kafc_core_acl_aro_sections", ["hidden"], :name => "kafc_gacl_hidden_aro_sections"

  create_table "kafc_core_acl_groups_aro_map", :id => false, :force => true do |t|
    t.integer "group_id",                     :default => 0,  :null => false
    t.string  "section_value", :limit => 240, :default => "", :null => false
    t.integer "aro_id",                       :default => 0,  :null => false
  end

  add_index "kafc_core_acl_groups_aro_map", ["group_id", "section_value", "aro_id"], :name => "group_id_aro_id_groups_aro_map", :unique => true

  create_table "kafc_core_log_items", :id => false, :force => true do |t|
    t.date    "time_stamp",                               :null => false
    t.string  "item_table", :limit => 50, :default => "", :null => false
    t.integer "item_id",                  :default => 0,  :null => false
    t.integer "hits",                     :default => 0,  :null => false
  end

  create_table "kafc_core_log_searches", :id => false, :force => true do |t|
    t.string  "search_term", :limit => 128, :default => "", :null => false
    t.integer "hits",                       :default => 0,  :null => false
  end

  create_table "kafc_groups", :force => true do |t|
    t.string "name", :limit => 50, :default => "", :null => false
  end

  create_table "kafc_menu", :force => true do |t|
    t.string   "menutype",         :limit => 75
    t.string   "name"
    t.string   "alias",                          :default => "",    :null => false
    t.text     "link"
    t.string   "type",             :limit => 50, :default => "",    :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.integer  "parent",                         :default => 0,     :null => false
    t.integer  "componentid",                    :default => 0,     :null => false
    t.integer  "sublevel",                       :default => 0
    t.integer  "ordering",                       :default => 0
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.integer  "pollid",                         :default => 0,     :null => false
    t.integer  "browserNav",       :limit => 1,  :default => 0
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "utaccess",         :limit => 1,  :default => 0,     :null => false
    t.text     "params",                                            :null => false
    t.integer  "lft",                            :default => 0,     :null => false
    t.integer  "rgt",                            :default => 0,     :null => false
    t.integer  "home",                           :default => 0,     :null => false
  end

  add_index "kafc_menu", ["componentid", "menutype", "published", "access"], :name => "componentid"
  add_index "kafc_menu", ["menutype"], :name => "menutype"

  create_table "kafc_menu_types", :force => true do |t|
    t.string "menutype",    :limit => 75, :default => "", :null => false
    t.string "title",                     :default => "", :null => false
    t.string "description",               :default => "", :null => false
  end

  add_index "kafc_menu_types", ["menutype"], :name => "menutype", :unique => true

  create_table "kafc_messages", :primary_key => "message_id", :force => true do |t|
    t.integer  "user_id_from", :default => 0, :null => false
    t.integer  "user_id_to",   :default => 0, :null => false
    t.integer  "folder_id",    :default => 0, :null => false
    t.datetime "date_time",                   :null => false
    t.integer  "state",        :default => 0, :null => false
    t.integer  "priority",     :default => 0, :null => false
    t.text     "subject",                     :null => false
    t.text     "message",                     :null => false
  end

  add_index "kafc_messages", ["user_id_to", "state"], :name => "useridto_state"

  create_table "kafc_messages_cfg", :id => false, :force => true do |t|
    t.integer "user_id",                  :default => 0,  :null => false
    t.string  "cfg_name",  :limit => 100, :default => "", :null => false
    t.string  "cfg_value",                :default => "", :null => false
  end

  add_index "kafc_messages_cfg", ["user_id", "cfg_name"], :name => "idx_user_var_name", :unique => true

  create_table "kafc_migration_backlinks", :primary_key => "itemid", :force => true do |t|
    t.string "name",   :limit => 100, :null => false
    t.text   "url",                   :null => false
    t.text   "sefurl",                :null => false
    t.text   "newurl",                :null => false
  end

  create_table "kafc_modules", :force => true do |t|
    t.text     "title",                                             :null => false
    t.text     "content",                                           :null => false
    t.integer  "ordering",                       :default => 0,     :null => false
    t.string   "position",         :limit => 50
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.string   "module",           :limit => 50
    t.integer  "numnews",                        :default => 0,     :null => false
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "showtitle",        :limit => 1,  :default => 1,     :null => false
    t.text     "params",                                            :null => false
    t.integer  "iscore",           :limit => 1,  :default => 0,     :null => false
    t.integer  "client_id",        :limit => 1,  :default => 0,     :null => false
    t.text     "control",                                           :null => false
  end

  add_index "kafc_modules", ["published", "access"], :name => "published"
  add_index "kafc_modules", ["module", "published"], :name => "newsfeeds"

  create_table "kafc_modules_menu", :id => false, :force => true do |t|
    t.integer "moduleid", :default => 0, :null => false
    t.integer "menuid",   :default => 0, :null => false
  end

  create_table "kafc_newsfeeds", :force => true do |t|
    t.integer  "catid",                           :default => 0,     :null => false
    t.text     "name",                                               :null => false
    t.string   "alias",                           :default => "",    :null => false
    t.text     "link",                                               :null => false
    t.string   "filename",         :limit => 200
    t.boolean  "published",                       :default => false, :null => false
    t.integer  "numarticles",                     :default => 1,     :null => false
    t.integer  "cache_time",                      :default => 3600,  :null => false
    t.integer  "checked_out",      :limit => 1,   :default => 0,     :null => false
    t.datetime "checked_out_time",                                   :null => false
    t.integer  "ordering",                        :default => 0,     :null => false
    t.integer  "rtl",              :limit => 1,   :default => 0,     :null => false
  end

  add_index "kafc_newsfeeds", ["published"], :name => "published"
  add_index "kafc_newsfeeds", ["catid"], :name => "catid"

  create_table "kafc_plugins", :force => true do |t|
    t.string   "name",             :limit => 100, :default => "", :null => false
    t.string   "element",          :limit => 100, :default => "", :null => false
    t.string   "folder",           :limit => 100, :default => "", :null => false
    t.integer  "access",           :limit => 1,   :default => 0,  :null => false
    t.integer  "ordering",                        :default => 0,  :null => false
    t.integer  "published",        :limit => 1,   :default => 0,  :null => false
    t.integer  "iscore",           :limit => 1,   :default => 0,  :null => false
    t.integer  "client_id",        :limit => 1,   :default => 0,  :null => false
    t.integer  "checked_out",                     :default => 0,  :null => false
    t.datetime "checked_out_time",                                :null => false
    t.text     "params",                                          :null => false
  end

  add_index "kafc_plugins", ["published", "client_id", "access", "folder"], :name => "idx_folder"

  create_table "kafc_poll_data", :force => true do |t|
    t.integer "pollid", :default => 0, :null => false
    t.text    "text",                  :null => false
    t.integer "hits",   :default => 0, :null => false
  end

  add_index "kafc_poll_data", ["pollid", "text"], :name => "pollid"

  create_table "kafc_poll_date", :force => true do |t|
    t.datetime "date",                   :null => false
    t.integer  "vote_id", :default => 0, :null => false
    t.integer  "poll_id", :default => 0, :null => false
  end

  add_index "kafc_poll_date", ["poll_id"], :name => "poll_id"

  create_table "kafc_poll_menu", :id => false, :force => true do |t|
    t.integer "pollid", :default => 0, :null => false
    t.integer "menuid", :default => 0, :null => false
  end

  create_table "kafc_polls", :force => true do |t|
    t.string   "title",            :default => "",    :null => false
    t.string   "alias",            :default => "",    :null => false
    t.integer  "voters",           :default => 0,     :null => false
    t.integer  "checked_out",      :default => 0,     :null => false
    t.datetime "checked_out_time",                    :null => false
    t.boolean  "published",        :default => false, :null => false
    t.integer  "access",           :default => 0,     :null => false
    t.integer  "lag",              :default => 0,     :null => false
  end

  create_table "kafc_sections", :force => true do |t|
    t.string   "title",                          :default => "",    :null => false
    t.string   "name",                           :default => "",    :null => false
    t.string   "alias",                          :default => "",    :null => false
    t.text     "image",                                             :null => false
    t.string   "scope",            :limit => 50, :default => "",    :null => false
    t.string   "image_position",   :limit => 30, :default => "",    :null => false
    t.text     "description",                                       :null => false
    t.boolean  "published",                      :default => false, :null => false
    t.integer  "checked_out",                    :default => 0,     :null => false
    t.datetime "checked_out_time",                                  :null => false
    t.integer  "ordering",                       :default => 0,     :null => false
    t.integer  "access",           :limit => 1,  :default => 0,     :null => false
    t.integer  "count",                          :default => 0,     :null => false
    t.text     "params",                                            :null => false
  end

  add_index "kafc_sections", ["scope"], :name => "idx_scope"

  create_table "kafc_session", :primary_key => "session_id", :force => true do |t|
    t.string  "username",  :limit => 150,        :default => ""
    t.string  "time",      :limit => 14,         :default => ""
    t.integer "guest",     :limit => 1,          :default => 1
    t.integer "userid",                          :default => 0
    t.string  "usertype",  :limit => 50,         :default => ""
    t.integer "gid",       :limit => 1,          :default => 0,  :null => false
    t.integer "client_id", :limit => 1,          :default => 0,  :null => false
    t.text    "data",      :limit => 2147483647
  end

  add_index "kafc_session", ["guest", "usertype"], :name => "whosonline"
  add_index "kafc_session", ["userid"], :name => "userid"
  add_index "kafc_session", ["time"], :name => "time"

  create_table "kafc_stats_agents", :id => false, :force => true do |t|
    t.string  "agent", :default => "",    :null => false
    t.boolean "type",  :default => false, :null => false
    t.integer "hits",  :default => 1,     :null => false
  end

  create_table "kafc_templates_menu", :id => false, :force => true do |t|
    t.string  "template",               :default => "", :null => false
    t.integer "menuid",                 :default => 0,  :null => false
    t.integer "client_id", :limit => 1, :default => 0,  :null => false
  end

  create_table "kafc_users", :force => true do |t|
    t.string   "name",                         :default => "", :null => false
    t.string   "username",      :limit => 150, :default => "", :null => false
    t.string   "email",         :limit => 100, :default => "", :null => false
    t.string   "password",      :limit => 100, :default => "", :null => false
    t.string   "usertype",      :limit => 25,  :default => "", :null => false
    t.integer  "block",         :limit => 1,   :default => 0,  :null => false
    t.integer  "sendEmail",     :limit => 1,   :default => 0
    t.integer  "gid",           :limit => 1,   :default => 1,  :null => false
    t.datetime "registerDate",                                 :null => false
    t.datetime "lastvisitDate",                                :null => false
    t.string   "activation",    :limit => 100, :default => "", :null => false
    t.text     "params",                                       :null => false
  end

  add_index "kafc_users", ["usertype"], :name => "usertype"
  add_index "kafc_users", ["name"], :name => "idx_name"
  add_index "kafc_users", ["gid", "block"], :name => "gid_block"
  add_index "kafc_users", ["username"], :name => "username"
  add_index "kafc_users", ["email"], :name => "email"

  create_table "kafc_weblinks", :force => true do |t|
    t.integer  "catid",                           :default => 0,     :null => false
    t.integer  "sid",                             :default => 0,     :null => false
    t.string   "title",            :limit => 250, :default => "",    :null => false
    t.string   "alias",                           :default => "",    :null => false
    t.string   "url",              :limit => 250, :default => "",    :null => false
    t.text     "description",                                        :null => false
    t.datetime "date",                                               :null => false
    t.integer  "hits",                            :default => 0,     :null => false
    t.boolean  "published",                       :default => false, :null => false
    t.integer  "checked_out",                     :default => 0,     :null => false
    t.datetime "checked_out_time",                                   :null => false
    t.integer  "ordering",                        :default => 0,     :null => false
    t.boolean  "archived",                        :default => false, :null => false
    t.boolean  "approved",                        :default => true,  :null => false
    t.text     "params",                                             :null => false
  end

  add_index "kafc_weblinks", ["catid", "published", "archived"], :name => "catid"

  create_table "kafc_wp_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",      :limit => 8,   :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 20,  :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "kafc_wp_comments", ["comment_approved"], :name => "comment_approved"
  add_index "kafc_wp_comments", ["comment_post_ID"], :name => "comment_post_ID"
  add_index "kafc_wp_comments", ["comment_approved", "comment_date_gmt"], :name => "comment_approved_date_gmt"
  add_index "kafc_wp_comments", ["comment_date_gmt"], :name => "comment_date_gmt"

  create_table "kafc_wp_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 20,       :default => "Y", :null => false
    t.integer  "link_owner",       :limit => 8,        :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "kafc_wp_links", ["link_visible"], :name => "link_visible"

  create_table "kafc_wp_options", :id => false, :force => true do |t|
    t.integer "option_id",    :limit => 8,                             :null => false
    t.integer "blog_id",                            :default => 0,     :null => false
    t.string  "option_name",  :limit => 64,         :default => "",    :null => false
    t.text    "option_value", :limit => 2147483647,                    :null => false
    t.string  "autoload",     :limit => 20,         :default => "yes", :null => false
  end

  add_index "kafc_wp_options", ["option_name"], :name => "option_name"

  create_table "kafc_wp_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "kafc_wp_postmeta", ["post_id"], :name => "post_id"
  add_index "kafc_wp_postmeta", ["meta_key"], :name => "meta_key"

  create_table "kafc_wp_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 20,         :default => "publish", :null => false
    t.string   "comment_status",        :limit => 20,         :default => "open",    :null => false
    t.string   "ping_status",           :limit => 20,         :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered",                                              :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "kafc_wp_posts", ["post_name"], :name => "post_name"
  add_index "kafc_wp_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"
  add_index "kafc_wp_posts", ["post_parent"], :name => "post_parent"

  create_table "kafc_wp_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
    t.integer "term_order",                    :default => 0, :null => false
  end

  add_index "kafc_wp_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "kafc_wp_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "kafc_wp_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true
  add_index "kafc_wp_term_taxonomy", ["taxonomy"], :name => "taxonomy"

  create_table "kafc_wp_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 200, :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "kafc_wp_terms", ["slug"], :name => "slug", :unique => true
  add_index "kafc_wp_terms", ["name"], :name => "name"

  create_table "kafc_wp_usermeta", :primary_key => "umeta_id", :force => true do |t|
    t.integer "user_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "kafc_wp_usermeta", ["user_id"], :name => "user_id"
  add_index "kafc_wp_usermeta", ["meta_key"], :name => "meta_key"

  create_table "kafc_wp_users", :primary_key => "ID", :force => true do |t|
    t.string   "user_login",          :limit => 60,  :default => "", :null => false
    t.string   "user_pass",           :limit => 64,  :default => "", :null => false
    t.string   "user_nicename",       :limit => 50,  :default => "", :null => false
    t.string   "user_email",          :limit => 100, :default => "", :null => false
    t.string   "user_url",            :limit => 100, :default => "", :null => false
    t.datetime "user_registered",                                    :null => false
    t.string   "user_activation_key", :limit => 60,  :default => "", :null => false
    t.integer  "user_status",                        :default => 0,  :null => false
    t.string   "display_name",        :limit => 250, :default => "", :null => false
  end

  add_index "kafc_wp_users", ["user_login"], :name => "user_login_key"
  add_index "kafc_wp_users", ["user_nicename"], :name => "user_nicename"

  create_table "wos_entries", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "domain"
    t.string   "protocol"
    t.string   "mac"
    t.text     "note"
    t.boolean  "verified",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "note_displayed", :default => false
  end

  create_table "wos_schema_migrations", :primary_key => "version", :force => true do |t|
  end

  add_index "wos_schema_migrations", ["version"], :name => "unique_schema_migrations", :unique => true

  create_table "wos_users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "wos_users", ["login"], :name => "index_wos_users_on_login", :unique => true

  create_table "wp_180_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",                     :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 0,   :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "wp_180_comments", ["comment_approved"], :name => "comment_approved"
  add_index "wp_180_comments", ["comment_post_ID"], :name => "comment_post_ID"

  create_table "wp_180_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.integer  "link_category",    :limit => 8,        :default => 0,   :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 0,        :default => "Y", :null => false
    t.integer  "link_owner",                           :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "wp_180_links", ["link_category"], :name => "link_category"
  add_index "wp_180_links", ["link_visible"], :name => "link_visible"

  create_table "wp_180_options", :id => false, :force => true do |t|
    t.integer "option_id",    :limit => 8,                             :null => false
    t.integer "blog_id",                            :default => 0,     :null => false
    t.string  "option_name",  :limit => 64,         :default => "",    :null => false
    t.text    "option_value", :limit => 2147483647,                    :null => false
    t.string  "autoload",     :limit => 0,          :default => "yes", :null => false
  end

  add_index "wp_180_options", ["option_name"], :name => "option_name"

  create_table "wp_180_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_180_postmeta", ["post_id"], :name => "post_id"
  add_index "wp_180_postmeta", ["meta_key"], :name => "meta_key"

  create_table "wp_180_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.integer  "post_category",                               :default => 0,         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 0,          :default => "publish", :null => false
    t.string   "comment_status",        :limit => 0,          :default => "open",    :null => false
    t.string   "ping_status",           :limit => 0,          :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered",                                              :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "wp_180_posts", ["post_name"], :name => "post_name"
  add_index "wp_180_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"

  create_table "wp_180_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
  end

  add_index "wp_180_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "wp_180_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "wp_180_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true

  create_table "wp_180_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 55,  :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "wp_180_terms", ["slug"], :name => "slug", :unique => true

  create_table "wp_180_usermeta", :primary_key => "umeta_id", :force => true do |t|
    t.integer "user_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_180_usermeta", ["user_id"], :name => "user_id"
  add_index "wp_180_usermeta", ["meta_key"], :name => "meta_key"

  create_table "wp_180_users", :primary_key => "ID", :force => true do |t|
    t.string   "user_login",          :limit => 60,  :default => "", :null => false
    t.string   "user_pass",           :limit => 64,  :default => "", :null => false
    t.string   "user_nicename",       :limit => 50,  :default => "", :null => false
    t.string   "user_email",          :limit => 100, :default => "", :null => false
    t.string   "user_url",            :limit => 100, :default => "", :null => false
    t.datetime "user_registered",                                    :null => false
    t.string   "user_activation_key", :limit => 60,  :default => "", :null => false
    t.integer  "user_status",                        :default => 0,  :null => false
    t.string   "display_name",        :limit => 250, :default => "", :null => false
  end

  add_index "wp_180_users", ["user_login"], :name => "user_login_key"
  add_index "wp_180_users", ["user_nicename"], :name => "user_nicename"

  create_table "wp_190_comments", :primary_key => "comment_ID", :force => true do |t|
    t.integer  "comment_post_ID",                     :default => 0,   :null => false
    t.text     "comment_author",       :limit => 255,                  :null => false
    t.string   "comment_author_email", :limit => 100, :default => "",  :null => false
    t.string   "comment_author_url",   :limit => 200, :default => "",  :null => false
    t.string   "comment_author_IP",    :limit => 100, :default => "",  :null => false
    t.datetime "comment_date",                                         :null => false
    t.datetime "comment_date_gmt",                                     :null => false
    t.text     "comment_content",                                      :null => false
    t.integer  "comment_karma",                       :default => 0,   :null => false
    t.string   "comment_approved",     :limit => 0,   :default => "1", :null => false
    t.string   "comment_agent",                       :default => "",  :null => false
    t.string   "comment_type",         :limit => 20,  :default => "",  :null => false
    t.integer  "comment_parent",       :limit => 8,   :default => 0,   :null => false
    t.integer  "user_id",              :limit => 8,   :default => 0,   :null => false
  end

  add_index "wp_190_comments", ["comment_approved"], :name => "comment_approved"
  add_index "wp_190_comments", ["comment_post_ID"], :name => "comment_post_ID"

  create_table "wp_190_links", :primary_key => "link_id", :force => true do |t|
    t.string   "link_url",                             :default => "",  :null => false
    t.string   "link_name",                            :default => "",  :null => false
    t.string   "link_image",                           :default => "",  :null => false
    t.string   "link_target",      :limit => 25,       :default => "",  :null => false
    t.integer  "link_category",    :limit => 8,        :default => 0,   :null => false
    t.string   "link_description",                     :default => "",  :null => false
    t.string   "link_visible",     :limit => 0,        :default => "Y", :null => false
    t.integer  "link_owner",                           :default => 1,   :null => false
    t.integer  "link_rating",                          :default => 0,   :null => false
    t.datetime "link_updated",                                          :null => false
    t.string   "link_rel",                             :default => "",  :null => false
    t.text     "link_notes",       :limit => 16777215,                  :null => false
    t.string   "link_rss",                             :default => "",  :null => false
  end

  add_index "wp_190_links", ["link_category"], :name => "link_category"
  add_index "wp_190_links", ["link_visible"], :name => "link_visible"

  create_table "wp_190_options", :id => false, :force => true do |t|
    t.integer "option_id",    :limit => 8,                             :null => false
    t.integer "blog_id",                            :default => 0,     :null => false
    t.string  "option_name",  :limit => 64,         :default => "",    :null => false
    t.text    "option_value", :limit => 2147483647,                    :null => false
    t.string  "autoload",     :limit => 0,          :default => "yes", :null => false
  end

  add_index "wp_190_options", ["option_name"], :name => "option_name"

  create_table "wp_190_postmeta", :primary_key => "meta_id", :force => true do |t|
    t.integer "post_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_190_postmeta", ["post_id"], :name => "post_id"
  add_index "wp_190_postmeta", ["meta_key"], :name => "meta_key"

  create_table "wp_190_posts", :primary_key => "ID", :force => true do |t|
    t.integer  "post_author",           :limit => 8,          :default => 0,         :null => false
    t.datetime "post_date",                                                          :null => false
    t.datetime "post_date_gmt",                                                      :null => false
    t.text     "post_content",          :limit => 2147483647,                        :null => false
    t.text     "post_title",                                                         :null => false
    t.integer  "post_category",                               :default => 0,         :null => false
    t.text     "post_excerpt",                                                       :null => false
    t.string   "post_status",           :limit => 0,          :default => "publish", :null => false
    t.string   "comment_status",        :limit => 0,          :default => "open",    :null => false
    t.string   "ping_status",           :limit => 0,          :default => "open",    :null => false
    t.string   "post_password",         :limit => 20,         :default => "",        :null => false
    t.string   "post_name",             :limit => 200,        :default => "",        :null => false
    t.text     "to_ping",                                                            :null => false
    t.text     "pinged",                                                             :null => false
    t.datetime "post_modified",                                                      :null => false
    t.datetime "post_modified_gmt",                                                  :null => false
    t.text     "post_content_filtered",                                              :null => false
    t.integer  "post_parent",           :limit => 8,          :default => 0,         :null => false
    t.string   "guid",                                        :default => "",        :null => false
    t.integer  "menu_order",                                  :default => 0,         :null => false
    t.string   "post_type",             :limit => 20,         :default => "post",    :null => false
    t.string   "post_mime_type",        :limit => 100,        :default => "",        :null => false
    t.integer  "comment_count",         :limit => 8,          :default => 0,         :null => false
  end

  add_index "wp_190_posts", ["post_name"], :name => "post_name"
  add_index "wp_190_posts", ["post_type", "post_status", "post_date", "ID"], :name => "type_status_date"

  create_table "wp_190_term_relationships", :id => false, :force => true do |t|
    t.integer "object_id",        :limit => 8, :default => 0, :null => false
    t.integer "term_taxonomy_id", :limit => 8, :default => 0, :null => false
  end

  add_index "wp_190_term_relationships", ["term_taxonomy_id"], :name => "term_taxonomy_id"

  create_table "wp_190_term_taxonomy", :primary_key => "term_taxonomy_id", :force => true do |t|
    t.integer "term_id",     :limit => 8,          :default => 0,  :null => false
    t.string  "taxonomy",    :limit => 32,         :default => "", :null => false
    t.text    "description", :limit => 2147483647,                 :null => false
    t.integer "parent",      :limit => 8,          :default => 0,  :null => false
    t.integer "count",       :limit => 8,          :default => 0,  :null => false
  end

  add_index "wp_190_term_taxonomy", ["term_id", "taxonomy"], :name => "term_id_taxonomy", :unique => true

  create_table "wp_190_terms", :primary_key => "term_id", :force => true do |t|
    t.string  "name",       :limit => 55,  :default => "", :null => false
    t.string  "slug",       :limit => 200, :default => "", :null => false
    t.integer "term_group", :limit => 8,   :default => 0,  :null => false
  end

  add_index "wp_190_terms", ["slug"], :name => "slug", :unique => true

  create_table "wp_190_usermeta", :primary_key => "umeta_id", :force => true do |t|
    t.integer "user_id",    :limit => 8,          :default => 0, :null => false
    t.string  "meta_key"
    t.text    "meta_value", :limit => 2147483647
  end

  add_index "wp_190_usermeta", ["user_id"], :name => "user_id"
  add_index "wp_190_usermeta", ["meta_key"], :name => "meta_key"

  create_table "wp_190_users", :primary_key => "ID", :force => true do |t|
    t.string   "user_login",          :limit => 60,  :default => "", :null => false
    t.string   "user_pass",           :limit => 64,  :default => "", :null => false
    t.string   "user_nicename",       :limit => 50,  :default => "", :null => false
    t.string   "user_email",          :limit => 100, :default => "", :null => false
    t.string   "user_url",            :limit => 100, :default => "", :null => false
    t.datetime "user_registered",                                    :null => false
    t.string   "user_activation_key", :limit => 60,  :default => "", :null => false
    t.integer  "user_status",                        :default => 0,  :null => false
    t.string   "display_name",        :limit => 250, :default => "", :null => false
  end

  add_index "wp_190_users", ["user_login"], :name => "user_login_key"
  add_index "wp_190_users", ["user_nicename"], :name => "user_nicename"

end
