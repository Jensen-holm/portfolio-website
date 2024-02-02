from flask import Flask, render_template, request

app = Flask(
    __name__,
    template_folder="templates",
    static_folder="css",
    static_url_path="/src/assets",
)

@app.route("/", methods=["GET"])
def index():
    return render_template("index.html")

@app.route("/hello/<name>", methods=["GET"])
def hello_name(name=None):
    return render_template("index.html", name=name)

if __name__ == "__main__":
    app.run()

