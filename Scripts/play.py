import json
import base64
import argparse
from subprocess import run, PIPE


parser = argparse.ArgumentParser()
parser.add_argument("b64", help="b64 string for stream", type=str)
args = parser.parse_args()
parsed = args.b64.split('streamenhancer://', 1)[1]
decoded = base64.b64decode(parsed)
subscriber = json.loads(decoded)
url = subscriber['request']['url']
result= ""
for x in subscriber['request']['headers']:
    result += " --http-header \"%s=%s\"" %(x.pop('name'), x.pop('value'))
p = run(["streamlink", "-p mpv", url, "best"], stdout=PIPE, input=result, encoding='ascii')
print(p.returncode)
print(p.stdout)

