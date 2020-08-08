import http.server
import socketserver
import os

PORT = 8901

# error: __file__ == 'pyhttpsserver.py'
# os.chdir(os.path.dirname(__file__))
# ok
# os.chdir(os.getcwd())

Handler = http.server.SimpleHTTPRequestHandler
httpd = socketserver.TCPServer(("", PORT), Handler)
print("serving at port", PORT)
httpd.serve_forever()
