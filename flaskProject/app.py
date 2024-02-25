from flask import request, Flask, jsonify
import pandas as pd
app = Flask(__name__)


@app.route('/api', methods=['GET'])
def hello_world():  # put application's code here
    su = float(str(request.args['s']))
    maintenanc = float(str(request.args['m']))
    nativ = float(str(request.args['n']))
    climate_zon = float(str(request.args['c']))
    soi = float(str(request.args['d']))

    sun = ""
    maintenance = ""
    native = ""
    climate_zone = ""
    soil = ""

    if su == 1:
        sun = "Sun"
    if su == 2:
        sun = "Semi-shade"
    if su == 3:
        sun = "Shade"
    if maintenanc == 1:
        maintenance = "Low"
    if maintenanc == 2:
        maintenance = "Medium"
    if maintenanc == 3:
        maintenance = "High"
    if nativ == 1:
        native = "Yes"
    if nativ == 2:
        native = "No"
    if climate_zon == 1:
        climate_zone = "Dry Subtropical"
    if climate_zon == 2:
        climate_zone = "Dry Tropical"
    if climate_zon == 3:
        climate_zone = "Humid Subtropical"
    if climate_zon == 4:
        climate_zone = "Humid Tropical"
    if soi == 1:
        soil = "Loam"
    if soi == 2:
        soil = "Clay"
    if soi == 3:
        soil = "Open compost"
    if soi == 4:
        soil = "Sandy"

    df = pd.read_csv('flaskProject/waterwise-plants.csv', encoding='latin-1')
    #print(df.head())

    to_drop = ['Plant ID',
               'Foliage Colour',
               'Flower colour',
               'Plant Code',
               'Water Needs',
               'Plant Type',
               'Height Ranges',
               'Spread Ranges',
               'Previous Name',
               'Soil Additional',
               'Abcission',
               'Foliage Colour',
               'Perfume',
               'Aromatic',
               'Edible',
               'Bird Attracting',
               'Bird Attractant',
               'Bore water Tolerance',
               'Frost Tolerance',
               'Greywater Tolerance',
               'Butterfly Attracting',
               'Butterfly Type',
               'Image',
               'Image Location',
               'Image Owner',
               'Herb External Have',
               'Herb Images change to ',
               'Notes',
               'Why photo removed',
               'Why plant removed',
               'Actioned By',
               'Date Actioned',
               'Status']

    df.drop(to_drop, inplace=True, axis=1)

    #print(df.head())

    plant_names_and_scores = []

    for ind in df.index:
        plant_score = 0
        if sun in df["Light Needs"]:
            plant_score = plant_score + 3
        if maintenance in df["Maintenance"]:
            plant_score = plant_score + 2
        if native in df["Native"]:
            plant_score = plant_score + 1
        if climate_zone in df["Climate Zones"]:
            plant_score = plant_score + 3
        if soil in df["Soil Type"]:
            plant_score = plant_score + 2
        name = df['Common Name'][ind]
        if type(name) != str:
            name = "None"
        plant_names_and_scores.append((plant_score, name))
        #plant_names_and_scores.append((plant_score, df['Common Name'][ind]))

    # we plan to formalize these weights using a machine learning model at some point

    plant_names_to_return = []

    plant_names_and_scores.sort(reverse=True)
    for i in range(10):
        plant_names_to_return.append(plant_names_and_scores[i][1])

    #return plant_names_to_return



    json_file = {}
    json_file['query'] = plant_names_to_return
    return jsonify(json_file)


if __name__ == '__main__':
    app.run()
