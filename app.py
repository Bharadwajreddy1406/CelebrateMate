from flask import Flask, jsonify
import requests
from datetime import datetime, timedelta

app = Flask(__name__)
current_time = datetime.now()
new_time = current_time + timedelta(hours=11, minutes=30)
today = new_time.strftime("%Y-%m-%d")


def get_asteroid_data(api_key, start_date, end_date):
    url = f"http://api.nasa.gov/neo/rest/v1/feed?start_date={start_date}&end_date={end_date}&detailed=false&api_key={api_key}"
    response = requests.get(url)
    data = response.json()
    return data


def parse_asteroid_data(data):
    global today
    asteroid_data = data.get("near_earth_objects", {}).get(str(today), [])
    parsed_data = {}

    for index, asteroid in enumerate(asteroid_data):
        name = asteroid.get("name", "")
        close_approach_data = asteroid.get("close_approach_data", [])

        for approach in close_approach_data:
            time = approach.get("close_approach_date_full", "")
            miss_distance = approach.get("miss_distance", {}).get("kilometers", "")

            # Extract the hour from the time string
            hour = int(time.split(' ')[-1].split(':')[0])
            nh = int(time.split(' ')[-1].split(':')[0]) + 5
            nm = int(time.split(' ')[-1].split(':')[1]) + 30
            if nm >= 60:
                nm = nm - 60
                nh += 1
            if nm < 10:
                nm = "0" + str(nm)
            if nh >= 24:
                nh = nh - 24
            ntime = time.split(' ')[0] + " " + str(nh) + ":" + str(nm)
            # Check if the hour is between 1 pm and 5 am
            if hour in [13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 0, 1, 2, 3, 4]:
                parsed_data[index] = {
                    "name": name,
                    "time": ntime,
                    "miss_distance_km": miss_distance.split('.')[0]
                }

    return parsed_data


@app.route('/', methods=['GET'])
def asteroid_data():
    api_key = "NQqfruhp3Fu83JNTIpG0LBy2eHKfFkA5c9nmRb2c"

    # Set start and end dates to today's date
    global today
    app = Flask(__name__)
    current_time = datetime.now()
    new_time = current_time + timedelta(hours=11, minutes=30)
    today = new_time.strftime("%Y-%m-%d")

    start_date = str(today)
    end_date = str(today)

    data = get_asteroid_data(api_key, start_date, end_date)
    parsed_data = parse_asteroid_data(data)

    return jsonify(parsed_data)


if __name__ == "__main__":
    app.run(debug=False)
