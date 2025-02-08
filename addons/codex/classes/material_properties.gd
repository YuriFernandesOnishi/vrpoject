##Material properties used for LevelMaterial resource and LevelCollider node.
class_name MaterialProperties
extends Resource

##ID used to differentiate colliders. Can be used for differentiating footstep sounds, bullet decals, etc.
##Functionality must be added manually.
@export var material_id:int=0
##Can be used to differentiate material types in collision testing.
##Custom material types can be added in the material_enumerator script.
##Functionality must be added manually.
@export var material_type:CodexConstants.Materials=CodexConstants.Materials.GENERAL
##Physics material for collider. Can be used to make surfaces have custom physics properties e.g. slippery ice.
##Functionality must be added manually if not using RigidBody physics.
@export var physics_material:PhysicsMaterial
