Make sure that the Codex plugin is enabled in Project Settings -> Plugins
You may need to reload your project before Codex will work.

--- IMPORTANT ---
It is recommended to create a layouts folder to save all Codex-related scenes to.
You should not use any LevelBuilder or LevelTile-derived nodes in your actual game levels.
Instead, save your layouts separately and copy the generated geometry to your level.


--- CLASSES ---
This plugin introduces several new classes:
	-LevelBuilder (generates optimised level geometry from LevelTile nodes)
	-LevelTile (a single tile with customisable material and shape)
	-LevelTileCull (will cull any adjacent LevelTile node faces)
	-LevelTileInvisible (like a LevelTile, but generates collision data only)
	-FaceShading (data used to source colour for each face of a tile)
	-LevelCollider (custom StaticBody3D variant with support for material properties)
	-LevelMaterial (custom Material with diffuse shading by default and material properties for use in collision)
	-CodexConstants (class with material properties enumerator)
	-MaterialProperties (material properties used for material-related collision behaviour)
	-TileShape (special data type for generating tile visuals)

To use Codex, you will mainly be dealing with LevelBuilder and all LevelTile-derived nodes.


--- SETUP ---
To begin constructing a level, add a Node3D called "Geometry" and another called "Output" as 
children of the scene root.
Separately to these, create a new LevelBuilder node.
You MUST configure the first three variables:
	-Set Output Folder to the Node3D named "Output"
	-Set Geometry Folder to the Node3D named "Geometry"
	-Set Scene Root to the current scene root
The rest can be customised to your liking.

Add LevelTile nodes as children/grandchildren of the Node3D called "Geometry".
Customise them to your liking with materials and shape data.

When you have created a layout, select your LevelBuilder node and 
press the "Build Level Geometry" button on the toolbar.
This will create an optimised mesh of your level layout, which can be copied
from the output folder and pasted into your level.


--- TECHNIQUES AND BEST PRACTICES ---
There are multiple different techniques that you can use to build levels with Codex.

-Technique 1: Manual-
	This technique involves building a level out of standard blocks and
	culling any unwanted faces manually with either LevelTileCull nodes, 
	material overrides with material_nodraw.tres, or the Cull Bottom and Cull Top 
	variables in the LevelBuilder node.
	This technique is best for outdoor levels or non-level geometry.

-Technique 2: Interior Mode-
	This technique involves enabling Interior Mode on your LevelBuilder node.
	This will dramatically increase build times, but requires almost no manual culling.
	Build levels as you would with the Manual Technique, but ensure that they are
	completely enclosed. For outdoor levels, seal any outdoor area with 
	LevelTileCull or LevelTileInvisible nodes, which do not generate a mesh.

	Lowering the scan radius may increase performance but decreases cull accuracy.

-Technique 3: Flipped Faces-
	For this technique, you must build a level out of inverted tiles.
	It is by far the most performance efficient method for building interior layouts, but is limited
	in tile shape complexity and may be less readable in the editor.

	You can flip a tile's faces by enabling Flip Faces on an individual LevelTile
	or by enabling Force Flip Faces on the LevelBuilder node.
	
	To set multiple different materials on the same tile (necessary for this technique), you
	must add separate materials in the material overrides array (each array element denotes an individual face).
	If you have any issues with extra faces being drawn, you can set a LevelTile's material overrides
	to material_nodraw.tres to cull a specific face.
	
	If you are struggling with readability in the editor, you can disable Flip Faces in Editor
	on a LevelTile node to make it render as usual.
