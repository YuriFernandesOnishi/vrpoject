@tool
##Diffuse material used for LevelTile nodes. Supports custom material properties.
class_name LevelMaterial
extends StandardMaterial3D

@export_group("--- LEVEL TOOLS ---")
##Properties used to differentiate surface materials in collision detection.
@export var material_properties:MaterialProperties=MaterialProperties.new()
##If true, generates collision geometry for all tiles with this material.
@export var generate_collider:bool=true

func _init() -> void:
	#default values for this material
	diffuse_mode = DIFFUSE_LAMBERT
	vertex_color_use_as_albedo = true #for face shading
	specular_mode = SPECULAR_DISABLED
	metallic_specular = 0.0
	texture_filter = TEXTURE_FILTER_NEAREST_WITH_MIPMAPS
