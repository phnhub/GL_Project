import folium
import json
import sys
from branca.element import Template, MacroElement

# pour avoir le nbr par catégorie. à faire
# with open(
#     "communes-ile-de-france_fleurs_4",
# ) as f:
#     data_fleurs = json.load(f, encoding="utf-8")
# print(len(data_fleurs["features"]))

# création map centrée sur Paris
m = folium.Map(
    location=[48.7, 2.3],
    zoom_start=5,
    tiles=None,
)

folium.TileLayer("CartoDB positron", name="Light Map", control=False).add_to(m)


# define the color of the Geojon data (https://leafletjs.com/reference-1.6.0.html#path-option)
colorlist = ["#f6eff8", "#bdc9e1", "#67a9cf", "#1c9099", "#016c59"]
colors_legend={}
value_legend={"F":"score Fiscalité","L":"score logement","P":"score population","SC":"score service_commerce","S": "score santé","A":"potentiel_region"}

def style_function(spec,number):
    if(number==0):
       spec=0
    if(number >0 and number <0.25):
      spec=1
    if(number >0.25 and number <0.5):
      spec=2
    if(number >0.5 and number <0.75):
      spec=3
    if(number>0.75 and number <=1.0):
       spec=4
    if(number>1):
       spec=4
    t=tuple(int(colorlist[spec][i:i + 2], 16) / 255. for i in (1, 3, 5))
    y=list(t)
    print(y,number)
    if (number<0):
       number=-number/10
    if(number==1):
       y[0]=y[0]*number
       y[1]=y[1]*number
       y[2]=y[2]*number
    else:
        y[0]=y[0]*number*1.5
        y[1]=y[1]*number*1.5
        y[2]=y[2]*number*1.5
    
    print(y)
    
    d=f'#{int(y[0]*255):02x}{int(y[1]*255):02x}{int(y[2]*255):02x}'
    colors_legend[d]=number
    print(colorlist[spec],d)
    return lambda x: {
        "color": d,
        "fillOpacity": 0.5,
        "weight": 1,
    }


highlight_function = lambda x: {
    "fillColor": "#000000",
    "color": "#000000",
    "fillOpacity": 0.50,
    "weight": 0.3,
}


def add_data_GeoJson(map,spec,p):
    s=spec.split("_")
    number=int(s[1])
    print(s[0],dict_spec[s[0]])
    commune_data = folium.features.GeoJson(
        data="data" + str(spec)+".json",
        style_function=style_function(dict_spec[s[0]],p),
        highlight_function=highlight_function,
        tooltip=folium.features.GeoJsonTooltip(
            fields=["nom", "code", "val_A"],
            aliases=["Region ", "Code Postal: ", value_legend[sys.argv[1]]+": "],
            style=(
                "background-color: white; color: #333333; font-family: arial; font-size: 12px; padding: 10px;"
            ),
            sticky=False,
        ),
        name="Regions val_A",
    )
    map.add_child(commune_data)
    map.keep_in_front(commune_data)


dict_spec={"F":0,"L":1,"P":2,"S":3,"SC":4, "A":4}
print("INFO:",sys.argv[1])
for i in range(18):
    p=0
    with open("data"+sys.argv[1]+"_"+str(i)+".json","rb",) as f:
         data= json.load(f, encoding="utf-8")
         p=data["properties"]["val_A"]
    commune_0 = add_data_GeoJson(m, sys.argv[1]+"_"+str(i),p)


folium.LayerControl().add_to(m)


template = """
{% macro html(this, kwargs) %}

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  $( function() {
    $( "#maplegend" ).draggable({
                    start: function (event, ui) {
                        $(this).css({
                            right: "auto",
                            top: "auto",
                            bottom: "auto"
                        });
                    }
                });
});

  </script>
</head>
<body>

 
<div id='maplegend' class='maplegend' 
    style='position: absolute; z-index:9999; border:2px solid grey; background-color:rgba(255, 255, 255, 0.8);
     border-radius:6px; padding: 10px; font-size:14px; right: 20px; bottom: 20px;'>
<div class='legend-title'>"""+value_legend[sys.argv[1]]+""" <br> Regions de France </div>
<div class='legend-scale'>
  <ul class='legend-labels'>
  """
colors_legend=dict(sorted(colors_legend.items(), key=lambda item: item[1]))
for i in colors_legend.keys():
    template+="""<li><span style='background:"""+str(i)+""";opacity:0.7;'></span>"""+str(colors_legend[i])+"""</li>"""
template+="""
  </ul>
</div>
</div>
 
</body>
</html>

<style type='text/css'>
  .maplegend .legend-title {
    text-align: center;
    margin-bottom: 5px;
    font-weight: bold;
    font-size: 90%;
    }
  .maplegend .legend-scale ul {
    margin: 0;
    margin-bottom: 5px;
    padding: 0;
    float: left;
    list-style: none;
    }
  .maplegend .legend-scale ul li {
    font-size: 80%;
    list-style: none;
    margin-left: 0;
    line-height: 18px;
    margin-bottom: 2px;
    }
  .maplegend ul.legend-labels li span {
    display: block;
    float: left;
    height: 16px;
    width: 30px;
    margin-right: 5px;
    margin-left: 0;
    border: 1px solid #999;
    }
  .maplegend .legend-source {
    font-size: 80%;
    color: #777;
    clear: both;
    }
  .maplegend a {
    color: #777;
    }
</style>
{% endmacro %}"""

macro = MacroElement()
macro._template = Template(template)

m.get_root().add_child(macro)
m.save(value_legend[sys.argv[1]]+".html")