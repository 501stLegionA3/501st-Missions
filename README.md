# 501st Missions

> The repository for holding all of the 501st Mission Files.

## Usage Guide

### Adding New Compositions

1. Create your composition. Give it a name, the simpler the better (easier to add to the generator).
2. Add an object with the name `mission_generator_center_point`. See the existing compositions for an example of this. 
    - You want to place this at the spawnpoint of your composition (it's where the generator will use a centerpoint on the comp for spawning).
3. Open a framework map and place your composition where the spawn should be.
4. Zoom in as close as you can get to the object you placed in step 2 and hover your cursor over the marker.
5. Paste/create a new maker (using a marker from a previous map or one from a different comp already on the map). Using `ctrl+v` will paste the marker at your mouse cursor.
    - DO NOT DELETE ANY EXISTING MARKERS
6. Ensure the name of the maker matches the name of the composition exactly (i.e: matches the folder name of the composition).
7. Repeat steps 3-7 for every framework map.
8. Place your new template comp in `Compositions/Generator` and `Compositions/<correct folder, ex: fobs in the FOB folder>`. 
    - The generator folder is for running the mission generator, the other one is for a backup.
9. Update all the Framework files in the repo with your new copies that you added the new markers to
10. Push an update to the repo

And thats that, your new comp should have its own files generated the next time the generator runs.
