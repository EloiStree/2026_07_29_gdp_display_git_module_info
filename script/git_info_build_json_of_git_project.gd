class_name GitInfoBuildJsonOfGitProject
extends Node


signal on_json_generated(json:String)

@export var _where_to_save_git_info:String= "res://_/project_info/git_info/"
@export_multiline() var json_generated:String

func _ready() -> void:
	_generate_json_of_git_project()


func _generate_json_of_git_project() -> void:
	var project_path = ProjectSettings.globalize_path("res://")
	var git_info = {
		"current_branch": _editor_get_current_branch_name(),
		"current_commit_hash": _editor_get_current_commit_hash(),
		"git_module_folder": _editor_find_config_files_in_module_folder(),
		"git_module_files": _editor_get_url_in_git_module_config_file(),
	}
	var json = JSON.new()
	json_generated = json.stringify(git_info, "\t")
	print("Generated JSON of Git project info:\n" + json_generated)
	on_json_generated.emit( json_generated)


func _editor_get_url_in_git_module_config_file() -> String:
	var config_file_path = ProjectSettings.globalize_path("res://") + ".gitmodules"
	var url = ""
	var file = FileAccess.open(config_file_path, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var lines = content.split("\n")
		for line in lines:
			if line.begins_with("url = "):
				url = line.trim_prefix("url = ").strip_edges()
				break
	return url

func _editor_get_current_branch_name() -> String:
	var branch_name = ""
	var git_head_path = ProjectSettings.globalize_path("res://") + ".git/HEAD"
	var file = FileAccess.open(git_head_path, FileAccess.READ)
	if file:
		var head_content = file.get_as_text().strip_edges()
		if head_content.begins_with("ref: refs/heads/"):
			branch_name = head_content.trim_prefix("ref: refs/heads/")
	return branch_name

func _editor_get_current_commit_hash() -> String:
	var commit_hash = ""
	var git_head_path = ProjectSettings.globalize_path("res://") + ".git/ORIG_HEAD"
	var file = FileAccess.open(git_head_path, FileAccess.READ)
	if file:
		commit_hash = file.get_as_text().strip_edges()
	return commit_hash

func _editor_find_config_files_in_module_folder()->Array[String]:
	var config_files :Array[String]= []
	var project_path = ProjectSettings.globalize_path("res://")
	var relative_folder_path = ".git/modules/"
	var full_folder_path = project_path.path_join(relative_folder_path)
	var dir = DirAccess.open(full_folder_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if "config" in file_name:
				config_files.append(file_name)
			file_name = dir.get_next()
	return config_files


# FILE NAME:  ORIG_HEAD


# FOLDER NAME .git/modules/addons/




# FILE NAME: .gitsubmodule

# [submodule "addons/2024_10_16_gdp_blocks_color"]
# 	path = addons/2024_10_16_gdp_blocks_color
# 	url = https://github.com/EloiStree/2024_10_16_gdp_blocks_color.git
# [submodule "addons/2025_10_28_gdp_trusted_websocket"]
# 	path = addons/2025_10_28_gdp_trusted_websocket
# 	url = https://github.com/EloiStree/2025_10_28_gdp_trusted_websocket.git
# [submodule "addons/2025_10_27_gdp_udp_in_out_gate"]
# 	path = addons/2025_10_27_gdp_udp_in_out_gate
# 	url = https://github.com/EloiStree/2025_10_27_gdp_udp_in_out_gate
# [submodule "addons/2026_07_19_gdp_roller_wheel"]
# 	path = addons/2026_07_19_gdp_roller_wheel
# 	url = https://github.com/EloiStree/2026_07_19_gdp_roller_wheel.git
# [submodule "addons/2026_07_20_gdp_get_ipv4_info"]
# 	path = addons/2026_07_20_gdp_get_ipv4_info
# 	url = https://github.com/EloiStree/2026_07_20_gdp_get_ipv4_info.git
# [submodule "addons/2026_04_11_gdp_learn_with_sensors"]
# 	path = addons/2026_04_11_gdp_learn_with_sensors
# 	url = https://github.com/EloiStree/2026_04_11_gdp_learn_with_sensors.git
# [submodule "addons/2026_04_27_gdp_oled_128x64"]
# 	path = addons/2026_04_27_gdp_oled_128x64
# 	url = https://github.com/EloiStree/2026_04_27_gdp_oled_128x64.git
# [submodule "2026_07_29_gdp_typing_god"]
# 	path = addons/2026_07_29_gdp_typing_god
# 	url = https://github.com/EloiStree/2026_07_29_gdp_typing_god.git
# [submodule "2026_07_26_gdp_kiss_your_puppets"]
# 	path = addons/2026_07_26_gdp_kiss_your_puppets
# 	url = https://github.com/EloiStree/2026_07_26_gdp_kiss_your_puppets.git
# [submodule "addons/2026_07_30_gdp_boolean_register"]
# 	path = addons/2026_07_30_gdp_boolean_register
# 	url = https://github.com/EloiStree/2026_07_30_gdp_boolean_register.git
# [submodule "addons/2026_07_26_gdp_kiss_your_puppets"]
# 	path = addons/2026_07_26_gdp_kiss_your_puppets
# 	url = https://github.com/EloiStree/2026_07_26_gdp_kiss_your_puppets.git
# [submodule "addons/2026_07_29_gdp_typing_god"]
# 	path = addons/2026_07_29_gdp_typing_god
# 	url = https://github.com/EloiStree/2026_07_29_gdp_typing_god.git
# [submodule "addons/2026_07_31_gdp_load_scene_by_guid"]
# 	path = addons/2026_07_31_gdp_load_scene_by_guid
# 	url = https://github.com/EloiStree/2026_07_31_gdp_load_scene_by_guid.git
# [submodule "addons/2026_07_29_gdp_morse_detector"]
# 	path = addons/2026_07_29_gdp_morse_detector
# 	url = https://github.com/EloiStree/2026_07_29_gdp_morse_detector.git
# [submodule "addons/2025_01_01_gdp_square_color_telemetry"]
# 	path = addons/2025_01_01_gdp_square_color_telemetry
# 	url = https://github.com/EloiStree/2025_01_01_gdp_square_color_telemetry.git
# [submodule "addons/2026_07_29_gdp_display_git_module_info"]
# 	path = addons/2026_07_29_gdp_display_git_module_info
# 	url = https://github.com/EloiStree/2026_07_29_gdp_display_git_module_info.git
