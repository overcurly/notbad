from flask import Flask, request

app = Flask(__name__)

@app.route("/", methods=["GET","POST"])
def home_route():
    print(request.headers)
    print('------')

    if request.method == "POST" and request.headers.get('NotBad') == "true":
        return "ReallyNotBad\n"

    return "Undefined\n"


if __name__ == '__main__':
    app.run(debug=True, host='localhost', port=8000)