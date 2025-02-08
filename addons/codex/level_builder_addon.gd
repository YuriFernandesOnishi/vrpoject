@tool
extends EditorPlugin

var builder:LevelBuilder #currently selected LevelBuilder node
var build_button:Button #build geometry button to activate LevelBuilder

func _enter_tree() -> void: #when plugin enabled
	add_autoload_singleton("Codex", "res://addons/codex/globals/lb_global.gd") #add global script

func _exit_tree() -> void: #when plugin disabled
	remove_autoload_singleton("Codex") #remove global script

func _handles(object: Object) -> bool: #when node selected
	return object is LevelBuilder #return true if selected object is a level builder

func _edit(object: Object) -> void:
	if not object: #if object is invalid (determined in handles)
		return
	
	builder = object #update builder to currently selected

func _make_visible(visible: bool) -> void:
	if visible: #if builder selected
		_add_build_button()
	else: #if builder deselected
		_remove_build_button()

func _add_build_button() -> void: #creates a build button
	if build_button: #if button already exists
		return
	
	build_button = Button.new() #create a new button
	build_button.text = "Build Level Geometry" #button text
	build_button.focus_mode = Control.FOCUS_NONE #disable focus
	build_button.flat = true #makes it look nicer
	build_button.pressed.connect(_build_level) #connect button to _build_level function
	
	add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, build_button) #add to toolbar

func _remove_build_button() -> void: #removes the build button
	if build_button: #if build button exists
		remove_control_from_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, build_button) #remove from toolbar
		build_button.queue_free() #delete button
		build_button = null #remove build button reference

func _build_level() -> void: #when build button pressed
	if builder != null: #if there is a valid builder
		builder._build_geometry() #trigger builder
