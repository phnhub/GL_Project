setlocal
set "list=F L P S SC A"
 for %%i in (%list%) do (
  python create_map_geojson.py %%i
)
