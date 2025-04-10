from flask import Flask, render_template, request, send_file
import subprocess
import pandas as pd

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        fname = request.form['funcion']
        x0 = float(request.form['x0'])
        y0 = float(request.form['y0'])
        h = float(request.form['h'])
        xn = float(request.form['xn'])

        cmd = [
            'octave', '--quiet', '--eval',
            f"euler_solver('{fname}', {x0}, {y0}, {h}, {xn})"
        ]
        subprocess.run(cmd)

        data = pd.read_csv("resultado.csv", header=None)
        puntos = [{"x": round(row[0], 4), "y": round(row[1], 4)} for row in data.values]
        return render_template('index.html', puntos=puntos)

    return render_template('index.html', puntos=None)

if __name__ == '__main__':
    app.run(debug=True, port=5001)