from flask import Flask, jsonify, make_response
from flask_httpauth import HTTPBasicAuth

app = Flask(__name__)

tasks = [
    {
        'id': 1,
        'title': 'Electronics',
        'description': u'Tablet, Mobile, Computer, Alexa, Television',
        'done': False
    },
    {
        'id': 2,
        'title': 'Languages',
        'description': u'Python, Java, C#, SQL, Mongo',
        'done': False
    }
]

auth = HTTPBasicAuth()


# Use for this method of authentication is not recommended
# This data should come from the database in an encrypted way
@auth.get_password
def get_password(username):
    if username == 'testuser':
        return 'python'
    return None


@auth.error_handler
def unauthorized():
    return make_response(jsonify({'error': 'Unauthorized access'}), 401)


@app.route('/tasks', methods=['GET'])
@auth.login_required
def get_tasks():
    return jsonify({'tasks': tasks})


if __name__ == '__main__':
    app.run(debug=False)
